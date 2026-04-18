$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location (Resolve-Path "$scriptDir/../../../..").Path

param([string]$Flag = "")
$PLAN_FILE = "task_plan.md"
$SPEC_FILE = "SPEC.md"
$FromSpec = $Flag -eq "--from-spec"

if (Test-Path $PLAN_FILE) {
    Write-Host "[planning-with-files] task_plan.md already exists. Skipping init."
    exit 0
}

$Goal = "[Derived from SPEC.md — update this line]"
if ($FromSpec -and (Test-Path $SPEC_FILE)) {
    $Line = Get-Content $SPEC_FILE |
        Where-Object { $_ -match "^#|Goal|Problem" } |
        Select-Object -First 1
    if ($Line) { $Goal = $Line.Substring(0, [Math]::Min(120, $Line.Length)) }
}

$TS = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ")
$Content = @"
# Task Plan
**Goal:** $Goal
**Created:** $TS

## Phase 1: Spec
**Status:** in_progress
- [ ] Define requirements in SPEC.md

## Phase 2: Plan
**Status:** not_started

## Phase 3: Execute
**Status:** not_started

## Phase 4: Verify
**Status:** not_started

## Phase 5: Commit
**Status:** not_started

## Errors
| Error | Attempt # | Resolution | GSD Phase |
|-------|-----------|------------|-----------|
"@
Set-Content $PLAN_FILE $Content
Write-Host "[planning-with-files] task_plan.md initialized."
exit 0
