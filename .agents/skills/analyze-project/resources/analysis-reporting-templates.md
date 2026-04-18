# Analysis Reporting Templates

This resource provide the standard structure for the `session_analysis_report.md`.

## Executive Summary Table

| Metric | Value | Rating |
|:---|:---|:---|
| First-Shot Success Rate | X% | 🟢/🟡/🔴 |
| Completion Rate | X% | 🟢/🟡/🔴 |
| Avg Scope Growth | X% | 🟢/🟡/🔴 |
| Avg Session Severity | X | 🟢/🟡/🔴 |

### Rating Thresholds
- **Success Rate**: 🟢 >70% | 🔴 <40%
- **Scope Growth**: 🟢 <15% | 🔴 >40%
- **Severity**: 🟢 <25 | 🔴 >50

## Friction Hotspot Map
Identify specific folders or subsystems where analysis consistently shows:
- High revision counts.
- Frequent abandonment.
- Recurring `REPO_FRAGILITY` root causes.

## Structured Recommendations
Format every intervention using this pattern:
- **Observed Pattern**: (e.g., "Auth tests failing repeatedly")
- **Likely Cause**: (e.g., "Brittle mock factories")
- **Evidence**: (e.g., "See resolved.3 logic in session X")
- **Change to Make**: (e.g., "Refactor AuthFactory to use ephemeral DB")
- **Expected Benefit**: (e.g., "Reduce verification churn by 50%")

## Comparative Cohorts
Compare **Clean Sessions** vs **High-Churn Sessions** to identify decisive prompt traits:
- Did first-shot successes always include a file manifest?
- Did abandoned sessions always lack explicit non-goals?
