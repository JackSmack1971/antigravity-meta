# Task Plan: [Brief Description]
<!--
  GSD INTEGRATION NOTE:
  This file is the detailed artifact for the GSD Plan phase.
  It supplements task.md (which holds atomic GSD state) with phase-level detail.
  SPEC.md is the source of truth — derive all phases from it.
  DO NOT duplicate task.md content here — add detail, not redundancy.
-->

## Goal
<!-- Derived from SPEC.md. One clear sentence describing the end state. -->
[One sentence describing the end state — copy from SPEC.md Goal section]

## SPEC.md Alignment
<!-- Link this plan back to the spec to prevent drift. -->
- **SPEC.md last read:** [timestamp]
- **Key spec requirements addressed:**
  - [ ] [Requirement 1 from SPEC.md]
  - [ ] [Requirement 2 from SPEC.md]

## GSD Current Phase
<!-- Keep in sync with task.md "Current Phase" field. -->
GSD Phase: [Spec | Plan | Execute | Verify | Commit]
Planning Phase: Phase 1

## Phases

### Phase 1: Requirements & Discovery
<!-- Understand the spec, gather constraints, populate findings.md. -->
- [ ] Read and summarize SPEC.md
- [ ] Identify constraints and acceptance criteria
- [ ] Document discoveries in findings.md
- [ ] Update state.md pointer: "See findings.md for research context"
- **Status:** in_progress
<!-- STATUS VALUES: pending | in_progress | complete -->

### Phase 2: Architecture & Planning
<!-- Define approach. Derive structure from spec. Document decisions with rationale. -->
- [ ] Define technical approach
- [ ] Create project structure (if needed)
- [ ] Document decisions with rationale in Decisions table below
- [ ] Confirm no conflicts with existing .agents/rules/ constraints
- **Status:** pending

### Phase 3: Implementation
<!-- GSD Execute phase. PreToolUse re-reads this plan before every action. -->
- [ ] Execute plan step by step (following code-quality-git-testing.md)
- [ ] Write code to files before executing
- [ ] Test incrementally
- [ ] Update progress.md after each significant action
- **Status:** pending

### Phase 4: Testing & Verification
<!-- GSD Verify phase. Log all test results in progress.md. -->
- [ ] Verify all spec requirements met
- [ ] Document test results in progress.md Test Results table
- [ ] Fix any issues found (use 3-Strike protocol)
- [ ] Confirm security-mandate.md compliance
- **Status:** pending

### Phase 5: Delivery & Commit
<!-- GSD Commit phase. Only commit when all phases complete. -->
- [ ] Review all output files
- [ ] Ensure deliverables meet SPEC.md acceptance criteria
- [ ] All planning phases complete → run check-complete.sh
- [ ] Commit following code-quality-git-testing.md conventions
- **Status:** pending

## Key Questions
<!-- Important questions to answer. Answer inline as discovered. -->
1. [Question derived from SPEC.md]
2. [Constraint to verify]

## Decisions Made
<!-- Technical and design decisions with rationale. Update as you make choices. -->
| Decision | Rationale | GSD Phase |
|----------|-----------|-----------|
|          |           |           |

## Errors Encountered
<!-- Log EVERY error immediately. Prevents repetition. See also: progress.md Error Log. -->
| Error | Attempt | Resolution | Phase |
|-------|---------|------------|-------|
|       | 1       |            |       |

## Notes
<!--
  REMINDERS:
  - Derive phases from SPEC.md, not from assumptions
  - Update phase status: pending → in_progress → complete
  - Re-read this plan before GSD phase transitions
  - Update task.md current-phase pointer when this plan advances
  - findings.md feeds state.md; progress.md augments task.md
-->
- Re-read before GSD phase transitions to prevent goal drift
- findings.md → state.md (pointer); progress.md → task.md (augment)
- All 6 core rules enforced at all times
