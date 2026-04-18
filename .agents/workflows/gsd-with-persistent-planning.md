---
name: gsd-with-persistent-planning
description: >
  Extended GSD atomic workflow with planning-with-files persistent memory.
  Adds task_plan.md, findings.md, and progress.md checkpoints at each GSD phase
  to prevent goal drift in long sessions, enable session recovery, and provide
  detailed audit trails. Fully backward-compatible with the base GSD workflow.
version: "1.0.0"
extends: gsd-core
requires:
  - skill: planning-with-files
  - rules: [gsd-core-rules, hybrid-protocol, rugged-software-constitution,
             security-mandate, strong-reasoner-planner, code-quality-git-testing]
---

# GSD + Persistent Planning Workflow

This workflow extends the GSD atomic loop with Manus-style persistent planning files.
All 6 core rules remain fully enforced. The planning files are additive artifacts —
they never replace GSD files (SPEC.md, task.md, state.md).

---

## Extended Atomic Loop

```
SPEC.md ──► task_plan.md ──► Execute ──► Verify ──► Commit
   │              │              │           │          │
   │         findings.md     progress.md  progress.md  │
   │         (feeds        (logs actions  (test        │
   │          state.md)     + errors)      results)     │
   └──────────────────────────────────────────────────►
                   All 6 core rules enforced throughout
```

---

## Phase 1: SPEC

**GSD goal:** Define what to build.
**planning-with-files additions:**

1. Read `SPEC.md` completely.
2. Run init-session.sh / init-session.ps1 with `--from-spec` flag.
3. Populate `task_plan.md` with phases derived from spec requirements.
4. Document spec analysis in `findings.md` (Spec Analysis section).
5. No GSD file duplication: `task_plan.md` adds phase detail; `SPEC.md` remains authoritative.

**Checkpoint before advancing to Plan phase:**
- [ ] `task_plan.md` phases align with `SPEC.md` requirements
- [ ] `findings.md` Spec Analysis section populated
- [ ] `task_plan.md` Phase 1 status → `complete`

---

## Phase 2: PLAN

**GSD goal:** Decide how to build it.
**planning-with-files additions:**

1. Re-read `task_plan.md` (BeforeTool hook fires automatically).
2. Populate `task_plan.md` Phase 2: Architecture & Planning.
3. Document technical decisions in `findings.md` (Technical Decisions table).
4. Add pointer to `state.md`: `"Research context: See findings.md"`.
5. Update `task.md` current phase pointer.

**Checkpoint before advancing to Execute phase:**
- [ ] `task_plan.md` Phase 2 status → `complete`
- [ ] Technical approach documented in `findings.md`
- [ ] `state.md` has pointer to `findings.md`
- [ ] No conflicts with `.agents/rules/` constraints

---

## Phase 3: EXECUTE

**GSD goal:** Build it.
**planning-with-files additions:**

1. BeforeTool hook fires before EVERY tool call — injects `task_plan.md` first 30 lines.
2. After every 2 search/view operations → update `findings.md` (2-Action Rule).
3. After every significant file change → AfterTool hook fires → update `progress.md`.
4. On any error → log in `task_plan.md` Errors table AND `progress.md` Error Log.
5. Apply 3-Strike Error Protocol (never repeat the same failing action).
6. `code-quality-git-testing.md` enforced: no shortcuts on quality gates.

**Checkpoint before advancing to Verify phase:**
- [ ] `task_plan.md` Phase 3 status → `complete`
- [ ] All significant actions logged in `progress.md`
- [ ] No unresolved errors in `task_plan.md` Errors table

---

## Phase 4: VERIFY

**GSD goal:** Confirm it works.
**planning-with-files additions:**

1. Log all test results in `progress.md` Test Results table.
2. Log any verification failures in `task_plan.md` Errors table.
3. Apply 3-Strike protocol for test failures.
4. Confirm `security-mandate.md` compliance; log findings in `findings.md` Security section.
5. Update `task_plan.md` Phase 4 status → `complete`.

**Checkpoint before advancing to Commit phase:**
- [ ] All tests passing (logged in `progress.md`)
- [ ] `task_plan.md` Phase 4 status → `complete`
- [ ] No open security findings in `findings.md`

---

## Phase 5: COMMIT

**GSD goal:** Ship it.
**planning-with-files additions:**

1. Run `check-complete.sh` / `check-complete.ps1` — confirms all phases complete.
2. Stop hook fires automatically if any phases are incomplete → blocks premature commit.
3. Update `progress.md` with final session summary.
4. Sync summary to `task.md` (update Last Updated + Session Summary).
5. Commit following `code-quality-git-testing.md` conventions.

**Pre-commit checklist:**
- [ ] `check-complete.sh` reports ALL PHASES COMPLETE
- [ ] `progress.md` final session entry added
- [ ] `task.md` synced with final status
- [ ] All `code-quality-git-testing.md` requirements met
- [ ] Commit message follows project conventions

---

## Session Recovery

After `/clear`, IDE restart, or any context loss:

1. Agent Manager auto-fires SessionStart hook.
2. Hook reads `task_plan.md` + `progress.md` + runs `session-catchup.py`.
3. Agent resumes from correct GSD phase without manual re-invocation.
4. User can also run `/plan:status` for an instant status snapshot.

---

## BMAD Integration

This workflow is fully compatible with BMAD agent simulation:

| BMAD Command | planning-with-files Role |
|-------------|--------------------------|
| `/pm`       | PM reads `task_plan.md` to understand phases |
| `/architect`| Architect populates `findings.md` Architecture section |
| `/dev`      | Dev uses `task_plan.md` Phase 3 as task list |
| `/qa`       | QA populates `progress.md` Test Results table |
| `/analyst`  | Analyst populates `findings.md` Research Findings |
| `/po`       | PO cross-checks `task_plan.md` against `SPEC.md` |

BMAD commands take precedence when invoked by name. `/plan` and `/plan:status`
are additive — they do not interfere with any BMAD agent's scope.

---

## Error Handling & Repeated Failures

```
ATTEMPT 1: Diagnose & Fix
  → Read error; identify root cause; targeted fix; log in task_plan.md Errors

ATTEMPT 2: Alternative Approach
  → Different method/tool/library; NEVER repeat exact same failing action

ATTEMPT 3: Broader Rethink
  → Question assumptions; re-read SPEC.md; consider updating task_plan.md phases

AFTER 3 FAILURES: Escalate to User
  → Share task_plan.md Errors table; explain what was tried; ask for guidance
```

Log format (both `task_plan.md` Errors table AND `progress.md` Error Log):

```markdown
| Error description | Attempt # | Resolution attempted | GSD Phase |
```

---

## Performance Notes

- Hooks are designed for zero performance regression in Agent Manager auto-loading.
- BeforeTool only reads first 30 lines of `task_plan.md` — O(1) I/O.
- SessionStart catchup runs asynchronously; never blocks agent startup.
- All hooks exit 0 immediately if no planning files exist — no overhead on non-planning tasks.
