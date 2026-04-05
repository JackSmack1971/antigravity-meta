# Contributing & Maintenance

When expanding the Antigravity Hybrid Environment, strictly observe the following conventions:

1. **Single Source of Truth**: NEVER create duplicate architecture folders (e.g., `.agent`, `.bmad`). All extensions must reside inside `.agents/`.
2. **Atomic Commits**: Adhere to `code-quality-git-testing.md`. No monolithic commits. Use Conventional Commit prefixes (`feat:`, `fix:`, `chore:`).
3. **Rule Supremacy**: You may not bypass the rule constraints. If an agent struggles with an execution, refine the spec rather than disabling the safeguard.
4. **Skills Generation**: To contribute a local skill, drop a new folder containing the `SKILL.md` inside `.agents/skills/`.
