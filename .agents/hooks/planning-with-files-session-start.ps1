# planning-with-files: SessionStart hook
$PLAN_FILE = "task_plan.md"
$PROGRESS_FILE = "progress.md"

$SKILL_ROOT = ".agents/skills/planning-with-files"
$CATCHUP_SCRIPT = "$SKILL_ROOT/scripts/session-catchup.py"

if ((Test-Path $CATCHUP_SCRIPT) -and (Get-Command python -ErrorAction SilentlyContinue)) {
    python $CATCHUP_SCRIPT (Get-Location).Path
}

if (Test-Path $PLAN_FILE) {
    Write-Host "`n=== [planning-with-files] SESSION CONTEXT RESTORED ==="
    Write-Host "--- task_plan.md (first 50 lines) ---"
    Get-Content $PLAN_FILE -TotalCount 50
    Write-Host "`n"

    if (Test-Path $PROGRESS_FILE) {
        Write-Host "--- progress.md (last 20 lines) ---"
        Get-Content $PROGRESS_FILE | Select-Object -Last 20
        Write-Host "`n"
    }

    Write-Host "[planning-with-files] Active plan found. Read findings.md for research context."
    Write-Host "[planning-with-files] Continue from the current GSD phase shown above."
    Write-Host "[planning-with-files] All 6 GSD core rules remain enforced."
    Write-Host "======================================================`n"
}
exit 0
