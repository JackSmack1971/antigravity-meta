#!/bin/bash
# planning-with-files: PostToolUse hook for Google Antigravity IDE
#
# Fires AFTER Write or Edit tool calls. Reminds the agent to update
# progress.md and, if a phase is now complete, update task_plan.md status.
#
# This hook is ADDITIVE — it does not modify any files itself. It emits
# a reminder that the agent processes in its next turn.
#
# Firing order: [Tool Executes] → THIS HOOK → [Agent continues]
#
# Antigravity hook contract: stdout injected into context; exit 0 = continue.

PLAN_FILE="task_plan.md"

if [ -f "$PLAN_FILE" ]; then
    echo "[planning-with-files] File modified. Update progress.md with what you just did."
    echo "[planning-with-files] If a planning phase is now complete, update its status in task_plan.md: in_progress → complete"
    echo "[planning-with-files] If all GSD Verify checks pass, update task.md current phase."
fi

exit 0
