# Initialize planning files for a new GSD session (PowerShell)
# Usage: .\init-session.ps1 [-Template TYPE] [-FromSpec] [project-name]
#
# Adapted for Google Antigravity IDE (.agents/ plural convention)
# Templates: default, analytics
# -FromSpec: derive phase names from SPEC.md if present

param(
    [string]$ProjectName = "project",
    [string]$Template    = "default",
    [switch]$FromSpec
)

$DATE = Get-Date -Format "yyyy-MM-dd"

# Resolve template directory — skill root is one level up from scripts/
$ScriptDir   = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillRoot   = Split-Path -Parent $ScriptDir
$TemplateDir = Join-Path $SkillRoot "templates"

Write-Host "Initializing planning files for: $ProjectName (template: $Template)"

# Validate template
if ($Template -ne "default" -and $Template -ne "analytics") {
    Write-Host "Unknown template: $Template (available: default, analytics). Using default."
    $Template = "default"
}

# --- Derive spec goal if -FromSpec ---
$SpecGoal = "[One sentence describing the end state — copy from SPEC.md Goal section]"
$GsdPhase = "Plan"
if ($FromSpec -and (Test-Path "SPEC.md")) {
    $specLines = Get-Content "SPEC.md"
    $goalIdx   = ($specLines | Select-String -Pattern "^## Goal" | Select-Object -First 1).LineNumber
    if ($goalIdx) {
        $candidate = ($specLines[$goalIdx..($goalIdx+2)] | Where-Object { $_ -notmatch "^#" -and $_.Trim() -ne "" } | Select-Object -First 1)
        if ($candidate) { $SpecGoal = $candidate.Trim() }
    }
    Write-Host "Detected SPEC.md — deriving plan from spec."
}

# --- Create task_plan.md ---
if (-not (Test-Path "task_plan.md")) {
    $AnalyticsPlan = Join-Path $TemplateDir "analytics_task_plan.md"
    if ($Template -eq "analytics" -and (Test-Path $AnalyticsPlan)) {
        Copy-Item $AnalyticsPlan "task_plan.md"
    } else {
        @"
# Task Plan: $ProjectName

## Goal
$SpecGoal

## SPEC.md Alignment
- **SPEC.md last read:** $DATE
- **Key spec requirements addressed:**
  - [ ] [Requirement 1 from SPEC.md]
  - [ ] [Requirement 2 from SPEC.md]

## GSD Current Phase
GSD Phase: $GsdPhase
Planning Phase: Phase 1

## Phases

### Phase 1: Requirements & Discovery
- [ ] Read and summarize SPEC.md
- [ ] Identify constraints and acceptance criteria
- [ ] Document discoveries in findings.md
- [ ] Update state.md pointer: "See findings.md for research context"
- **Status:** in_progress

### Phase 2: Architecture & Planning
- [ ] Define technical approach
- [ ] Create project structure (if needed)
- [ ] Document decisions with rationale
- [ ] Confirm no conflicts with .agents/rules/ constraints
- **Status:** pending

### Phase 3: Implementation
- [ ] Execute plan step by step (following code-quality-git-testing.md)
- [ ] Write code to files before executing
- [ ] Test incrementally
- [ ] Update progress.md after each significant action
- **Status:** pending

### Phase 4: Testing & Verification
- [ ] Verify all spec requirements met
- [ ] Document test results in progress.md
- [ ] Fix any issues (3-Strike protocol)
- [ ] Confirm security-mandate.md compliance
- **Status:** pending

### Phase 5: Delivery & Commit
- [ ] Review all output files
- [ ] Deliverables meet SPEC.md acceptance criteria
- [ ] All planning phases complete -> run check-complete.ps1
- [ ] Commit following code-quality-git-testing.md conventions
- **Status:** pending

## Decisions Made
| Decision | Rationale | GSD Phase |
|----------|-----------|-----------|

## Errors Encountered
| Error | Attempt | Resolution | Phase |
|-------|---------|------------|-------|
"@ | Out-File -FilePath "task_plan.md" -Encoding UTF8
    }
    Write-Host "Created task_plan.md"
} else {
    Write-Host "task_plan.md already exists, skipping"
}

# --- Create findings.md ---
if (-not (Test-Path "findings.md")) {
    @"
# Findings & Decisions

## state.md Sync Status
- **Last synced to state.md:** not yet
- **state.md pointer added:** No

## Requirements

## Spec Analysis

## Research Findings

## Technical Decisions
| Decision | Rationale | Conflicts with rules? |
|----------|-----------|-----------------------|

## Security Considerations
| Finding | Risk Level | Mitigation |
|---------|------------|------------|

## Issues Encountered
| Issue | Resolution | GSD Phase |
|-------|------------|-----------|

## Resources

## Visual/Browser Findings

---
*Update after every 2 view/browser/search operations (2-Action Rule)*
*After updating, add/refresh pointer in state.md: "Research context: See findings.md"*
"@ | Out-File -FilePath "findings.md" -Encoding UTF8
    Write-Host "Created findings.md"
} else {
    Write-Host "findings.md already exists, skipping"
}

# --- Create progress.md ---
if (-not (Test-Path "progress.md")) {
    @"
# Progress Log

## task.md Sync Status
- **Last synced to task.md:** not yet
- **task.md current phase updated:** No

## Session: $DATE

### GSD Context
- **GSD Phase:** Plan
- **Planning Phase:** Phase 1
- **Started:** $DATE

### Actions Taken
-

### GSD Phase Transitions
| From | To | Trigger | Timestamp |
|------|----|---------|-----------|

### Files Created/Modified
| File | Action | Notes |
|------|--------|-------|

### Test Results
| Test | Input | Expected | Actual | Status |
|------|-------|----------|--------|--------|

### Error Log
| Timestamp | Error | Attempt | Resolution |
|-----------|-------|---------|------------|

## 5-Question Reboot Check
| Question | Answer |
|----------|--------|
| Where am I? (GSD Phase) | GSD: Plan / Planning: Phase 1 |
| Where am I going? | Phases 2-5 |
| What's the goal? | [from task_plan.md Goal] |
| What have I learned? | See findings.md |
| What have I done? | Session started |
"@ | Out-File -FilePath "progress.md" -Encoding UTF8
    Write-Host "Created progress.md"
} else {
    Write-Host "progress.md already exists, skipping"
}

# --- Remind to update state.md ---
if ((Test-Path "state.md") -and -not (Select-String -Path "state.md" -Pattern "findings.md" -Quiet 2>$null)) {
    Write-Host ""
    Write-Host "REMINDER: Add this pointer to state.md:"
    Write-Host "  Research context: See findings.md"
}

Write-Host ""
Write-Host "Planning files initialized for Antigravity GSD workflow!"
Write-Host "Files: task_plan.md, findings.md, progress.md"
Write-Host "Skill: .agents/skills/planning-with-files/"
Write-Host "Hooks: .agents/hooks/planning-with-files-*.ps1"
