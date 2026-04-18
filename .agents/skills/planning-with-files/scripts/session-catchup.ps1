$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location (Resolve-Path "$scriptDir/../../../..").Path

param([string]$ProjectRoot = (Get-Location).Path)
$PlanFile = Join-Path $ProjectRoot "task_plan.md"
$ProgressFile = Join-Path $ProjectRoot "progress.md"

if (-not (Test-Path $PlanFile)) { exit 0 }

$Lines = Get-Content $PlanFile
$Goal = ($Lines |
    Where-Object { $_ -match "\*\*Goal:\*\*" } |
    Select-Object -First 1) -replace "\*\*Goal:\*\*", "" -replace "^\s+|\s+$", ""
if (-not $Goal) { $Goal = "unknown" }
$Active = $Lines |
    Where-Object { $_ -match "in_progress" } |
    Select-Object -First 1

Write-Host "`n[planning-with-files] CATCHUP: goal=$Goal"
if ($Active) {
    Write-Host "[planning-with-files] ACTIVE PHASE: $($Active.Trim())"
} else {
    Write-Host "[planning-with-files] All phases complete or no active phase."
}

if (Test-Path $ProgressFile) {
    $Tail = Get-Content $ProgressFile | Select-Object -Last 5
    Write-Host "[planning-with-files] LAST PROGRESS:"
    $Tail | ForEach-Object { Write-Host "  $_" }
}
Write-Host ""
exit 0
