# Examples: planning-with-files in GSD Workflow

## Example 1: REST API Feature

### Scenario
User: "Add user authentication to the REST API."

### GSD + planning-with-files Flow

**Spec phase:**
- Read `SPEC.md`: "Add JWT-based authentication; endpoints: /login, /logout, /refresh"
- Run: `init-session.sh --from-spec auth-feature`
- `task_plan.md` created with phases derived from spec.

**Plan phase:**
- task_plan.md Phase 2: Architecture & Planning
- findings.md: "JWT library: python-jose; bcrypt for hashing; Redis for refresh tokens"
- state.md pointer added: "Auth research: See findings.md"

**Execute phase (hooks active):**
- PreToolUse fires → injects task_plan.md first 30 lines before every Write
- Write auth.py → PostToolUse fires → "Update progress.md"
- After 2 web searches → update findings.md (2-Action Rule)
- Error: "bcrypt import failed" → logged in task_plan.md Errors table, attempt 1

**Verify phase:**
- Test results → progress.md Test Results table
- All tests pass → Phase 4 status → complete

**Commit phase:**
- Stop hook fires → check-complete.sh → "ALL PHASES COMPLETE (5/5)"
- Commit following code-quality-git-testing.md

---

## Example 2: Session Recovery

### Scenario
Developer closes IDE mid-Execute, reopens next day.

### Recovery Flow
1. Agent Manager starts → SessionStart hook fires.
2. Hook reads task_plan.md: "Phase: Execute; Planning Phase: 3; in_progress"
3. Hook shows last 20 lines of progress.md: last action was "Created auth.py"
4. session-catchup.py scans previous session for unsynced context.
5. Agent resumes at Phase 3 Execute without any user re-explanation.

---

## Example 3: BMAD Integration

### Scenario
User: "/architect — design the auth system"
Then user: "/dev — implement it"

### Flow
- `/architect` invoked → architect agent reads `findings.md` (discoveries section)
- Architect populates `findings.md` Technical Decisions table
- `/dev` invoked → developer reads `task_plan.md` Phase 3 as task list
- PreToolUse fires before every dev tool call — keeps plan in context
- PostToolUse fires after writes — reminds dev to update `progress.md`

### No Conflicts
`/plan` was NOT invoked in this example — BMAD commands operate independently.
Planning files exist and hooks are active regardless of which BMAD agent is active.

---

## Example 4: Error Recovery with 3-Strike Protocol

### Scenario
Database migration fails 3 times.

### progress.md Error Log
```markdown
| 2026-01-15 14:00 | MigrationError: column exists | 1 | Added IF NOT EXISTS |
| 2026-01-15 14:05 | MigrationError: permission denied | 2 | Elevated privileges |
| 2026-01-15 14:10 | MigrationError: lock timeout | 3 | Added retry with backoff |
```

### task_plan.md Errors Table
```markdown
| MigrationError: lock timeout | 3 | Retry with exponential backoff | Execute |
```

After 3 failures → escalate to user with the Errors table as evidence.
