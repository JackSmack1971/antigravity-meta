# Multi-Agent Design Patterns

This resource outlines the three primary architectures for coordinating multiple AI agents.

## 1. Supervisor / Orchestrator
A central agent (the Supervisor) maintains global state and delegates tasks to specialized workers.
- **Workflow**: `User -> Supervisor -> sub-agents -> Aggregator -> Final Output`.
- **Best for**: Tasks with clear decomposition requirements and human-in-the-loop oversight.
- **Critical Fix**: Use a `forward_message` tool to allow sub-agents to talk directly to users to avoid the "Telephone Game" distortion.

## 2. Peer-to-Peer / Swarm
Agents communicate directly using handoff protocols without a central manager.
- **Workflow**: `Agent A` logic determines that `Agent B` should handle the next step and returns a `transfer_to_agent_b()` function call.
- **Best for**: Flexible exploration, creative tasks, and systems with emergent requirements.
- **Implementation**:
```python
def transfer_to_agent_b():
    return agent_b  # Explicit handoff via tool return
```

## 3. Hierarchical
Agents are organized into layers (Strategy -> Planning -> Execution).
- **Workflow**: Strategy sets goals; Planning breaks them into tasks; Execution performs them.
- **Best for**: Large-scale projects mirroring organizational structures (e.g., Enterprise RAG).

## Common Handoff Protocol
```python
def handoff(target_agent_id: str, context_updates: dict):
    """
    Standardizes how state is passed between agents during a swarm transfer.
    """
    return {
        "status": "handoff",
        "target": target_agent_id,
        "carried_context": context_updates
    }
```
