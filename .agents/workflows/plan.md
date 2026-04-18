---
name: plan
description: >
  Initialize or resume persistent planning for the current GSD task.
  Creates task_plan.md, findings.md, and progress.md if absent.
  Resumes from active phase if they exist. Slash command: /plan
---

# /plan — Initialize or Resume Persistent Planning

**$1** (optional: task description or "resume")

1. **Check for existing plan:**
   Read `task_plan.md` if it exists → skip to Step 3.

2. **Bootstrap (new plan only):**
   Run (Bash): `bash .agents/skills/planning-with-files/scripts/init-session.sh --from-spec`
   Run (PS):   `pwsh .agents/skills/planning-with-files/scripts/init-session.ps1 --from-spec`
   Confirm `task_plan.md` created.

3. **Restore context:**
   Read `task_plan.md` completely.
   If `findings.md` exists → read Architecture and Research sections.
   If `progress.md` exists → read last 20 lines.

4. **Report:**
   Output: "Planning active. Current phase: [phase]. Next action: [first incomplete task]."
   If all phases complete → output: "All phases complete. Commit gate will pass."
