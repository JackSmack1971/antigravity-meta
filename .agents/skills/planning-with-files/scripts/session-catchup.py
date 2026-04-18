#!/usr/bin/env python3
"""
Session Catchup Script for planning-with-files (Antigravity Edition)

Adapted for Google Antigravity IDE. Scans previous sessions for the last
planning file update, then collects all conversation context from that point
forward so the agent can resume from the correct GSD phase.

Supports:
- Claude Code (.claude/projects/)
- OpenCode (.local/share/opencode/storage/)
- Generic fallback (reads planning files directly)

Antigravity path convention: .agents/skills/planning-with-files/scripts/

Usage: python3 session-catchup.py [project-path]
"""

import json
import sys
import os
from pathlib import Path
from typing import List, Dict, Optional, Tuple

PLANNING_FILES = ['task_plan.md', 'progress.md', 'findings.md']


def detect_ide() -> str:
    if os.environ.get('OPENCODE_DATA_DIR'):
        return 'opencode'
    if os.environ.get('ANTIGRAVITY_SESSION_DIR'):
        return 'antigravity'
    claude_dir = Path.home() / '.claude'
    if claude_dir.exists():
        return 'claude-code'
    opencode_dir = Path.home() / '.local' / 'share' / 'opencode'
    if opencode_dir.exists():
        return 'opencode'
    return 'unknown'


def get_project_dir_claude(project_path: str) -> Path:
    sanitized = project_path.replace('/', '-')
    if not sanitized.startswith('-'):
        sanitized = '-' + sanitized
    sanitized = sanitized.replace('_', '-')
    return Path.home() / '.claude' / 'projects' / sanitized


def get_sessions_sorted(project_dir: Path) -> List[Path]:
    sessions = list(project_dir.glob('*.jsonl'))
    main_sessions = [s for s in sessions if not s.name.startswith('agent-')]
    return sorted(main_sessions, key=lambda p: p.stat().st_mtime, reverse=True)


def scan_for_planning_update(session_file: Path) -> Tuple[int, Optional[str]]:
    last_update_line = -1
    last_update_file = None
    try:
        with open(session_file, 'r') as f:
            for line_num, line in enumerate(f):
                if '"Write"' not in line and '"Edit"' not in line:
                    continue
                try:
                    data = json.loads(line)
                    if data.get('type') != 'assistant':
                        continue
                    content = data.get('message', {}).get('content', [])
                    if not isinstance(content, list):
                        continue
                    for item in content:
                        if item.get('type') != 'tool_use':
                            continue
                        if item.get('name', '') not in ('Write', 'Edit'):
                            continue
                        file_path = item.get('input', {}).get('file_path', '')
                        for pf in PLANNING_FILES:
                            if file_path.endswith(pf):
                                last_update_line = line_num
                                last_update_file = pf
                                break
                except json.JSONDecodeError:
                    continue
    except Exception:
        pass
    return last_update_line, last_update_file


def extract_messages_from_session(session_file: Path, after_line: int = -1) -> List[Dict]:
    result = []
    try:
        with open(session_file, 'r') as f:
            for line_num, line in enumerate(f):
                if after_line >= 0 and line_num <= after_line:
                    continue
                try:
                    msg = json.loads(line)
                except json.JSONDecodeError:
                    continue

                msg_type = msg.get('type')
                is_meta  = msg.get('isMeta', False)

                if msg_type == 'user' and not is_meta:
                    content = msg.get('message', {}).get('content', '')
                    if isinstance(content, list):
                        for item in content:
                            if isinstance(item, dict) and item.get('type') == 'text':
                                content = item.get('text', '')
                                break
                        else:
                            content = ''
                    if content and isinstance(content, str):
                        if content.startswith(('<local-command', '<command-', '<task-notification')):
                            continue
                        if len(content) > 20:
                            result.append({'role': 'user', 'content': content,
                                           'line': line_num, 'session': session_file.stem[:8]})

                elif msg_type == 'assistant':
                    msg_content = msg.get('message', {}).get('content', '')
                    text_content = ''
                    tool_uses = []
                    if isinstance(msg_content, str):
                        text_content = msg_content
                    elif isinstance(msg_content, list):
                        for item in msg_content:
                            if item.get('type') == 'text':
                                text_content = item.get('text', '')
                            elif item.get('type') == 'tool_use':
                                tn = item.get('name', '')
                                ti = item.get('input', {})
                                if tn in ('Edit', 'Write'):
                                    tool_uses.append(f"{tn}: {ti.get('file_path', 'unknown')}")
                                elif tn == 'Bash':
                                    tool_uses.append(f"Bash: {ti.get('command', '')[:80]}")
                                else:
                                    tool_uses.append(tn)
                    if text_content or tool_uses:
                        result.append({'role': 'assistant',
                                       'content': text_content[:600] if text_content else '',
                                       'tools': tool_uses, 'line': line_num,
                                       'session': session_file.stem[:8]})
    except Exception:
        pass
    return result


def main():
    project_path = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
    ide = detect_ide()

    # Antigravity and OpenCode: fall back to reading planning files directly
    if ide in ('antigravity', 'opencode', 'unknown'):
        for pf in PLANNING_FILES:
            if Path(pf).exists():
                print(f"\n[planning-with-files] Found {pf} in project root. Read it to restore context.")
        if ide == 'antigravity':
            print("[planning-with-files] Antigravity session history scanning not yet supported.")
            print("[planning-with-files] Read task_plan.md, progress.md, findings.md to restore context.")
        return

    # Claude Code path
    project_dir = get_project_dir_claude(project_path)
    if not project_dir.exists():
        return
    sessions = get_sessions_sorted(project_dir)
    if len(sessions) < 2:
        return

    previous_sessions = sessions[1:]
    update_session = None
    update_line = -1
    update_file = None
    update_session_idx = -1

    for idx, session in enumerate(previous_sessions):
        line, filename = scan_for_planning_update(session)
        if line >= 0:
            update_session = session
            update_line = line
            update_file = filename
            update_session_idx = idx
            break

    if not update_session:
        return

    all_messages = []
    all_messages.extend(extract_messages_from_session(update_session, after_line=update_line))
    intermediate_sessions = previous_sessions[:update_session_idx]
    for session in reversed(intermediate_sessions):
        all_messages.extend(extract_messages_from_session(session, after_line=-1))

    if not all_messages:
        return

    print(f"\n[planning-with-files] SESSION CATCHUP DETECTED (IDE: {ide})")
    print(f"Last planning update: {update_file} in session {update_session.stem[:8]}...")
    sessions_covered = update_session_idx + 1
    if sessions_covered > 1:
        print(f"Scanning {sessions_covered} sessions for unsynced context")
    print(f"Unsynced messages: {len(all_messages)}")
    print("\n--- UNSYNCED CONTEXT ---")

    MAX_MESSAGES = 100
    messages_to_show = all_messages[-MAX_MESSAGES:] if len(all_messages) > MAX_MESSAGES else all_messages
    if len(all_messages) > MAX_MESSAGES:
        print(f"(Showing last {MAX_MESSAGES} of {len(all_messages)} messages)\n")

    current_session = None
    for msg in messages_to_show:
        if msg.get('session') != current_session:
            current_session = msg.get('session')
            print(f"\n[Session: {current_session}...]")
        if msg['role'] == 'user':
            print(f"USER: {msg['content'][:300]}")
        else:
            if msg.get('content'):
                print(f"CLAUDE: {msg['content'][:300]}")
            if msg.get('tools'):
                print(f"  Tools: {', '.join(msg['tools'][:4])}")

    print("\n--- RECOMMENDED ---")
    print("1. Run: git diff --stat")
    print("2. Read: task_plan.md, progress.md, findings.md")
    print("3. Check: task.md and state.md for GSD phase alignment")
    print("4. Update planning files based on above context")
    print("5. Continue with task")


if __name__ == '__main__':
    main()
