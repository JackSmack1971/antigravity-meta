#!/bin/bash
# planning-with-files: Stop hook for Google Antigravity IDE
#
# Fires when the agent is about to stop. Checks whether all planning phases
# are complete. If phases are incomplete, injects a continuation message to
# keep the GSD loop running. This is the GSD "Commit gate" — only allow
# commit-level stopping when the plan is finished.
#
# IMPORTANT: This hook respects code-quality-git-testing.md. It does NOT
# force commits or bypass any git hooks. It only checks plan completion.
#
# Antigravity hook contract: stdout injected into context; exit 0 = proceed.

PLAN_FILE="task_plan.md"

# Locate check-complete.sh relative to this hook's directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CHECK_SCRIPT="$SCRIPT_DIR/../skills/planning-with-files/scripts/check-complete.sh"

if [ ! -f "$PLAN_FILE" ]; then
    # No plan = no planning session active; allow stop without comment.
    exit 0
fi

# Run the completion check
if [ -f "$CHECK_SCRIPT" ] && [ -x "$CHECK_SCRIPT" ]; then
    "$CHECK_SCRIPT" "$PLAN_FILE"
else
    # Fallback: inline check if script not found or not executable
    TOTAL=$(grep -c "### Phase" "$PLAN_FILE" 2>/dev/null || echo 0)
    COMPLETE=$(grep -cF "**Status:** complete" "$PLAN_FILE" 2>/dev/null || echo 0)
    IN_PROGRESS=$(grep -cF "**Status:** in_progress" "$PLAN_FILE" 2>/dev/null || echo 0)
    PENDING=$(grep -cF "**Status:** pending" "$PLAN_FILE" 2>/dev/null || echo 0)

    # Fallback: [complete] format
    if [ "$COMPLETE" -eq 0 ] && [ "$IN_PROGRESS" -eq 0 ] && [ "$PENDING" -eq 0 ]; then
        COMPLETE=$(grep -c "\[complete\]" "$PLAN_FILE" 2>/dev/null || echo 0)
        IN_PROGRESS=$(grep -c "\[in_progress\]" "$PLAN_FILE" 2>/dev/null || echo 0)
        PENDING=$(grep -c "\[pending\]" "$PLAN_FILE" 2>/dev/null || echo 0)
    fi

    if [ "$COMPLETE" -eq "$TOTAL" ] && [ "$TOTAL" -gt 0 ]; then
        echo "[planning-with-files] ALL PHASES COMPLETE ($COMPLETE/$TOTAL). If the user has additional work, add new phases to task_plan.md before starting."
    else
        echo "[planning-with-files] Task incomplete ($COMPLETE/$TOTAL phases done). Update progress.md, then read task_plan.md and continue working on the remaining phases."
        if [ "$IN_PROGRESS" -gt 0 ]; then
            echo "[planning-with-files] $IN_PROGRESS phase(s) still in_progress."
        fi
        if [ "$PENDING" -gt 0 ]; then
            echo "[planning-with-files] $PENDING phase(s) pending."
        fi
    fi
fi

exit 0
