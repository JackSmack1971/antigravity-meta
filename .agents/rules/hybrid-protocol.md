# Hybrid Protocol

This is the master glue rule that forces:
- Always check and invoke existing skills from `.agents/skills/` first.
- Strict GSD atomic workflow (no vibe coding).
- Planning Lock (never code until SPEC is approved).
- Context hygiene and state persistence.
- Security-first + empirical verification.
- Ready to switch to BMAD roles if `/pm`, `/architect`, etc. are invoked.


---


---

## planning-with-files Hook Wiring

The `planning-with-files` skill registers 5 lifecycle hooks in `.agents/hooks/`.
This section documents how they integrate with the hybrid protocol.

### Hook Registration

Each hook has a Bash (`.sh`) and PowerShell (`.ps1`) variant.
Agent Manager selects the appropriate variant based on the host OS.

| Hook | Trigger | File (Bash) | File (PS1) |
|------|---------|-------------|------------|
| SessionStart | IDE/session startup | `planning-with-files-session-start.sh` | `planning-with-files-session-start.ps1` |
| UserPromptSubmit | User submits prompt | `planning-with-files-user-prompt.sh` | `planning-with-files-user-prompt.ps1` |
| BeforeTool | Before Write\|Edit\|Bash\|Read\|Glob\|Grep | `planning-with-files-before-tool.sh` | `planning-with-files-before-tool.ps1` |
| AfterTool | After Write\|Edit | `planning-with-files-after-tool.sh` | `planning-with-files-after-tool.ps1` |
| Stop | Agent stopping | `planning-with-files-stop.sh` | `planning-with-files-stop.ps1` |

### Hook Execution Order (GSD Phase Context)

```
Session Start:
  [Agent Manager] → SessionStart hook (restore context) → Agent ready

User Prompt:
  [User submits] → UserPromptSubmit hook (inject plan state) → Agent processes

Tool Execution:
  [GSD phase logic] → BeforeTool hook (re-read plan) → Tool runs → AfterTool hook (remind update)

Stop:
  [Agent stopping] → Stop hook (check completion) → GSD Commit gate
```

### Hook Safety Guarantees

All planning-with-files hooks:

1. **Exit 0 always** — never block tool execution or session continuity.
2. **Read-only** — hooks never write files. They emit reminders that the agent acts on.
3. **Additive output** — hook output is injected into context as informational text.
4. **No quality bypass** — hooks do not suppress, skip, or modify any other hook's output.
5. **Idempotent** — safe to run multiple times; produce the same output each time.

### Slash Command Registration

The following slash commands are registered by this skill and are additive to the
existing BMAD command set. They do NOT conflict with `/pm`, `/architect`, `/dev`,
`/qa`, `/analyst`, or `/po`.

| Command | Description |
|---------|-------------|
| `/plan` | Activate planning-with-files; create task_plan.md, findings.md, progress.md |
| `/plan:status` | Show compact planning status (read-only) |

BMAD commands always take precedence when invoked by name. `/plan` and `/plan:status`
only affect planning file state and never redirect agent behavior away from active
BMAD agent roles.

### Backward Compatibility

Users with existing `planning-with-files` installations using the older `.agent/`
(singular) convention: run the provided compatibility shim or manually copy the
`.agents/` folder. The skill auto-detects both paths:

```bash
# Compatibility shim: create .agent/ as symlink to .agents/
# Run once in your repo root:
ln -sf .agents .agent
```

Or use the provided `compat-shim.sh` script in the integration package.
