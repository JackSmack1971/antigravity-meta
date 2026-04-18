#!/bin/bash
# planning-with-files: SessionStart hook for Google Antigravity IDE
#
# Fires when Agent Manager starts a new session. Restores planning context
# so the agent resumes from the correct GSD phase without manual re-invocation.
#
# This hook is ADDITIVE — it never blocks other session-start logic and
# never bypasses any of the 6 GSD core rules.
#
# Antigravity hook contract: always exits 0; output is injected into session context.

PLAN_FILE="task_plan.md"
PROGRESS_FILE="progress.md"
FINDINGS_FILE="findings.md"

# --- Session recovery: attempt session-catchup.py ---
SKILL_ROOT=".agents/skills/planning-with-files"
CATCHUP_SCRIPT="$SKILL_ROOT/scripts/session-catchup.py"

if [ -f "$CATCHUP_SCRIPT" ] && command -v python3 >/dev/null 2>&1; then
    python3 "$CATCHUP_SCRIPT" "$(pwd)" 2>/dev/null || true
elif [ -f "$CATCHUP_SCRIPT" ] && command -v python >/dev/null 2>&1; then
    python "$CATCHUP_SCRIPT" "$(pwd)" 2>/dev/null || true
fi

# --- Restore planning context ---
if [ -f "$PLAN_FILE" ]; then
    echo ""
    echo "=== [planning-with-files] SESSION CONTEXT RESTORED ==="
    echo "--- task_plan.md (first 50 lines) ---"
    head -50 "$PLAN_FILE"
    echo ""

    if [ -f "$PROGRESS_FILE" ]; then
        echo "--- progress.md (last 20 lines) ---"
        tail -20 "$PROGRESS_FILE"
        echo ""
    fi

    echo "[planning-with-files] Active plan found. Read findings.md for research context."
    echo "[planning-with-files] Continue from the current GSD phase shown above."
    echo "[planning-with-files] All 6 GSD core rules remain enforced."
    echo "======================================================"
    echo ""
fi

exit 0
