$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location (Resolve-Path "$scriptDir/../../../..").Path

$PlanFile = "task_plan.md"
if (-not (Test-Path $PlanFile)) {
    Write-Host "[planning-with-files] No task_plan.md found. Skipping check."
    exit 0
}

$Incomplete = (Get-Content $PlanFile |
    Where-Object { $_ -match "\*\*Status:\*\* (not_started|in_progress)" }).Count

if ($Incomplete -gt 0) {
    Write-Host "[planning-with-files] COMMIT BLOCKED: $Incomplete phase(s) incomplete."
    Write-Host "[planning-with-files] You MUST complete all phases before committing (GEMINI.md §commit-gate)."
    Write-Host "[planning-with-files] Run /plan:status to see outstanding phases."
} else {
    Write-Host "[planning-with-files] ALL PHASES COMPLETE. Commit gate passed."
}
exit 0
