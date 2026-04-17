#!/usr/bin/env bash
# gsd-hook-version: 1.32.0
# PreToolUse/BeforeTool hook — guards `git commit` invocations.
#
# Fires before Bash tool calls. When the command is a git commit and the
# message is obviously empty, too short, or missing a Conventional Commit
# type prefix, the hook prints an advisory to stderr. Never blocks — the
# commit still proceeds (exit 0). The goal is to surface accidental
# "test", "wip", or untyped commits before they land on the branch.
#
# Rules enforced (advisory only):
#   * -m "<msg>" is present.
#   * <msg> length >= 10 chars.
#   * <msg> starts with a Conventional Commit type
#     (feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)[(scope)]?!?:
set -u

input=""
if [ ! -t 0 ]; then
  input="$(timeout 2 cat 2>/dev/null || true)"
fi

# Extract tool_name and command strings without requiring jq.
tool_name="$(printf '%s' "$input" | tr -d '\n' | \
  grep -oE '"tool_name"[[:space:]]*:[[:space:]]*"[^"]*"' | \
  head -n1 | sed -E 's/.*"([^"]*)"$/\1/')"

[ "$tool_name" = "Bash" ] || exit 0

command_str="$(printf '%s' "$input" | tr -d '\n' | \
  grep -oE '"command"[[:space:]]*:[[:space:]]*"([^"\\]|\\.)*"' | \
  head -n1 | sed -E 's/^"command"[[:space:]]*:[[:space:]]*"(.*)"$/\1/')"

[ -z "$command_str" ] && exit 0

# Only interested in `git commit` invocations.
printf '%s' "$command_str" | grep -qE '(^|[^[:alnum:]_-])git[[:space:]]+commit([[:space:]]|$)' || exit 0

# Extract -m "<msg>" (best-effort; HEREDOCs are opaque and skipped).
msg="$(printf '%s' "$command_str" | \
  grep -oE -- '-m[[:space:]]+"[^"]*"' | head -n1 | \
  sed -E 's/^-m[[:space:]]+"(.*)"$/\1/')"

if [ -z "$msg" ]; then
  # Nothing we can reason about (amend, HEREDOC, interactive editor, etc.)
  exit 0
fi

warn() {
  printf 'GSD commit advisory: %s\n' "$1" 1>&2
}

if [ "${#msg}" -lt 10 ]; then
  warn "commit message is very short (${#msg} chars): \"$msg\""
fi

if ! printf '%s' "$msg" | \
    grep -qE '^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([^)]+\))?!?:[[:space:]]+'; then
  warn "commit message is missing Conventional Commit prefix (e.g. \"feat:\", \"fix(scope):\")."
fi

exit 0
