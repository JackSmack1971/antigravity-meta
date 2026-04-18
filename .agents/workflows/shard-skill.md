---
description: Shards an oversized SKILL.md into modular Level 2/3 resources while preserving progressive disclosure.
---

# Shard Oversized Skill

**Target Skill:** $1

1. **Context Ingestion**  
   Read `.agents/skills/$1/SKILL.md` and the bundled rule-architecture.md from the Meta-Architect Skill.

2. **Analysis**  
   Identify sections longer than ~4k characters that can become separate resources (e.g., examples, reference tables, detailed SOPs).

3. **Shard Creation**  
   // turbo
   - Create resources/ subfolder if missing  
   - Extract each large section into resources/<section-name>.md  
   - Replace original section with a concise absolute pointer: "See [resources/<section-name>.md](file:///[root]/.agents/skills/$1/resources/<section-name>.md)"

4. **Update SKILL.md**  
   Add a new “Resources” table-of-contents section at the top.

5. **Safety Latch**  
   Update state.md: Current Stage = SHARD_COMPLETE for $1

6. **Halt**  
   Output: "Skill $1 successfully sharded. Review the new resources/ folder and run /self-audit to confirm."
