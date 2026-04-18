---
name: planning-with-files-ar
description: "تخطيط قائم على الملفات بأسلوب Manus، مدمج في GSD + BMAD (العربية)"
version: "2.34.1-antigravity"
risk: low
source: community
date_added: "2026-04-17"
user-invocable: true
slash-commands:
  - name: plan
    description: "بدء التخطيط. ينشئ task_plan.md وfindings.md وprogress.md."
  - name: plan:status
    description: "عرض حالة التخطيط الحالية."
allowed-tools: "Read Write Edit Bash Glob Grep"
hooks:
  SessionStart:
    - hooks:
        - type: command
          command: "bash .agents/hooks/planning-with-files-session-start.sh"
  UserPromptSubmit:
    - hooks:
        - type: command
          command: "bash .agents/hooks/planning-with-files-user-prompt.sh"
  BeforeTool:
    - matcher: "Write|Edit|Bash|Read|Glob|Grep"
      hooks:
        - type: command
          command: "bash .agents/hooks/planning-with-files-before-tool.sh"
          timeout: 5
  AfterTool:
    - matcher: "Write|Edit"
      hooks:
        - type: command
          command: "bash .agents/hooks/planning-with-files-after-tool.sh"
          timeout: 5
  Stop:
    - hooks:
        - type: command
          command: "bash .agents/hooks/planning-with-files-stop.sh"
          timeout: 10
language: ar
base-skill: planning-with-files
license: MIT
---

# Planning with Files — إصدار GSD (العربية)

> All scripts, templates, and hooks are identical to the English base version.
> Only the playbook instructions are translated. Hook file paths are unchanged.

اعمل مثل Manus: ملفات Markdown الدائمة كذاكرة عمل على القرص.

## GSD Phase Mapping

| GSD Phase | planning-with-files Role |
|-----------|--------------------------|
| **Spec**   | Read SPEC.md; create task_plan.md with phases derived from spec |
| **Plan**   | task_plan.md IS the detailed plan artifact |
| **Execute** | BeforeTool re-reads task_plan.md; AfterTool updates progress.md |
| **Verify**  | Log test results in progress.md |
| **Commit**  | Stop hook runs check-complete.sh |

## File Roles

| File | GSD Relationship |
|------|------------------|
| `task_plan.md` | Detailed artifact for Plan phase; supplements task.md |
| `findings.md` | Feeds state.md via pointer |
| `progress.md` | Augments task.md with session log |

## Core Rules

1. Plan derives from SPEC.md — never start without reading the spec.
2. No GSD file duplication — task.md = atomic state; task_plan.md = phase detail.
3. External content → findings.md only. Never to task_plan.md.
4. 3-Strike protocol — log errors; never repeat the same failing action.
5. All 6 core rules always enforced.

## Templates

In `.agents/skills/planning-with-files/templates/` (English; internationally usable).

## Scripts

In `.agents/skills/planning-with-files/scripts/` (shared by all language variants).

---
*For full English documentation see `.agents/skills/planning-with-files/SKILL.md`*
