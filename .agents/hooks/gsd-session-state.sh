#!/usr/bin/env bash
# gsd-hook-version: 1.32.0
# SessionStart hook — initializes the GSD blackboard for the active session.
#
# Responsibilities:
#   1. Ensure .planning/ exists (created on first GSD task).
#   2. Emit a short session banner to stderr so the user knows which stage
#      the FSM is in on session open.
#   3. Never block session start — every failure mode exits 0.
#
# Reads  (optional): state.md, .planning/STATE.md
# Writes (optional): .planning/session.log
set -u

cwd="${CLAUDE_PROJECT_DIR:-$(pwd)}"
planning_dir="$cwd/.planning"
state_md="$cwd/state.md"
session_log="$planning_dir/session.log"

# Ensure planning dir exists if GSD is active; never create it unsolicited.
if [ -f "$planning_dir/STATE.md" ] || [ -f "$state_md" ]; then
  mkdir -p "$planning_dir" 2>/dev/null || true
fi

stage="unknown"
if [ -f "$state_md" ]; then
  stage="$(grep -m1 -E '^\*\*Current Stage:' "$state_md" 2>/dev/null | sed -E 's/^\*\*Current Stage:\s*([A-Z_][A-Z0-9_]*).*/\1/' | head -c 64)"
  [ -z "$stage" ] && stage="unknown"
fi

ts="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

if [ -d "$planning_dir" ]; then
  printf '%s  session-start  stage=%s\n' "$ts" "$stage" >> "$session_log" 2>/dev/null || true
fi

# Non-blocking banner on stderr (visible to user, not injected into agent).
printf 'GSD session ready. Stage=%s\n' "$stage" 1>&2

exit 0
