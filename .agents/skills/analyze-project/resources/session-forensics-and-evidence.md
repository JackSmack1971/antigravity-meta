# Session Forensics and Evidence Extraction

This resource outlines the systematic process for gathering data from Antigravity sessions to support root cause analysis.

## Phase 1: Intent Classification

Before analysis, classify the session's primary goal to ensure appropriate evaluation standards.

| Intent | Description | Standard |
|--------|-------------|----------|
| **DELIVERY** | Narrow feature implementation. | Strict adherence to original ask. |
| **DEBUGGING** | Rescuing a broken feature or fixing a bug. | Success = stable verification. |
| **REFACTOR** | Structural changes without behavioral change. | Success = no regressions. |
| **RESEARCH** | Investigatory / "What if" sessions. | Success = clear findings/docs. |

## Phase 2: Evidence Gathering

Extract signals from the `brain/` directory for the specific conversation ID.

### Core Artifacts
- `task.md`: Check for item completion and additions.
- `implementation_plan.md`: Analyze technical approach for complexity/risk.
- `walkthrough.md`: Verify final state against initial objective.

### Iteration Signals
Count the `.resolved.N` snapshots for each artifact.
- **Many Revisions (>3)**: Indicates significant technical struggle or goal drift.
- **Timestamp Drift**: Compare `created_at` vs `completed_at` to find time-consuming bottlenecks.

### Secondary Signals
- **File Targeting**: Which subsystems were edited repeatedly?
- **Validation Language**: Did the agent mention failing tests or browser errors?
