# Check if all phases in task_plan.md are complete
# Always exits 0 — uses stdout for status reporting
# Used by Stop hook to report task completion status
#
# Adapted for Google Antigravity IDE (.agents/ convention)

param([string]$PlanFile = "task_plan.md")

if (-not (Test-Path $PlanFile)) {
    Write-Host '[planning-with-files] No task_plan.md found -- no active planning session.'
    exit 0
}

$content     = Get-Content $PlanFile -Raw
$total       = ([regex]::Matches($content, "### Phase")).Count
$complete    = ([regex]::Matches($content, "\*\*Status:\*\* complete")).Count
$inProgress  = ([regex]::Matches($content, "\*\*Status:\*\* in_progress")).Count
$pending     = ([regex]::Matches($content, "\*\*Status:\*\* pending")).Count

if ($complete -eq 0 -and $inProgress -eq 0 -and $pending -eq 0) {
    $complete   = ([regex]::Matches($content, "\[complete\]")).Count
    $inProgress = ([regex]::Matches($content, "\[in_progress\]")).Count
    $pending    = ([regex]::Matches($content, "\[pending\]")).Count
}

if ($complete -eq $total -and $total -gt 0) {
    Write-Host "[planning-with-files] ALL PHASES COMPLETE ($complete/$total). GSD Commit phase may proceed."
    Write-Host "[planning-with-files] Ensure code-quality-git-testing.md requirements are met before committing."
} else {
    Write-Host "[planning-with-files] Task in progress ($complete/$total phases complete). Update progress.md before stopping."
    if ($inProgress -gt 0) { Write-Host "[planning-with-files] $inProgress phase(s) still in progress." }
    if ($pending    -gt 0) { Write-Host "[planning-with-files] $pending phase(s) pending." }
}
exit 0
