# planning-with-files: UserPrompt hook
$PLAN_FILE = "task_plan.md"
$PROGRESS_FILE = "progress.md"

if (Test-Path $PLAN_FILE) {
    Write-Host "`n=== [planning-with-files] USER INTERACTION ===================="
    Write-Host "[planning-with-files] You have received new input or feedback from the user."
    Write-Host "[planning-with-files] Ensure your next action aligns with the active phase in task_plan.md."
    Write-Host "[planning-with-files] If this input shifts priorities, update task_plan.md before continuing."
    Write-Host "===============================================================`n"
}
exit 0
