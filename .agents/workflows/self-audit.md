---
description: Autonomously scans and interprets the repository architecture against Antigravity-Meta-Architect rules.
---

# Antigravity Meta Self-Audit Workflow

**Target Check:** $1

1. **State Verification Latch:** Read the project `state.md`.
   // if
2. Halt execution immediately and output "> Unauthorized Access. Finite State Machine is not in a ready status for self-audit." if the state restricts execution.
3. **Context Ingestion:** Equip the `Antigravity-Meta-Architect` skill.
4. **Rule vs Skill Distinction Check:**
   Every file in `.agents/rules/*.md` MUST remain plain Markdown.
   // if
   Flag as a violation if any rule file starts with `---` (YAML frontmatter). Do NOT auto-fix rules; preserve original formatting.
5. **Architectural Analysis:** Analyze all workflows in `.agents/workflows/`, rules in `.agents/rules/`, and skills in `.agents/skills/`. Detect missing YAML frontmatter in workflows/skills or violations of the 12,000-character limit.
6. **Correction and Reporting:**  
   // parallel  
7. Fix any trivial formatting, naming conventions, or structural issues.  
8. Generate a comprehensive audit report in `.antigravity/brain/artifacts/self_audit_report.md` detailing non-trivial issues needing human review.
9. **State Advancement:** Update `state.md`, logging the audit completion timestamp.
