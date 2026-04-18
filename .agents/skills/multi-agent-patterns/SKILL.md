---
name: multi-agent-patterns
description: This skill should be used when the user asks to "design multi-agent system", "implement supervisor pattern", "create swarm architecture", "coordinate multiple agents", or mentions multi-agent patterns, context isolation, agent handoffs, sub-agents, or parallel agent execution.
risk: unknown
source: community
---

# Multi-Agent Architecture Patterns

## Overview

Design distributed AI systems that scale beyond single-agent limits. This skill provides patterns for context isolation, coordination protocols, and consensus mechanisms across multiple model instances.

## 📚 Resources

| Resource | Description |
|----------|-------------|
| [Economics & Specialization](file:///c:/workspaces/antigravity-meta/.agents/skills/multi-agent-patterns/resources/agent-economics-and-specialization.md) | Token multipliers and the motivation for specialized agents. |
| [Design Patterns](file:///c:/workspaces/antigravity-meta/.agents/skills/multi-agent-patterns/resources/multi-agent-design-patterns.md) | Supervisor, Swarm, and Hierarchical architecture implementations. |
| [Isolation & Consensus](file:///c:/workspaces/antigravity-meta/.agents/skills/multi-agent-patterns/resources/context-isolation-and-consensus.md) | Handoff protocols, instruction passing, and debate mechanisms. |
| [Failure Modes](file:///c:/workspaces/antigravity-meta/.agents/skills/multi-agent-patterns/resources/agent-failure-modes.md) | Mitigation for supervisor bottlenecks, divergence, and loops. |

## Core Patterns

### Supervisor Pattern
Central controller delegates to specialists. Best for managed workflows.
> See [Design Patterns](file:///c:/workspaces/antigravity-meta/.agents/skills/multi-agent-patterns/resources/multi-agent-design-patterns.md).

### Swarm Pattern
Peer-to-peer handoffs without central control. Best for exploratory tasks.
> See [Design Patterns](file:///c:/workspaces/antigravity-meta/.agents/skills/multi-agent-patterns/resources/multi-agent-design-patterns.md).

## Best Practices
1. **Context Isolation**: Sub-agents exist to partition context, not just roles.
2. **Explicit Handoffs**: Pass state explicitly between agents using standard protocols.
3. **Validation Layers**: Verify agent outputs before passing them to downstream nodes.
4. **Weighted Voting**: Reach consensus by weighting agent expertise.

## Related Skills
- `memory-systems`: Shared state management.
- `tool-design`: Specializing tools per agent.

## Summary
Build robust, parallelizable systems by distributing reasoning across specialized agent contexts and enforcing strict coordination protocols.
