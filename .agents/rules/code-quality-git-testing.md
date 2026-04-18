# Code Quality & Git Testing

- **Clean Code Contract**:
  - Functions must not exceed 25 lines.
  - Cyclomatic complexity must be $\le 10$.
  - 100% exported API documentation (e.g., JSDoc, docstrings).
  - Zero raw `any` types.
- **Test-Driven Development**: Write failing tests prior to logic (RED), make them pass (GREEN), then REFACTOR.
- **Conventional Commits**:
  - Schema: `<type>(<scope>): <subject>`
  - Types allowed: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
  - Scope is MANDATORY.
  - Breaking changes MUST use `!` and include `BREAKING CHANGE:` footer.
