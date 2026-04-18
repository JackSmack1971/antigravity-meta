# Goal Description

The objective is to execute the newly hardened `/self-audit` workflow via a complete `GSD-with-persistent-planning` lifecycle, acting as the Architect. We will autonomously assess the repository's rules, workflows, and skills directories against the Antigravity Meta Architect rules to confirm that recent remediation actions have left zero Critical or Important findings. The output will be a comprehensive report written to `antigravity-meta-ultrareview-v1.3.0.md`, and we will explicitly exercise the new `R-P6` pruning rule, the `Phase Synchronicity Latch`, and the `AGENTS.md` version-aware header.

## User Review Required

> [!NOTE] 
> This involves generating `SPEC.md`, `task_plan.md`, `progress.md`, and `VERIFY.md` to rigorously map out the GSD cycle before synthesizing the `antigravity-meta-ultrareview-v1.3.0.md` report. 
> Please review the execution path to ensure it matches your expectations for the post-hardening meta-review.

## Proposed Changes

### Configuration and State Tracking
- **`SPEC.md`**: Will establish the exact acceptance criteria matching the user prompt.
- **`task_plan.md`**: Will map the GSD phases. It will be deliberately structured so that we can trigger and verify the new `R-P6` (Plan Pruning Rule) for context exhaustion mitigation.
- **`state.md`**: Will track the transition to the `SELF_AUDIT` state and logs completion timestamp.

### Execute Phase (Self-Audit)
- **Context Ingestion**: We will load `AGENTS.md` to verify the v1.3.0-hardening dynamic header and conflict resolution matrix.
- **Rule Check**: We will use `view_file` to inspect `.agents/rules/*.md` files, ensuring none contain `---` YAML frontmatter and all use `## ─────`.
- **URI Check**: We will grep `.agents/workflows/` and `.agents/skills/` to ensure absolute `file:///` compliance and reject any relative `./resources/` paths.
- **Output Report Generation**: We will synthesize all checks into the newly requested `antigravity-meta-ultrareview-v1.3.0.md` report, confirming zero bypass threats, zero capability overstatements, and zero phantom-phase loops.

### Verification and Commit
- **`VERIFY.md`**: Will assert the existence of the meta-ultrareview report, confirming the required R-P6 rotation occurred via `progress.md` tracking.
- **Git Commit**: We will execute the command: `git commit -m "chore(governance): complete ultrareview remediation v1.3.0-hardening"`.

## Open Questions

None at this time. The directives are absolute and the state vectors are aligned for final review.

## Verification Plan

### Automated Checks
- The `/self-audit` logic provides empirical checks against markdown sizes (12k chars max), URI patterns, and Frontmatter presence. We will use native bash hooks and standard execution flows to verify synchronicity latch triggers and boundary stability.
