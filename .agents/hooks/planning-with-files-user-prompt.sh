#!/bin/bash
# planning-with-files: UserPromptSubmit hook for Google Antigravity IDE
#
# Fires when the user submits a new prompt. If an active plan exists, injects
# the current state at the top of context so the agent always knows where it is
# in the GSD lifecycle without the user needing to re-explain.
#
# This is the "context refresh" mechanism — analogous to Manus's todo.md recitation.
#
# Antigravity hook contract: stdout injected into context; exit 0 = proceed.

PLAN_FILE="task_plan.md"
PROGRESS_FILE="progress.md"

if [ -f "$PLAN_FILE" ]; then
    echo ""
    echo "=== [planning-with-files] ACTIVE PLAN — current state: ==="
    head -50 "$PLAN_FILE"
    echo ""

    if [ -f "$PROGRESS_FILE" ]; then
        echo "=== recent progress ==="
        tail -20 "$PROGRESS_FILE"
        echo ""
    fi

    echo "[planning-with-files] Read findings.md for research context."
    echo "[planning-with-files] Continue from the current GSD phase. All 6 core rules enforced."
    echo "============================================================"
    echo ""
fi

exit 0
