# Reliability Engineering: SLIs and SLOs

This resource provides a framework for measuring and managing system reliability using SRE principles.

## The Hierarchy of Reliability

1. **SLIs (Service Level Indicators)**: The quantitative measure of level of service (e.g., Request Latency).
2. **SLOs (Service Level Objectives)**: Target values for SLIs (e.g., 99.9% of requests < 200ms).
3. **Error Budgets**: The amount of "unreliability" allowed (1 minus the SLO target).

### Error Budget Management
If the error budget is exhausted:
- Freeze non-emergency releases.
- Prioritize reliability fixes in the next sprint.
- Perform a deep audit of the failure surface.

## Reliability Patterns

### Burn Rate Analysis
Measuring how fast you are consuming the error budget. A high burn rate triggers immediate paging, even if the absolute failure count is still low.

### Chaos Engineering
Proactively testing system resilience by injecting faults (e.g., killing pods, increasing network latency).
- **Tools**: Chaos Monkey, Gremlin, LitmusChaos.
- **Goal**: Verify that monitoring detects the fault and alerting triggers correctly.

### Circuit Breakers
Software pattern to prevent cascading failures. If a downstream service is failing, the circuit breaker "opens," returning a cached response or an immediate error instead of timing out.
