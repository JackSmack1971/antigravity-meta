# 🚀 Antigravity Hybrid Agent Framework

**Awesome-Skills + GSD + Full BMAD + Persistent Planning (2026 Power-User Edition)**

The cleanest, most powerful drop-in agentic development setup for **Google Antigravity IDE**.

This repository is pre-configured with the exact hybrid architecture used by experienced Antigravity users in April 2026 — **now with built-in Manus-style persistent filesystem memory**:

- **Native Antigravity Agent Skills** + **Awesome-Skills Pack** (1,423+ production-ready skills)
- **GSD (Get Shit Done)** atomic workflow (anti-vibe-coding discipline)
- **Full BMAD Method** Agile AI squad simulation (PM, Architect, Dev, QA, Scrum Master, etc.)
- **Persistent Planning** (`task_plan.md` + `findings.md` + `progress.md` + lifecycle hooks) — zero-drift, self-healing execution

Everything lives in a **single clean `.agents/` folder** — no duplicates, no conflicts, fully unified.

---

## ✨ Why This Hybrid Rocks

| Layer                   | Purpose                                                                                       | When It Shines                                        |
|-------------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------|
| **Awesome-Skills**      | 1,423+ reusable tools & scaffolds                                                             | Everyday tasks & rapid prototyping                    |
| **GSD**                 | Strict atomic workflow (Spec → Plan → Execute → Verify → Commit)                             | Solo rapid shipping, clean git history                |
| **BMAD**                | Full Agile team simulation + slash commands                                                   | Complex features, team-like process                   |
| **Persistent Planning** | Manus-style filesystem memory (`task_plan.md`, `findings.md`, `progress.md`) + auto-hooks    | Long-running tasks, complex features, zero context loss |
| **Rules**               | Always-on guardrails                                                                          | Quality, security & consistency                       |

You get **maximum speed** (skills) + **maximum discipline** (GSD) + **maximum structure** (BMAD) — all working together seamlessly.

---

## 🧠 Persistent Planning (New — April 2026)

We've fused the battle-tested **planning-with-files** pattern directly into GSD and BMAD.

**What you get:**
- Three persistent Markdown files that act as long-term memory:
  - `task_plan.md` → Detailed phased plan (maps to GSD Plan phase)
  - `findings.md` → Research, decisions, knowledge base
  - `progress.md` → Session logs, errors, recovery state
- Automatic lifecycle hooks (`SessionStart`, `PreToolUse`, `PostToolUse`, `Stop`) that:
  - Re-read the plan before every tool call
  - Force progress updates after every action
  - Prevent premature session closure
  - Auto-recover after `/clear` or IDE restart
- New slash commands that work alongside your existing BMAD set:
  - `/plan` — Start or update the persistent plan
  - `/plan:status` — Quick health check of planning files

**Result:** GSD becomes truly self-enforcing. BMAD agents share real persistent state. No more goal drift, no more repeated errors, no more "start over" moments. This is the missing piece that makes your meta template production-grade for multi-day, multi-feature work.

All hooks live in `.agents/hooks/` and are referenced by `hybrid-protocol.md` — zero extra setup.

---

## 📁 Folder Structure (Clean & Unified)

```text
.
├── .agents/                   ← Single source of truth (everything merged here)
│   ├── skills/                ← Awesome-Skills Pack + GSD skills (1,423+)
│   ├── rules/                 ← 6 core hybrid rules (always active)
│   ├── workflows/             ← BMAD agents & slash-command handlers
│   ├── get-shit-done/         ← GSD core logic
│   ├── agents/                ← Merged GSD agents
│   ├── hooks/                 ← GSD commit & verification hooks
│   ├── gsd-file-manifest.json
│   └── settings.json
├── AGENTS.md                  ← Master identity & cross-tool config
├── hybrid-backup-before-*.zip ← Automatic safety backups (keep or delete)
├── task.md                    ← Current task tracking (GSD)
└── README.md                  ← You are here
```

---

## 📚 Documentation Hub

Deep dive into the operational protocols of this architecture:

- 🏗️ [Architecture Overview](docs/ARCHITECTURE.md) — How `.agents/` operates
- ⚡ [GSD Quickstart](docs/GSD-QUICKSTART.md) — Master atomic, anti-vibe-coding constraints
- 👥 [BMAD Cheat Sheet](docs/BMAD-CHEATSHEET.md) — Guide to your Agile Agent Squad
- 🛠️ [Awesome-Skills Catalog](docs/SKILLS-CATALOG.md) — How to map 1,423+ AI skills
- ⚖️ [Rules Reference](docs/RULES-REFERENCE.md) — The 6 immutable governance guardrails
- 📝 [Contributing](docs/CONTRIBUTING.md) | 🔄 [Changelog](docs/CHANGELOG.md)

---

## 🛠️ Core Rules (Always Enforced)

Located in `.agents/rules/` — these are injected into **every** agent conversation:

1. **`hybrid-protocol.md`** — Master glue that decides GSD vs BMAD mode
2. **`gsd-core-rules.md`** — Planning Lock, Context Hygiene, Empirical Verification
3. **`rugged-software-constitution.md`** + **`security-mandate.md`** — Production-grade standards
4. **`strong-reasoner-planner.md`** — Official Google structured thinking
5. **`code-quality-git-testing.md`** — Clean code, Conventional Commits, tests required

> **Note:** Persistent Planning hooks are enforced by `gsd-core-rules.md` and `strong-reasoner-planner.md`.

**Default behavior:** GSD atomic workflow  
**Slash-command behavior** (`/pm`, `/architect`, etc.): Full BMAD squad handoff

---

## 🔥 How to Use (Daily Workflow)

### Quick Commands (type these in Agent Manager)

| Command                           | What It Does                                                    |
|-----------------------------------|-----------------------------------------------------------------|
| `/gsd-plan`                       | Start a new GSD atomic task                                     |
| `/plan`                           | Start or update `task_plan.md` (GSD + planning-with-files)      |
| `/plan:status`                    | Show current plan health + findings + progress summary          |
| `/master` or `/pm`                | Start full BMAD Agile workflow                                  |
| `/architect`                      | BMAD Architect role                                             |
| `/dev`                            | BMAD Developer role                                             |
| `/qa`                             | BMAD QA role                                                    |
| `Use skill: nextjs-15-app-router` | Explicitly call any Awesome Skill                               |
| `Explain current architecture`    | Quick status check                                              |

### Recommended Prompt Pattern (copy-paste starter)

```markdown
Follow GSD atomic workflow.
1. Create/update SPEC.md
2. Plan the changes
3. Execute using the best matching skill from .agents/skills/
4. Verify with tests/linter
5. Commit with Conventional Commit message

Task: [describe what you want]
```

---

## 🚀 One-Click Installation (v2)

To bootstrap the complete Antigravity Meta v2 architecture (including the unified Architect skill, Self-Audit workflow, and Blackboard state), run:

```bash
npx antigravity-meta-architect@v2 init
```

Alternatively, if you already have the repository, trigger the built-in audit workflow from your IDE:
