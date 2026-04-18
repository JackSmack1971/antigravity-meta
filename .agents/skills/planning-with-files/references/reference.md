# Reference: Manus Context Engineering Principles

This skill is based on context engineering principles from Manus, the AI agent company
acquired by Meta for $2 billion in December 2025.

For the full reference, see the source repo:
`skills/planning-with-files/reference.md`

## Key Principles (Summary for GSD Integration)

### Principle 3: Filesystem as External Memory
```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)
GSD files (SPEC.md, task.md, state.md) + planning files = shared persistent knowledge
```

### Principle 4: Manipulate Attention Through Recitation
Re-reading `task_plan.md` before each tool call keeps the GSD phase goal in the
model's attention window, preventing goal drift after 50+ tool calls.

### Principle 5: Keep the Wrong Stuff In
Log ALL errors in `task_plan.md` and `progress.md`. Failed actions with
stack traces let the model implicitly update beliefs and reduce repetition.

## GSD-Specific Notes

- `SPEC.md` is the authoritative source of truth — always derive plan from spec.
- `task.md` holds atomic GSD state; `task_plan.md` holds phase detail.
- The PreToolUse hook implements Principle 4 automatically.
- The Stop hook implements the GSD Commit gate.
