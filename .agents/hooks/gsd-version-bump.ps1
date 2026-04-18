# .agents/hooks/gsd-version-bump.ps1
# Enforcement hook for [Rule:SemVerEnforcer]

# Detect if AGENTS.md version line was modified manually
$diff = git diff --cached AGENTS.md
if ($diff -match '^[+-].*v[0-9]+\.[0-9]+\.[0-9]+-hardening') {
    Write-Output '{"additionalContext": "[GOVERNANCE] Manual version edits detected in AGENTS.md. Please use /release instead of manual modification to ensure SemVer integrity."}'
}
