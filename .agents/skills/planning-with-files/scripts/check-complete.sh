#!/usr/bin/env bash
cd "$(dirname "$(realpath "$0")")/../../../.." || exit 1
set -u

PLAN_FILE="task_plan.md"

if [ ! -f "$PLAN_FILE" ]; then
  echo "[planning-with-files] No task_plan.md found. Skipping check."
  exit 0
fi

INCOMPLETE=$(grep -cE "\*\*Status:\*\* (not_started|in_progress)" "$PLAN_FILE" 2>/dev/null | tr -d '\r' || echo "0")

if [ "$INCOMPLETE" -gt 0 ]; then
  echo "[planning-with-files] COMMIT BLOCKED: $INCOMPLETE phase(s) incomplete."
  echo "[planning-with-files] You MUST complete all phases before committing (GEMINI.md §commit-gate)."
  echo "[planning-with-files] Run /plan:status to see outstanding phases."
else
  echo "[planning-with-files] ALL PHASES COMPLETE. Commit gate passed."
fi
exit 0
