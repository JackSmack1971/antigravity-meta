# planning-with-files: Stop hook
$PLAN_FILE = "task_plan.md"
if (Test-Path $PLAN_FILE) {
    Write-Host "=== [planning-with-files] SESSION END ==="
    
    $checkScript = ".agents/skills/planning-with-files/scripts/check-complete.ps1"
    if (Test-Path $checkScript) {
        & pwsh $checkScript
    }

    Write-Host "[planning-with-files] GSD cycle terminating."
    Write-Host "=========================================`n"
}
exit 0
