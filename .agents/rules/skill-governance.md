# Skill Governance & Sharding Rules

These rules ensure the Antigravity agent skills directory remains deterministic, modular, and performant.

## R-1: Character Limit Enforcement
Master `SKILL.md` files (at the skill root) MUST NOT exceed the architectural limit of **12,000 characters**.
- This ensures optimal indexing performance.
- Any skill approaching this limit MUST be sharded.

## R-2: Resource-First Update Pattern
When a skill is sharded, all deep-dive documentation, implementation examples, and extensive checklists MUST reside in the `resources/` subdirectory.
- **MANDATORY**: Edits and content updates MUST be made directly to the relevant files in the `resources/` directory.
- **CLEAN MASTER**: Do NOT add bulky content back to the master `SKILL.md`. The master file should only be updated for structural changes, resource indexing, or core workflow summaries.

## R-3: Modular Structure
A sharded skill MUST follow this directory structure:
```
.agents/skills/<skill-name>/
├── SKILL.md (Architectural entry point)
└── resources/
    ├── thematic-resource-1.md
    └── thematic-resource-2.md
```
- Resource files MUST use `lowercase-with-hyphens.md` naming conventions.
- The master `SKILL.md` MUST use absolute file links (`file:///...`) for resource pointers.

## R-4: Verification Gate
Any change to a master `SKILL.md` or resource file MUST be followed by a character count check to ensure architectural compliance.
