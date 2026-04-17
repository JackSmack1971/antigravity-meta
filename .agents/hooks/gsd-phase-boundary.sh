#!/usr/bin/env bash
# gsd-hook-version: 1.32.0
# PostToolUse/AfterTool hook — Phase boundary detector.
#
# Fires after Write/Edit tool calls. When the edited file is a GSD
# phase artifact (SPEC.md, PLAN.md, VERIFY.md, SUMMARY.md, STATE.md)
# the hook appends a phase-boundary entry to .planning/session.log.
#
# The hook never blocks the tool call — any failure exits 0 silently.
# Stdin is the Claude Code / Antigravity tool-event JSON; we extract
# tool_input.file_path with a small grep fallback so we do not require
# jq at runtime.
set -u

input=""
# Drain stdin with a timeout so we never hang the runtime.
if [ -t 0 ]; then
  input=""
else
  input="$(timeout 2 cat 2>/dev/null || true)"
fi

extract_field() {
  # $1 = field name. Expects flat-ish JSON; tolerant to whitespace.
  printf '%s' "$input" | tr -d '\n' | \
    grep -oE "\"$1\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" | \
    head -n1 | sed -E "s/\"$1\"[[:space:]]*:[[:space:]]*\"([^\"]*)\"/\\1/"
}

file_path="$(extract_field file_path)"
cwd="$(extract_field cwd)"
[ -z "$cwd" ] && cwd="${CLAUDE_PROJECT_DIR:-$(pwd)}"

[ -z "$file_path" ] && exit 0

case "$(basename -- "$file_path")" in
  SPEC.md|PLAN.md|VERIFY.md|SUMMARY.md|STATE.md) ;;
  *) exit 0 ;;
esac

log_dir="$cwd/.planning"
[ -d "$log_dir" ] || exit 0

ts="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
printf '%s  phase-boundary  file=%s\n' "$ts" "$(basename -- "$file_path")" \
  >> "$log_dir/session.log" 2>/dev/null || true

exit 0
