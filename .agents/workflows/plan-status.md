---
name: plan-status
description: >
  Print a read-only health summary of task_plan.md, findings.md, and progress.md.
  Never modifies files. Slash command: /plan:status
---

# /plan:status — Planning Health Summary

1. Read `task_plan.md` → extract all Phase names and statuses.
2. Read `progress.md` (last 10 lines) → show recent session activity.
3. Check `findings.md` exists → confirm research context available.

Output this exact table:

| File | Present | Active Phase / Last Entry |
|------|---------|--------------------------|
| task_plan.md | yes/no | [phase + status] |
| findings.md | yes/no | n/a |
| progress.md | yes/no | [last timestamp line] |

Run check-complete:
`bash .agents/skills/planning-with-files/scripts/check-complete.sh`
(PS: `pwsh .agents/skills/planning-with-files/scripts/check-complete.ps1`)
Append commit-gate verdict to status output.
