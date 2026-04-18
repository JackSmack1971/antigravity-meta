#!/bin/bash
# planning-with-files: PreToolUse hook for Google Antigravity IDE
#
# Fires BEFORE every tool call matching Write|Edit|Bash|Read|Glob|Grep.
# Re-reads task_plan.md (first 30 lines) to keep the current plan in
# the model's attention window — critical for long GSD Execute phases.
#
# Execution order in GSD lifecycle:
#   [GSD Phase Start] → THIS HOOK → [Tool Executes] → PostToolUse hook
#
# This hook NEVER blocks tool execution. It never bypasses:
#   - code-quality-git-testing.md (all quality gates remain active)
#   - security-mandate.md (security checks are not circumvented)
#   - Any of the other 4 core rules
#
# Antigravity hook contract: stdout injected into context; exit 0 = allow.

PLAN_FILE="task_plan.md"

if [ -f "$PLAN_FILE" ]; then
    # Inject plan context (first 30 lines) into the model's attention window.
    # This implements Manus Principle 4: Manipulate Attention Through Recitation.
    echo "[planning-with-files] Active plan (re-read before tool call):"
    head -30 "$PLAN_FILE"
    echo ""
fi

# Always allow — this hook is read-only and purely informational.
exit 0
