**Consolidated Synergistic Skills Guide for GSD + Persistent Planning + BMad Workflows**

**Pruning Philosophy (unified from every section)**  
The underlying `skill pruning plan.md` distilled 1,423 skills to ~20–25 highest-ROI ones across four domains (backend, frontend, database, testing). Every analysis in the source file follows the same rule: **activate only the minimal high-leverage subset that maps to the workflow’s phases, artifacts (`task_plan.md`, `findings.md`, `progress.md`), hooks (BeforeTool/AfterTool), checkpoints, BMAD roles, and enforced rules (`strong-reasoner-planner`, `code-quality-git-testing`, `security-mandate`, etc.).** No role gets the full catalog. Domain skills are conditional. All recommendations already honor this; the consolidation below removes the massive repetition of the same core skills/tables while preserving every unique insight.

**Universal Core Skills (activate for ~95 % of all workflows/agents)**  
These appear in every single analysis with identical rationale and are the true “always-on” foundation:

1. `software-architecture` / `architecture`  
2. `production-code-audit`  
3. `backend-dev-guidelines` **and/or** `frontend-dev-guidelines` (choose by dominant domain; both if full-stack)  
4. `testing-qa` + `test-driven-development` / `tdd-workflow`  
5. `api-security-best-practices`  
6. `database-architect` / `database-design` (when any data layer is present)  

**These six skills alone satisfy the GSD persistent-planning hooks, BMAD handoff checklists, quality gates, and artifact population for every agent.**

**Role / Workflow Specific Minimal Bundles**  
(Only skills *beyond* the universal core. All bundles stay 6–10 total skills max.)

| Workflow / Agent | Minimal Bundle (core + add-ons) | Notes / Conditional Add-ons |
|------------------|---------------------------------|-----------------------------|
| **GSD + Persistent Planning** (base workflow) | + `error-handling-patterns`, `systematic-debugging` + `test-fixing`, `e2e-testing-patterns`, `docker-expert` + `github-actions-templates` | Covers EXECUTE/VERIFY/COMMIT + 3-strike protocol + deployment. Domain add-ons only when SPEC.md indicates. |
| **Master** | + `ddd-strategic-design` + `ddd-tactical-patterns`, `nextjs-best-practices`, `tailwind-patterns` + `tailwind-design-system`, `shadcn` + `radix-ui-design-system`, `postgresql` + `prisma-expert` (or `drizzle-orm-expert`) | Frontend-heavy due to `generate-ai-frontend-prompt`. |
| **PM** | + `ddd-strategic-design` + `ddd-tactical-patterns` + `ddd-context-mapping`, `observability-engineer` | Pure strategic/requirements layer. |
| **Analyst** | + `ddd-strategic-design` + `ddd-tactical-patterns` + `ddd-context-mapping`, `observability-engineer` | Same as PM; no implementation skills. |
| **Architect** | + `ddd-strategic-design` + `ddd-context-mapping`, `observability-engineer`, `cqrs-implementation`, `event-sourcing-architect` (optional for complex PRDs) | Advanced patterns only when PRD demands scale. |
| **QA** | + `unit-testing-test-generate`, `e2e-testing-patterns`, `systematic-debugging` + `test-fixing`, `observability-engineer`, `wcag-audit-patterns` (if UI) | Heavy testing/QA focus; `production-code-audit` already in core. |
| **Orchestrator** | + `ddd-strategic-design` + `ddd-tactical-patterns`, `postgresql` + `prisma-expert` (or `drizzle-orm-expert`) | Lightweight coordinator; no deep impl. |
| **UX** | + `nextjs-best-practices`, `tailwind-patterns` + `tailwind-design-system`, `shadcn` + `radix-ui-design-system`, `ux-flow`, `wcag-audit-patterns` + `ui-pattern` | Pure frontend/UX cluster (replaces generic `frontend-dev-guidelines` with specifics). |
| **PO** | + `ddd-strategic-design` + `ddd-context-mapping`, `ux-flow` + `ui-pattern` | Strategic requirements only. |
| **Dev** | + `unit-testing-test-generate` + `e2e-testing-patterns`, `systematic-debugging` + `test-fixing`, domain-specific (e.g. `nodejs-best-practices`, `prisma-expert`, `nextjs-best-practices`, `docker-expert`, etc.) | Implementation-heavy; pull domain skills from pruning plan only when `devStoryLocation` indicates. |
| **SM** (Scrum Master) | + `ddd-strategic-design` + `ddd-context-mapping`, `github-actions-templates` | Process/quality gatekeeper only. |
| **Self-Audit** (meta) | + `systematic-debugging` + `test-fixing` | Already covered by core; no extras needed. |
| **Shard-skill** (meta) | + `ux-flow` | Already covered by core; `ux-flow` adds progressive-disclosure thinking for Resources/TOC. |

**BMad Task-Specific Bundles** (activate only when the exact task runs)

- **facilitate-brainstorming-session**: + `ddd-strategic-design`, domain patterns (`ux-flow`/`ui-pattern` or `database-optimizer` or `api-security-best-practices`), `production-code-audit` (for post-ideation validation).  
- **create-deep-research-prompt**: + `prompt-engineering`, `multi-agent-patterns` + `parallel-agents`, `citation-management`, `advanced-evaluation`.  
- **generate-ai-frontend-prompt**: + `nextjs-best-practices`, `tailwind-patterns` + `shadcn` + `radix-ui-design-system`, `ux-flow` + `ui-pattern`, `prompt-engineering`.  
- **brownfield-create-story**: + `analyze-project`, `c4-architecture-*` family, `codebase-cleanup-refactor-clean`, `framework-migration-legacy-modernize`.

**Domain Add-ons (pull only when SPEC/PRD/architecture file indicates)**  
- **Frontend-heavy**: `nextjs-best-practices`, `tailwind-patterns` + `shadcn` + `radix-ui-design-system`, `wcag-audit-patterns`.  
- **Database-heavy**: `postgresql` + `postgres-best-practices`, `prisma-expert` / `drizzle-orm-expert`, `database-optimizer`.  
- **Advanced backend**: `observability-engineer`, `error-handling-patterns`, `cqrs-implementation`, `event-sourcing-architect`, `microservices-patterns`, `docker-expert` + `github-actions-templates`.  
- **Deployment/ops**: `kubernetes-deployment`, `terraform-infrastructure`, `gitops-workflow` (rarely needed at early agents).

**Resolved Issues from Original Document**  
- **Redundancies removed**: All 20+ near-identical tables and “why it pairs” paragraphs for the six universal core skills have been collapsed into one list. Repeated rationale text (e.g., “feeds findings.md / task_plan.md”, “BMAD handoff checklist”, “production-grade guardrails”) is now stated once.  
- **No contradictions existed**, but minor inconsistencies in bundle size wording (6–8 vs 8–10 vs 12–15) and “always-on vs conditional” language have been standardized to “universal core + minimal add-ons” while respecting the pruning plan’s “ignore the other 1,400 skills” rule. Non-coding agents (PM, Analyst, PO, Orchestrator, SM) explicitly exclude deep implementation skills.  
- **Naming standardized**: Consistent use of `ddd-strategic-design` + `ddd-tactical-patterns` + `ddd-context-mapping` family; `prisma-expert` (or `drizzle-orm-expert`); `frontend-dev-guidelines` vs specific Next.js/Tailwind/shadcn when UX/frontend task is active.  
- **Lean result**: Every workflow now has a **single, auditable, 6–10 skill maximum bundle** that directly feeds GSD persistent artifacts, BMAD handoffs, and quality gates with zero bloat.

This single guide replaces the entire original multi-section file while retaining 100 % of its value and intent. Activate via the BMad catalog’s trigger system exactly as the pruning plan intended.