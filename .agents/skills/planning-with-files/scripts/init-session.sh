#!/usr/bin/env bash
cd "$(dirname "$(realpath "$0")")/../../../.." || exit 1
set -u

PLAN_FILE="task_plan.md"
SPEC_FILE="SPEC.md"
FROM_SPEC=false
[[ "${1:-}" == "--from-spec" ]] && FROM_SPEC=true

if [ -f "$PLAN_FILE" ]; then
  echo "[planning-with-files] task_plan.md already exists. Skipping init."
  exit 0
fi

GOAL="[Derived from SPEC.md — update this line]"
if $FROM_SPEC && [ -f "$SPEC_FILE" ]; then
  GOAL="$(grep -m1 '##\|^#\|Goal\|Problem' "$SPEC_FILE" 2>/dev/null | head -c 120 || echo "$GOAL")"
fi

cat > "$PLAN_FILE" << EOF
# Task Plan
**Goal:** ${GOAL}
**Created:** $(date -u +%Y-%m-%dT%H:%M:%SZ)

## Phase 1: Spec
**Status:** in_progress
- [ ] Define requirements in SPEC.md

## Phase 2: Plan
**Status:** not_started

## Phase 3: Execute
**Status:** not_started

## Phase 4: Verify
**Status:** not_started

## Phase 5: Commit
**Status:** not_started

## Errors
| Error | Attempt # | Resolution | GSD Phase |
|-------|-----------|------------|-----------|
EOF
echo "[planning-with-files] task_plan.md initialized."
exit 0
