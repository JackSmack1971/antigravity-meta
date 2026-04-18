# planning-with-files: PostToolUse hook
$PLAN_FILE = "task_plan.md"
if (Test-Path $PLAN_FILE) {
    Write-Host "[planning-with-files] File modified. Update progress.md with what you just did."
    Write-Host "[planning-with-files] If a planning phase is now complete, update its status in task_plan.md: in_progress -> complete"
    Write-Host "[planning-with-files] If all GSD Verify checks pass, update task.md current phase."
}
exit 0
