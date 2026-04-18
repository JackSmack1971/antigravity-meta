# planning-with-files: PreToolUse hook
$PLAN_FILE = "task_plan.md"
if (Test-Path $PLAN_FILE) {
    Write-Host "[planning-with-files] Active plan (re-read before tool call):"
    Get-Content $PLAN_FILE -TotalCount 30
    Write-Host "`n"
}
exit 0
