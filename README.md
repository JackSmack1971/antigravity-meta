# 🚀 Antigravity Hybrid Agent Framework

> **Curated Patterns + GSD + Full BMAD + Persistent Planning — 2026 Power-User Edition**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/Skills-48%20Curated-blue)](docs/SKILLS-CATALOG.md)
[![IDE](https://img.shields.io/badge/IDE-Google%20Antigravity-4285F4?logo=google)](https://antigravity.google)
[![Updated](https://img.shields.io/badge/Updated-April%202026-brightgreen)](docs/CHANGELOG.md)
[![BMAD](https://img.shields.io/badge/Method-BMAD%20Agile-orange)](docs/BMAD-CHEATSHEET.md)

The cleanest, most powerful drop-in agentic development workspace for **Google Antigravity IDE** — pre-configured with the exact hybrid architecture used by experienced Antigravity power users in April 2026.

**Four battle-tested layers, one `.agents/` folder, zero conflicts:**

| Layer | What it is | What it gives you |
|---|---|---|
| 🛠️ **Curated Skills** | 48 product-grade AI patterns | Battle-tested scaffolds for DDD, TDD, and Clean Code |
| ⚡ **GSD** | Atomic, anti-vibe-coding workflow | Clean git history, disciplined solo execution |
| 👥 **BMAD** | Full Agile AI squad simulation | PM, Architect, Dev, QA roles on demand |
| 🧠 **Persistent Planning** | Manus-style filesystem memory | Zero context loss across sessions and restarts |

---

## 📖 Table of Contents

- [What Is This?](#-what-is-this)
- [Prerequisites](#-prerequisites)
- [Quick Start — One Command Install](#-quick-start--one-command-install)
- [The Four Pillars Explained](#-the-four-pillars-explained)
- [Persistent Planning Deep Dive](#-persistent-planning-deep-dive)
- [Folder Structure](#-folder-structure)
- [Core Rules (Always Enforced)](#%EF%B8%8F-core-rules-always-enforced)
- [Daily Workflow & Commands](#-daily-workflow--commands)
- [Copy-Paste Starter Prompt](#-copy-paste-starter-prompt)
- [Quick Test — First Run Validation](#-quick-test--first-run-validation)
- [Tech Stack Compatibility](#-tech-stack-compatibility)
- [Updating & Maintenance](#-updating--maintenance)
- [Troubleshooting](#-troubleshooting)
- [Documentation Hub](#-documentation-hub)
- [Glossary](#-glossary)
- [Credits & Community](#-credits--community)

---

## 🧭 What Is This?

**New to AI-assisted development?** Here's the plain-English pitch:

Modern AI IDEs let you give a single instruction and have an AI agent write, test, and commit code for you. The problem? Without guardrails, agents **hallucinate plans**, **drift from goals**, and **forget what they were doing** mid-task. This framework solves all three problems by combining four proven systems into a single, self-enforcing workspace.

Think of it as **a prefab cockpit for your AI agent** — every control is already wired up.

---

## ✅ Prerequisites

Before you install, make sure you have these tools ready:

| Requirement | Version | How to check |
|---|---|---|
| **Node.js** | `>= 20.x` | `node --version` |
| **npm** | `>= 10.x` | `npm --version` |
| **Google Antigravity IDE** | Latest | Open the IDE and check *Help → About* |
| **Git** | Any modern version | `git --version` |

> 💡 **What is Node.js?** It's a JavaScript runtime that lets you run the `npx` installer commands below. You can download it at [nodejs.org](https://nodejs.org).

> 💡 **What is Google Antigravity IDE?** It's Google's AI-native IDE built on Gemini 3 with an integrated Agent Manager. Think of it as VS Code, but the AI can autonomously write, run, and commit code.

---

## 🚀 Quick Start — One Command Install

Open a terminal inside your project folder and run:

```bash
npx antigravity-meta-architect@v2 init
```

That's it. The installer will:

1. Create the `.agents/` folder with all skills, rules, workflows, and hooks
2. Write `AGENTS.md` (the master identity file read by every agent)
3. Create your initial `task.md` task tracker
4. Set up the three persistent planning files (`task_plan.md`, `findings.md`, `progress.md`)
5. Register all lifecycle hooks automatically

**Already have the repo cloned?** Trigger the built-in self-audit instead:

```
/self-audit
```

> 🔒 **Safety note:** The installer automatically creates a `hybrid-backup-before-*.zip` before making any changes. You can safely delete these backups once you've confirmed everything works.

---

## 🏗️ The Four Pillars Explained

### 🛠️ Pillar 1 — Curated Skills (48 Patterns)

**What it is:** A hand-picked library of 48 high-performance AI task templates (skills) focused on modern engineering excellence—DDD, TDD, and Clean Architecture.

**Why it matters (Less is More):** 
Moving from 1,400+ generic skills to 48 curated patterns reduces indexing latency and prevents decision fatigue. It ensures the agent defaults to industry-standard patterns (like Shadcn or Drizzle) rather than getting lost in noisy, legacy alternatives. These skills are designed to be **complementary** to BMAD/GSD: the workflows define the *process*, while the curated skills define the *implementation*.

**How to use one:**
```text
Use skill: nextjs-15-app-router
```

---

### ⚡ Pillar 2 — GSD (Get Shit Done) Atomic Workflow

**What it is:** A strict five-phase discipline that forces your agent to plan before it codes. No more "just wing it" AI sessions.

**The five phases — in order, no skipping:**

```
Spec → Plan → Execute → Verify → Commit
```

| Phase | What the agent does | Output file |
|---|---|---|
| **Spec** | Writes a clear problem definition | `SPEC.md` |
| **Plan** | Breaks the task into numbered steps | `task_plan.md` |
| **Execute** | Writes code using the best-matching skill | Source files |
| **Verify** | Runs tests and linter | Test results |
| **Commit** | Creates a Conventional Commit message | `git commit` |

> 💡 **What is a Conventional Commit?** A standardized commit message format like `feat: add user auth` or `fix: resolve null pointer`. It makes your git history readable by both humans and automated tools.

**Invoke GSD mode:**
```
/gsd-plan
```

---

### 👥 Pillar 3 — BMAD Method (Agile AI Squad)

**What it is:** A simulation of a full Agile software team — you can summon a Product Manager, Architect, Developer, or QA Engineer as separate AI personas, each with their own responsibilities and expertise.

**Why it matters:** Complex features benefit from multiple *perspectives*. The Architect thinks about system design. The QA thinks about edge cases. Having them as separate agents prevents the AI from blindly agreeing with itself.

**Invoke any role with a slash command:**

```
/pm           → Product Manager: writes requirements & priorities
/architect    → Architect: designs system structure
/dev          → Developer: writes implementation code
/qa           → QA Engineer: writes tests & finds bugs
/master       → Scrum Master: orchestrates the full squad
```

---

### 🧠 Pillar 4 — Persistent Planning (Manus-Style Memory)

This is the newest and most powerful addition. See the [deep dive section below](#-persistent-planning-deep-dive).

---

## 🧠 Persistent Planning Deep Dive

### The Problem It Solves

AI agents have no memory between sessions. If you close your IDE, restart, or type `/clear`, the agent forgets everything — your plan, your decisions, your progress. This causes **goal drift** (the agent veers off course), **repeated mistakes** (it re-makes errors it already fixed), and wasted time re-explaining context.

### The Solution — Three Persistent Files

Instead of keeping state in the AI's short-term memory, state lives in your **filesystem** as three Markdown files the agent reads before every action:

| File | Purpose | Analogy |
|---|---|---|
| `task_plan.md` | Phased execution plan with step status | Sprint board |
| `findings.md` | Research notes, decisions, tech discoveries | Engineering journal |
| `progress.md` | Session logs, errors encountered, recovery state | Ship's log |

### How Lifecycle Hooks Enforce It

Four automatic hooks fire at precise moments to keep the agent synchronized:

| Hook | When it fires | What it does |
|---|---|---|
| `SessionStart` | When you open or resume a session | Re-reads `task_plan.md` + `progress.md` |
| `PreToolUse` | Before every tool call (file write, bash, etc.) | Checks current plan step; blocks if out of phase |
| `PostToolUse` | After every tool call | Appends result to `progress.md` |
| `Stop` | When the agent would end the session | Validates plan completion; blocks premature exit |

**Result:** The agent literally cannot forget where it was, skip a step, or close the session before the task is done.

All hooks are in `.agents/hooks/` — no configuration needed.

### Planning Commands

```text
/plan           → Initialize or resume task_plan.md
/plan:status    → Print a health summary of all three planning files
```

---

## 📁 Folder Structure

Everything lives under a single `.agents/` directory — no scattered config files, no conflicts:

```text
.
├── .agents/                        ← Single source of truth for all agent config
│   ├── skills/                     ← 48 Curated High-Performance Patterns
│   ├── rules/                      ← 6 always-active governance rule files
│   ├── workflows/                  ← BMAD agent personas & slash-command handlers
│   ├── get-shit-done/              ← GSD core logic and phase enforcement
│   ├── agents/                     ← Merged GSD + BMAD agent definitions
│   ├── hooks/                      ← Lifecycle hooks (SessionStart, Pre/PostToolUse, Stop)
│   ├── gsd-file-manifest.json      ← Tracks all GSD-managed files
│   └── settings.json               ← IDE integration settings
│
├── docs/                           ← Extended documentation
│   ├── ARCHITECTURE.md
│   ├── GSD-QUICKSTART.md
│   ├── BMAD-CHEATSHEET.md
│   ├── SKILLS-CATALOG.md
│   ├── RULES-REFERENCE.md
│   ├── CONTRIBUTING.md
│   └── CHANGELOG.md
│
├── AGENTS.md                       ← Master identity file (read by every agent, every session)
├── SPEC.md                         ← GSD Planning Lock template (fill this per task)
├── task.md                         ← Active task tracker (updated by GSD workflow)
├── task_plan.md                    ← Persistent phased plan (Pillar 4 memory)
├── findings.md                     ← Persistent research & decisions log (Pillar 4 memory)
├── progress.md                     ← Persistent session log & recovery state (Pillar 4 memory)
├── hybrid-backup-before-*.zip      ← Auto-generated safety backups (safe to delete)
├── .gitignore                      ← Node, Python, Flutter, Antigravity cache exclusions
├── LICENSE                         ← MIT License
└── README.md                       ← You are here
```

---

## 🛡️ Core Rules (Always Enforced)

Six rule files in `.agents/rules/` are automatically injected into **every single agent conversation** — you never need to repeat yourself:

| # | File | What it enforces |
|---|---|---|
| 1 | `hybrid-protocol.md` | Master router: decides GSD vs BMAD mode based on your input |
| 2 | `gsd-core-rules.md` | Planning Lock, Context Hygiene, Empirical Verification + Persistent Planning hooks |
| 3 | `rugged-software-constitution.md` | Production-grade code standards (error handling, logging, resilience) |
| 4 | `security-mandate.md` | OWASP-aligned security guardrails; blocks known anti-patterns |
| 5 | `strong-reasoner-planner.md` | Google's official structured thinking protocol for complex decisions |
| 6 | `code-quality-git-testing.md` | Clean code style, Conventional Commits, test coverage requirements |

**Default mode** (no slash command): GSD atomic workflow  
**Slash-command mode** (`/pm`, `/architect`, `/dev`, `/qa`): BMAD Agile squad handoff

---

## 🔥 Daily Workflow & Commands

### Command Reference

Type any of these directly into Agent Manager:

| Command | Mode | What it does |
|---|---|---|
| `/gsd-plan` | GSD | Start a new GSD atomic task from scratch |
| `/plan` | GSD + Planning | Initialize or resume `task_plan.md` persistent plan |
| `/plan:status` | Planning | Print health summary of all three planning files |
| `/master` or `/pm` | BMAD | Activate full Agile workflow with Scrum Master |
| `/architect` | BMAD | Activate Architect persona (system design focus) |
| `/dev` | BMAD | Activate Developer persona (implementation focus) |
| `/qa` | BMAD | Activate QA Engineer persona (testing focus) |
| `/self-audit` | Maintenance | Run the built-in workspace integrity check |
| `Use skill: [skill-name]` | Skills | Directly invoke any of the 48 curated skills |
| `Explain current architecture` | Any | Quick status dump of active plan and agent state |

### When to Use GSD vs BMAD

```
GSD  →  Solo tasks, single features, quick fixes, clean git history priority
BMAD →  Complex multi-component features, architecture decisions, full sprint simulation
Both →  Long-running tasks always benefit from /plan (persistent memory works with both)
```

---

## 📋 Copy-Paste Starter Prompt

Use this template every time you start a new task. Copy it, fill in the last line, paste into Agent Manager:

```markdown
Follow GSD atomic workflow with persistent planning.

1. Read task_plan.md and progress.md before starting
2. Create or update SPEC.md with the task definition
3. Plan the changes and write them to task_plan.md
4. Execute using the best matching skill from .agents/skills/
5. Verify with tests and linter
6. Update progress.md with what was done
7. Commit with a Conventional Commit message

Task: [describe exactly what you want built here]
```

---

## 🧪 Quick Test — First Run Validation

After installing, paste this into Agent Manager to confirm the entire hybrid system is active:

```text
Use the nextjs-15-app-router skill to scaffold a minimal Next.js 15 + TypeScript + Tailwind starter app following full GSD workflow. Show me every step.
```

**What you should see happen:**
1. ✅ Agent reads `task_plan.md` (SessionStart hook fires)
2. ✅ Agent writes `SPEC.md` (GSD Spec phase)
3. ✅ Agent invokes `nextjs-15-app-router` skill (Skills layer)
4. ✅ Agent runs linter/tests (GSD Verify phase)
5. ✅ Agent commits with a `feat:` message (GSD Commit phase)
6. ✅ Agent updates `progress.md` (PostToolUse hook fires)

If all six steps appear in sequence, your installation is working correctly.

---

## 📋 Tech Stack Compatibility

This framework is IDE-agnostic at the skill level but optimized for the following stack:

| Category | Supported Technologies |
|---|---|
| **IDE** | Google Antigravity (Gemini 3 + Agent Manager) |
| **Frontend** | Next.js 15, React, SvelteKit, Flutter |
| **Backend** | FastAPI, Node.js, Spring Boot |
| **Languages** | TypeScript, Python, Dart, Go, Rust |
| **Deployment** | Vercel, Google Cloud Run, Docker |

---

## 🔄 Updating & Maintenance

Keep each layer current independently:

```bash
# Update the Awesome-Skills Pack to get new skills
npx antigravity-awesome-skills --update

# Update GSD workflow engine
npx get-shit-done-cc@latest --tools antigravity

# Reinstall or refresh BMAD (non-destructive — safe to run anytime)
npx -y bmad-method install --tools antigravity --yes
```

> ⚠️ **Before updating:** The installer auto-creates a backup zip. Still, commit any in-progress work first (`git stash` or `git commit`) so you have a clean rollback point.

---

## 🔧 Troubleshooting

### Agent ignores the plan / starts coding immediately

**Cause:** GSD mode was not explicitly invoked, or `task_plan.md` is empty.  
**Fix:** Type `/plan` first to initialize the planning files, then describe your task.

### Hooks aren't firing (no `progress.md` updates)

**Cause:** Hooks may not be registered in `settings.json`.  
**Fix:** Run `/self-audit` — it will detect and re-register missing hooks automatically.

### Skills not found (`skill not recognized` error)

**Cause:** Awesome-Skills Pack may be outdated or the `.agents/skills/` folder is empty.  
**Fix:** Re-run the pruning script to restore the curated 48-pattern set.

### `/pm` or `/architect` not doing anything

**Cause:** BMAD workflows are not installed or are corrupted.  
**Fix:** Run `npx -y bmad-method install --tools antigravity --yes` to reinstall.

### Duplicate bullets or stale README content after `/self-audit`

**Cause:** Known edge case when the audit merges files with conflicting bullet styles.  
**Fix:** The source-of-truth is always `AGENTS.md`. Edit that file, then re-run `/self-audit`.

---

## 📚 Documentation Hub

| Document | What's inside |
|---|---|
| 🏗️ [Architecture Overview](docs/ARCHITECTURE.md) | How `.agents/` is structured and how layers interact |
| ⚡ [GSD Quickstart](docs/GSD-QUICKSTART.md) | Step-by-step guide to atomic, anti-vibe-coding workflow |
| 👥 [BMAD Cheat Sheet](docs/BMAD-CHEATSHEET.md) | All slash commands, agent roles, and handoff protocols |
| 🛠️ [Curated Skills Catalog](docs/SKILLS-CATALOG.md) | Full index of the 48 curated patterns with usage examples |
| ⚖️ [Rules Reference](docs/RULES-REFERENCE.md) | Detailed breakdown of all 6 governance rule files |
| 📝 [Contributing](docs/CONTRIBUTING.md) | How to add skills, propose rule changes, or submit fixes |
| 🔄 [Changelog](docs/CHANGELOG.md) | Full version history and breaking changes |

---

## 📖 Glossary

| Term | Plain-English Definition |
|---|---|
| **Agent** | An AI instance given a specific role, instructions, and tools |
| **Skill** | A pre-written instruction template that tells the agent exactly how to complete a specific task |
| **GSD** | *Get Shit Done* — a strict workflow that prevents agents from coding before planning |
| **BMAD** | *Be Meticulous And Deliberate* — an Agile squad simulation using multiple AI personas |
| **Vibe-coding** | Writing code driven by gut feeling and AI autocomplete without a plan — what GSD prevents |
| **Planning Lock** | A GSD guardrail that blocks code execution until `SPEC.md` and `task_plan.md` exist |
| **Lifecycle Hook** | Code (or instructions) that automatically runs at defined moments in the agent's workflow |
| **Persistent Planning** | Storing agent state in filesystem files so it survives session resets and IDE restarts |
| **Conventional Commit** | A commit message standard: `type(scope): description` (e.g., `feat: add auth`) |
| **Slash Command** | A shorthand like `/dev` that activates a pre-configured agent mode or workflow |
| **AGENTS.md** | The master config file read by every agent at the start of every session |

---

## 🤝 Credits & Community

| Project | What it contributed |
|---|---|
| 🚀 [**Curated Skills Pack**](docs/SKILLS-CATALOG.md) | 48 high-performance agentic skills focused on DDD, TDD, and clean architecture |
| ⚡ [**GSD — Get Shit Done**](https://github.com/get-shit-done-cc) | Atomic anti-vibe-coding workflow engine optimized for Antigravity |
| 👥 [**BMAD Method**](https://github.com/bmad-method) | Full Agile AI squad simulation with slash-command orchestration |
| 🧠 [**planning-with-files**](https://github.com/OthmanAdi/planning-with-files) | Manus-style persistent filesystem memory — integrated natively into this framework |
| 🌐 **Antigravity Native** | Google's official Agent Skills system and `.agents/` architecture |

---

**This setup is the current meta for Antigravity power users in 2026.**

Made with ❤️ for the ultimate vibe-free, agent-first development experience.

---

*Last updated: April 17, 2026 · [MIT License](LICENSE) · Project: Antigravity Hybrid Workspace (GSD + BMAD + Persistent Planning)*
