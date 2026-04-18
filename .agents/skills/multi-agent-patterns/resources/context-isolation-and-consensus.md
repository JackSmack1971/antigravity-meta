# Context Isolation and Consensus

The primary technical benefit of multi-agent systems is **Context Isolation**. This resource covers how to maintain isolation and reach consensus across multiple agents.

## Isolation Mechanisms

1. **Instruction Passing**: The coordinator creates atomic instructions for the sub-agent via function call. The sub-agent receives ONLY those instructions.
2. **Persistent Memory**: For complex shared state, agents read/write to a file system. This allows agents to "share" large datasets without bloating their context windows with the raw data.
3. **Full Delegation**: The coordinator passes its entire context to a sub-agent. *Caution*: This defeats the purpose of isolation but is necessary for deep reasoning tasks.

## Reaching Consensus

Multi-agent discussions often suffer from "sycophancy" (agents agreeing with each other's errors). Use these protocols to mitigate:

### Weighted Voting
Weight agent votes by their predicted confidence or specific domain expertise.
> *Example*: A "Security Agent" has 3x weight on security-related decisions.

### Debate Protocols
Required agents to critique each other's outputs over 2-3 rounds.
- **Round 1**: Agents A and B produce solutions.
- **Round 2**: Agent A critiques B; Agent B critiques A.
- **Round 3**: Agents provide final, corrected solutions based on feedback.

### Consensus Monitoring
- **Stall Triggers**: Activate if agents repeat themselves for >2 turns without progress.
- **Divergence Check**: Flag if agents have fundamentally different interpretations of the core objective.
