# AGENTS.md: Hybrid Antigravity Architecture [v1.6.1-hardening]

**Hybrid System Configuration v1.6.1-hardening — synchronized with gsd-with-persistent-planning.md v1.3.0**
This document serves as the high-level summary and cross-tool master rule of the hybrid Antigravity structure.

### Agents & Skills Directory
All custom behaviors reside in `.agents/skills` and `.agents/rules`.
Curated High-Performance Skill Set (48 skills) — local scope only. This curated set ensures maximum context availability.
GSD layered on top guarantees the atomic Spec → Plan → Execute → Verify → Commit workflow.

### Rules Layer
1. `hybrid-protocol.md` - Master glue rule
2. `gsd-core-rules.md` - GSD official constraints
3. `rugged-software-constitution.md` - Robust code guarantees
4. `security-mandate.md` - Execute under strict boundary protocols
5. `strong-reasoner-planner.md` - Reason and formulate plans atomically
6. `code-quality-git-testing.md` - Clean code with verified tests
7. `skill-governance.md` - Mandatory sharding and character limit rules

### Conflict Resolution Precedence
If conflict arises between sources, the absolute order of precedence is:
1. `AGENTS.md` (This file)
2. `.agents/rules/*`
3. `.agents/workflows/*`
4. `.agents/skills/*`
5. External knowledge / LLM pre-training
