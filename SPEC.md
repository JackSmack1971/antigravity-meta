# SPEC.md: PM Intelligent Changelog Generation

**Goal**: Execute a complete GSD-with-persistent-planning loop acting as /pm to compile an intelligent `CHANGELOG.md` from git logging parameters.

**Requirements**:
1. Output strict `Keep a Changelog v1.1.0` standard structuring.
2. Distil literal git queries into comprehensive bullets clustered by standard action markers (`Added`, `Changed`, `Fixed`, `Deprecated`, `Removed`, `Security`, `Performance`, `Other`).
3. Set the highest blocks to `[Unreleased]` and `[1.3.0-hardening]`. Note breaking changes explicitly if applicable.
4. Keep the historical mappings exactly untouched beneath the injection line.
5. Provide a large `task_plan.md` to definitively trigger the `R-P6` preservation prune prior to completion.
6. Verify `/self-audit` yields 0 critical hits immediately preceding the final commit phase.
