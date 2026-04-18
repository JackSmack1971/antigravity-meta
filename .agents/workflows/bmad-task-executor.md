## bmad-task-executor (v1.0.0)

**Purpose**: Parameterized single source of truth for all bmad-task-* workflows.

**Input variables** (passed via task_path):
- task_path: string (path to the external task file, e.g. ".bmad-core/tasks/create-brownfield-story.md")

### Step 1: Read external task
view_file ${task_path}
notify_user "Task file loaded. Reviewing requirements..."

### Step 2: Execute core GSD phases
1. Read the task definition completely.
2. Execute the task strictly following the instructions in the file.
3. Validate artifacts produced against defined exit criteria.

### Step 3: Callback & notification (centralized)
**CRITICAL**: When the task requires user interaction, elicitation, or waiting for feedback (e.g. "WAIT FOR USER RESPONSE"), you MUST use the `notify_user` tool or equivalent prompt.
- Present the options in the Message argument.
- Set BlockedOnUser to true.
- Do NOT proceed until you receive the user's response via the tool output in the next turn.

notify_user "Task complete. Waiting for feedback..."
