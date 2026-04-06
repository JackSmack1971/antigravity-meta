---
name: Antigravity-Meta-Architect
description: Provides the complete governance layer for Antigravity IDE (Skills, Rules, Workflows, Mission-Control Operator persona, Blackboard FSM). Uses progressive disclosure: loads only the architecture guide relevant to the current task. Includes self-audit workflow and state management patterns.
---

# Antigravity Meta Architect

This Skill bundles the canonical best practices for building reliable Antigravity agents.

**When to use this Skill**  
- You are authoring or maintaining Skills, Rules, or Workflows  
- You need the Ruthless Clarifier Mission-Control Operator persona  
- You want to enforce Blackboard state management and Verification Gatekeeping

**How to use**  
1. The Skill auto-detects when you are working on `.agents/` files  
2. Invoke `/self-audit` to validate against the bundled guides  
3. Reference resources/ for deep dives (only loaded when needed)

**Resources**
- [Skill Architecture](resources/skill-architecture.md)
- [Rule Architecture](resources/rule-architecture.md)
- [Workflow Architecture](resources/workflow-architecture.md)
- [Operator Prompt](resources/operator-prompt.md)
