# Root Cause and Severity Framework

This resource provides the analytical engine for determining why a session struggled and how "severe" that struggle was.

## Primary Root Causes

Every non-clean session must be assigned one of these:

| Code | Description | Intervention |
|------|-------------|--------------|
| `SPEC_AMBIGUITY` | Vague or missing requirements/targets. | Improve opening prompt. |
| `HUMAN_SCOPE_CHANGE` | User moved the goalposts mid-session. | Scope discipline. |
| `REPO_FRAGILITY` | Hidden coupling or brittle existing code. | targeted refactoring. |
| `AGENT_ARCH_ERROR` | Wrong assumptions or structural mistakes. | Better plan/skill use. |
| `VERIFICATION_CHURN` | Implementation works but testing is looping. | Improve test harness. |
| `LEGAL_COMPLEXITY` | Revisions were justified by difficulty. | No action needed. |

## Severity Scoring (0-100)

Use the weighted sum below to prioritize sessions for deeper review.

### Components
1. **Completion Failure** (0-25): `Abandoned = 25`.
2. **Replanning Intensity** (0-15): Count of `implementation_plan.resolved.N`.
3. **Scope Instability** (0-15): Major changes between initial and final plan.
4. **Prompt Deficit** (0-10): `Low Sufficiency = 10`.
5. **Cause Multiplier** (0-10): `REPO_FRAGILITY` or `AGENT_ERROR` add weight.

### Severity Bands
- **0–39 Moderate**: Minor friction, eventually resolved.
- **40–69 Significant**: Significant rework or major scope growth.
- **70–100 Critical**: Abandonment or absolute architectural failure.
