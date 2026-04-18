# System Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Conventional Commits](https://www.conventionalcommits.org/).

## [Unreleased]

## [v1.6.1] - 2026-04-18

### Patch
- fix(audit): correct portability URIs and missing metadata

## [v1.6.0] - 2026-04-18

### Minor
- feat(persistent-planning): integrate gemini-planning-with-files v1.6.0

## [v1.5.2] - 2026-04-18

### Patch
- fix(docs): correct skills pack branding in README

## [v1.5.1] - 2026-04-18

### Patch
- chore(semver): polish changelog automation to include commit summaries

## [v1.5.0] - 2026-04-18

### Minor
- Automated release via local SemVer tooling.

## [1.3.0-hardening] - 2026-04-18

### Changed
- Intelligently consolidated redundant documents (`docs/CHANGELOG.md`) into a unified root directory timeline to simplify reading.
- Finalized and documented the comprehensive progress tracking records for the v1.3.0-hardening remediation epic into the changelogs.

### Fixed
- Replaced non-portable hardcoded Windows `file://` URIs with repo-relative paths (e.g. `./resources/...`) across seven critical sharded skills ensuring cross-platform stability (PR #3).
- Wired missing orphan hooks (`statusLine`, `BeforeTool`) and implemented Dual-Environment runtime-aware event behavior to gracefully match Antigravity and Claude Code native events (PR #2).
- Restored unmapped shell lifecycle hook scripts (`gsd-session-state`, `gsd-phase-boundary`, `gsd-validate-commit`) ensuring the `.agents/settings.json` execution payload drops safely globally (PR #1).

### Other
- **Governance Hardening Epic**: Completed massive architectural ultrareview remediation epic enforcing version parity (`[v1.3.0-hardening]`), R-P6 atomicity rules, and strict R-C-S-R separation schemas centrally.

## [1.1.0] - 2026-04-06

### Added
- **Governance Audit Complete**: Finalized full architectural integrity audit.
- **Systematic Sharding**: Sharded 5 critical oversized skills (Sutskever, Karpathy, Hinton, Altman, React Best Practices) into modular resource patterns to satisfy the 12,000-character system limit.
- **Linting Remediation**: Enforced repo-wide Markdown compliance (MD022, MD032, MD040).

### Changed
- Refined `state.md` to reflect the completion of the audit phase.
- Standardized `.agents/skills/` resource mapping for better context loading.

## [1.0.0] - 2026-04-05

### Added
- Integrated BMAD Agile Squad (43 skills mapped into `.agents/skills/`).
- Enforced native GSD workflow configuration.
- Instantiated the 6 Core Antigravity Rules configuration.
- Created `docs/` repository for system manuals.

### Changed
- Shifted all dependencies into universal `.agents/` singleton structure.
- Removed hallucinated multi-folder redundancies (`.agent`, `_bmad`).
