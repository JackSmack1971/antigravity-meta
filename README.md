# 🚀 Antigravity Hybrid Agent Framework

**Awesome-Skills + GSD + Full BMAD + Persistent Planning (2026 Power-User Edition)**

The cleanest, most powerful drop-in agentic development setup for **Google Antigravity IDE**.

This repository is pre-configured with the exact hybrid architecture used by experienced Antigravity users in April 2026 — **now with built-in Manus-style persistent filesystem memory**:

* **Native Antigravity Agent Skills** + **Curated High-Performance Patterns** (48 curated skills)
* **GSD (Get Shit Done)** atomic workflow (anti-vibe-coding discipline)
* **Full BMAD Method** Agile AI squad simulation
* **Persistent Planning** (`task_plan.md` + `findings.md` + `progress.md` + lifecycle hooks) — zero-drift, self-healing execution

Everything lives in a **single clean .agents/ folder** — no duplicates, no conflicts, fully unified.
- **Native Antigravity Agent Skills** + **Curated High-Performance Patterns** (48 curated skills)
- **GSD (Get Shit Done)** atomic workflow (anti-vibe-coding discipline)
- **Full BMAD Method** Agile AI squad (PM, Architect, Dev, QA, Scrum Master, etc.)


Everything lives in a **single clean `.agents/` folder** — no duplicates, no conflicts, fully unified.

---

## ✨ Why This Hybrid Rocks

| Layer              | Purpose                              | When It Shines                     |
|--------------------|--------------------------------------|------------------------------------|
| **Curated Skills** | 48 high-performance patterns        | Production-grade execution & DDD/TDD |
| **GSD**            | Strict atomic workflow (Spec → Plan → Execute → Verify → Commit) | Solo rapid shipping, clean git history |
| **BMAD**           | Full Agile team simulation + slash commands | Complex features, team-like process |
| **Persistent Planning** | Manus-style filesystem memory (`task_plan.md`, `findings.md`, `progress.md`) + auto-hooks | Long-running tasks, complex features, zero context loss |
| **Rules**          | Always-on guardrails                 | Quality, security & consistency    |

You get **maximum speed** (skills) + **maximum discipline** (GSD) + **maximum structure** (BMAD) — all working together seamlessly.

---

## 🧠 Persistent Planning (New — April 2026)

We’ve fused the battle-tested **planning-with-files** pattern directly into GSD and BMAD.

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

**Result:** GSD becomes truly self-enforcing. BMAD agents share real persistent state. No more goal drift, no more repeated errors, no more “start over” moments. This is the missing piece that makes your meta template production-grade for multi-day, multi-feature work.

All hooks live in `.agents/hooks/` and are referenced by `hybrid-protocol.md` — zero extra setup.

## 📁 Folder Structure (Clean & Unified)

```text
.
├── .agents/                  ← Single source of truth (everything merged here)
│   ├── skills/               ← Curated High-Performance Patterns (48 curated)
│   ├── rules/                ← 6 core hybrid rules (always active)
│   ├── workflows/            ← BMAD agents & slash-command handlers
│   ├── get-shit-done/        ← GSD core logic
│   ├── agents/               ← Merged GSD agents
│   ├── hooks/                ← GSD commit & verification hooks
│   ├── gsd-file-manifest.json
│   └── settings.json
├── AGENTS.md                 ← Master identity & cross-tool config
├── hybrid-backup-before-*.zip ← Automatic safety backups (keep or delete)
├── task.md                   ← Current task tracking (GSD)
└── README.md                 ← You are here
```

## 📚 Documentation Hub

Deep dive into the operational protocols of this architecture:

- 🏗️ [Architecture Overview](docs/ARCHITECTURE.md) - How `.agents/` operates
- ⚡ [GSD Quickstart](docs/GSD-QUICKSTART.md) - Master atomic, anti-vibe-coding constraints
- 👥 [BMAD Cheat Sheet](docs/BMAD-CHEATSHEET.md) - Guide to your Agile Agent Squad
- 🛠️ [Curated Skills Catalog](docs/SKILLS-CATALOG.md) - How to use the 48 mapped patterns
- ⚖️ [Rules Reference](docs/RULES-REFERENCE.md) - The 6 immutable governance guardrails
- 📝 [Contributing](docs/CONTRIBUTING.md) | 🔄 [Changelog](docs/CHANGELOG.md)

---

## 🛠️ Core Rules (Always Enforced)

Located in `.agents/rules/` — these are injected into **every** agent conversation:

1. **`hybrid-protocol.md`** — Master glue that decides GSD vs BMAD mode
2. **`gsd-core-rules.md`** — Planning Lock, Context Hygiene, Empirical Verification
3. **`rugged-software-constitution.md`** + **`security-mandate.md`** — Production-grade standards
4. **`strong-reasoner-planner.md`** — Official Google structured thinking
5. **`code-quality-git-testing.md`** — Clean code, Conventional Commits, tests required
- “Persistent Planning hooks are now enforced by gsd-core-rules.md and strong-reasoner-planner.md.”
**Default behavior**: GSD atomic workflow  
**Slash-command behavior** (`/pm`, `/architect`, etc.): Full BMAD squad handoff

---

## 🔥 How to Use (Daily Workflow)

### Quick Commands (type these in Agent Manager)

| Command                  | What It Does                              |
|--------------------------|-------------------------------------------|
| `/gsd-plan`              | Start a new GSD atomic task               |
| `/plan`                  | Start or update persistent task_plan.md (GSD + planning-with-files) |
| `/plan:status`           | Show current plan health + findings + progress summary              |
| `/master` or `/pm`       | Start full BMAD Agile workflow            |
| `/architect`             | BMAD Architect role                       |
| `/dev`                   | BMAD Developer role                       |
| `/qa`                    | BMAD QA role                              |
| `Use skill: nextjs-15-app-router` | Explicitly call any Awesome Skill    |
| `Explain current architecture` | Quick status check                    |

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

## 🚀 One-Click Installation (v2)

To bootstrap the complete Antigravity Meta v2 architecture (including the unified Architect skill, Self-Audit workflow, and Blackboard state), run:

```bash
npx antigravity-meta-architect@v2 init
```

Alternatively, if you already have the repository, just trigger the built-in audit workflow from your IDE:
`/self-audit`

---

## 🔄 Updating & Maintenance

```bash
# Update Awesome-Skills Pack
npx antigravity-awesome-skills --update

# Update GSD
npx get-shit-done-cc@latest --tools antigravity

# Reinstall/refresh BMAD (safe)
npx -y bmad-method install --tools antigravity --yes
```

## 🧪 Quick Test (Recommended First Run)

Open Agent Manager and paste this one-liner:

```text
Use the nextjs-15-app-router skill to scaffold a minimal Next.js 15 + TypeScript + Tailwind starter app following full GSD workflow. Show me every step.
```

You’ll see the entire hybrid system in action: skills → GSD planning → rules enforcement → optional BMAD handoff.

## 📋 Tech Stack This Setup Is Optimized For

- **IDE:** Google Antigravity (Gemini 3 + Agent Manager)
- **Frontend:** Next.js / React / SvelteKit / Flutter
- **Backend:** FastAPI / Node.js / Spring Boot
- **Languages:** TypeScript, Python, Dart, Go, Rust
- **Deployment:** Vercel, Google Cloud, Docker

## 📄 Additional Resources

- **`SPEC.md`**: Core atomic template for GSD Planning Lock phases.
- **`.gitignore`**: Modern exclusions encompassing Node, Python, Flutter, and Antigravity caching.
- **`LICENSE`**: Standard MIT License for open-source clarity.

## 🤝 Credits & Community

* 🚀 **Curated Skills Pack** — 48 high-performance agentic skills focused on DDD, TDD, and clean architecture.
* ⚡ **GSD (Get Shit Done)** — Atomic anti-vibe-coding workflow optimized for Antigravity.
* 👥 **BMAD Method** — Full Agile AI squad simulation with slash-command workflows.
* 🧠 **planning-with-files** — Manus-style persistent filesystem memory (integrated natively). Original repo: https://github.com/OthmanAdi/planning-with-files
* 🌐 **Antigravity Native** — Google’s official Agent Skills system and `.agents/` architecture.

This setup is the current meta for Antigravity power users in 2026.

**Happy building!**  
Made with ❤️ for the ultimate vibe-free, agent-first development experience.

*Last updated: April 17, 2026*
*Project: Antigravity Hybrid Workspace (GSD + BMAD + Persistent Planning)*
