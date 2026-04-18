# Agent Failure Modes and Mitigations

Multi-agent systems introduce unique reliability challenges. This resource outlines common failures and technical solutions.

## Common Failures

| Failure Mode | Symptom | Mitigation |
|--------------|---------|------------|
| **Supervisor Bottleneck** | Supervisor context becomes saturated with worker history. | Use **Checkpointing** to persist state; enforce strict summary schemas for workers. |
| **Coordination Overhead** | Token usage and latency explode without corresponding quality gain. | Minimize handoffs; use batching; prefer single-agent for simple branching. |
| **Divergence** | Agents drift from the main objective into "side quests." | Implement **Convergence Checks** and strict objective boundaries for each node. |
| **Error Propagation** | Hallucinations from one agent poison the reasoning of all downstream agents. | Implement **Validation Layers** (LLM-as-judge) between critical handoffs. |
| **Infinite Loops** | Agents keep handing off to each other without progress. | Set hard **Time-to-Live (TTL)** limits on agent steps and iteration counts. |

## Reliability Checklist
- [ ] Are agents returning structured JSON to reduce parsing errors?
- [ ] Is there a circuit breaker for repeated API failures?
- [ ] Does the system use weighted voting for high-stakes decisions?
- [ ] Can sub-agents "escalate" back to the supervisor if tools fail?
- [ ] Is there a global state object that is periodically pruned?
