#!/bin/bash
# .agents/hooks/gsd-version-bump.sh
# Enforcement hook for [Rule:SemVerEnforcer]

# Detect if AGENTS.md version line was modified manually
if git diff --cached AGENTS.md | grep -q '^[+-].*v[0-9]\+\.[0-9]\+\.[0-9]\+-hardening'; then
  # Check if commit message follows the automation pattern
  # (In a real hook, we'd check the message, but in BeforeTool we can only advise)
  echo "{\"additionalContext\": \"[GOVERNANCE] Manual version edits detected in AGENTS.md. Please use /release instead of manual modification to ensure SemVer integrity.\"}"
fi
