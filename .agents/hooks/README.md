# GSD Hooks — Dual-Runtime Convention

This directory holds the GSD hook scripts. The framework is designed to run
under **both** Claude Code and Google Antigravity (Gemini), which use
different hook-event naming conventions:

| Event (semantic) | Claude Code  | Antigravity / Gemini |
| ---------------- | ------------ | -------------------- |
| before a tool    | `PreToolUse` | `BeforeTool`         |
| after a tool     | `PostToolUse`| `AfterTool`          |

## How we stay compatible

1. **`settings.json`** uses the Antigravity names (`BeforeTool` / `AfterTool`)
   because this repository lives under `.agents/`, which is Antigravity's
   config directory. Claude Code ignores this file; Claude Code users wire
   up their own `.claude/settings.json` pointing at the same scripts with
   `PreToolUse` / `PostToolUse`.

2. **Every JS hook** detects the active runtime and emits the matching
   `hookSpecificOutput.hookEventName` value:

   ```js
   const preToolEvent  = process.env.GEMINI_API_KEY ? 'BeforeTool' : 'PreToolUse';
   const postToolEvent = process.env.GEMINI_API_KEY ? 'AfterTool'  : 'PostToolUse';
   ```

   `GEMINI_API_KEY` is set by the Antigravity / Gemini CLI runtime.

3. **Shell hooks** (`*.sh`) do not emit `hookSpecificOutput`; they only
   write to stderr / log files. They are runtime-agnostic.

## Script inventory

| Script                    | Event (Antigravity) | Purpose                                           |
| ------------------------- | ------------------- | ------------------------------------------------- |
| `gsd-check-update.js`     | `SessionStart`      | Background `npm view` for GSD update checks       |
| `gsd-session-state.sh`    | `SessionStart`      | Emits FSM-stage banner, writes `session.log`      |
| `gsd-context-monitor.js`  | `AfterTool`         | Agent-facing context-usage warnings               |
| `gsd-phase-boundary.sh`   | `AfterTool`         | Logs GSD phase-artifact edits                     |
| `gsd-prompt-guard.js`     | `BeforeTool`        | Prompt-injection scan on `.planning/` writes      |
| `gsd-read-guard.js`       | `BeforeTool`        | Read-before-edit advisory                         |
| `gsd-workflow-guard.js`   | `BeforeTool`        | Advisory when editing outside a GSD workflow      |
| `gsd-validate-commit.sh`  | `BeforeTool` (Bash) | Conventional Commit advisory on `git commit`      |
| `gsd-statusline.js`       | `statusLine`        | Status-line renderer + ctx-bridge writer          |

All hooks are **advisory, never blocking** — every error path exits 0.

## Enabling `gsd-workflow-guard.js`

The workflow guard is wired into `settings.json` but gated by
`.planning/config.json`:

```json
{ "hooks": { "workflow_guard": true } }
```

If the flag is absent or false (the default), the guard is a no-op. This
avoids spamming warnings outside a GSD-tracked project.
