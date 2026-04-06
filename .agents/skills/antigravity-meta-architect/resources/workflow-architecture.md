# **Architecting Production-Grade Workflows for Google Antigravity IDE: A Master Specification**

## **Executive Summary**

The official release of the Google Antigravity Integrated Development Environment (IDE) in November 2025 marked a definitive inflection point in the trajectory of software engineering methodologies. By transitioning the industry standard away from synchronous, line-by-line coding assistants and toward a robust, agent-first orchestration paradigm, Antigravity fundamentally altered how developers interact with source code.1 Central to this evolution is the IDE’s multi-window architecture, which segregates the traditional text Editor from a dedicated "Mission Control" Agent Manager and an autonomous Browser Subagent.2 This architecture presupposes that the artificial intelligence is no longer merely an autocomplete utility, but an autonomous actor capable of planning, executing, validating, and iterating on complex, multi-repository engineering tasks with minimal human intervention.4

Underpinning this platform is the Gemini 3 model family, heavily relying on Gemini 3.1 Pro for deep architectural reasoning and multi-step planning, while utilizing lighter models like Gemini 2.5 Flash for background context summarization and semantic codebase search.1 However, the stochastic nature of Large Language Models (LLMs) presents a critical challenge when orchestrating complex engineering pipelines. Without rigorous deterministic guardrails, autonomous agents are susceptible to state drift, context saturation, and hallucinated architectural deviations.8

To bridge the gap between stochastic AI operations and deterministic engineering requirements, the Antigravity IDE utilizes a highly structured workflow execution engine. Within this ecosystem, a "Workflow" represents a codified standard operating procedure. Unlike traditional prompt libraries or generalized system instructions, workflows are declarative, file-based execution trajectories that command the Agent Manager through precise, interconnected sequences.10 They empower system architects to translate enterprise-grade methodologies—such as Test-Driven Development, visual regression verification, and legacy system refactoring—into repeatable, automated artifacts.10

This comprehensive research report delineates the rigorous architectural principles required to engineer the absolute best workflow files specifically for the Google Antigravity IDE. It provides an exhaustive analysis of file anatomies, precise storage path specifications, and the advanced macro-directives introduced in the AgentKit 2.0 runtime. By synthesizing the integration of Finite State Machine (FSM) paradigms through the Blackboard pattern, the analysis presents seven production-ready workflow templates. These templates leverage sophisticated routing, conditional branching, and multi-agent orchestration to ensure that enterprise systems remain highly resilient, auditable, and safeguarded against the inherent complexities of autonomous agentic development.

## **Specification & File Anatomy**

To fully leverage the capabilities of the Antigravity Agent Manager, workflow files must adhere to uncompromising formatting, sizing, and storage specifications. The IDE relies on a localized, file-based configuration resolution system to parse instructions, maintain project context, and execute commands predictably without relying on external databases.

### **Storage Paths and Directory Hierarchies**

The Antigravity platform operates on a dual-scope architecture for workflow definitions, providing flexibility for both universal utility across a developer's workstation and project-specific precision within isolated repositories.6 The resolution engine specifically scans the following exact storage paths upon initialization.

| Scope | Exact Storage Path | Architectural Purpose |
| :---- | :---- | :---- |
| **Global** | \~/.gemini/antigravity/global\_workflows/\<name\>.md | Universally accessible across all workspaces loaded into the IDE. Optimal for general-purpose utility tasks, standardized Git commit formatting, personal scaffolding preferences, or global documentation generation routines.11 |
| **Workspace** | \<workspace-root\>/.agents/workflows/\<name\>.md | Restricted strictly to the specific repository. Handles domain-specific logic, proprietary deployment pipelines, custom architecture refactoring, and integration with local Model Context Protocol (MCP) servers.6 |

A critical structural evolution occurred during the v1.20.3 update, which established the pluralized .agents directory as the definitive cross-tool standard.12 Early iterations of the platform utilized a singular .agent directory. While the IDE's parsing engine maintains backward compatibility for legacy .agent folders to prevent breaking changes in older repositories, modern enterprise deployments must exclusively utilize the plural .agents/workflows/ path.13 This standardization ensures seamless interoperability with the broader ecosystem of AI tooling and open-source orchestration frameworks that have adopted the AGENTS.md specification.12

### **Structural Anatomy and Constraints**

Every Antigravity workflow must be defined as a standard Markdown (.md) file. To be successfully parsed, validated, and executed by the internal runtime, the file must conform to several rigid structural and syntactical constraints.

The most prominent constraint is the strict limitation of 12,000 characters per workflow file.10 This limitation is not an arbitrary storage restriction; rather, it is a deliberate architectural design intended to prevent attention dilution within the LLM's context window. While models like Gemini 3.1 Pro possess massive context capabilities extending beyond one million tokens, feeding overly verbose, monolithic instructional sequences degrades the agent's ability to maintain strict adherence to immediate task parameters.15 Workflows exceeding the 12,000-character limit will either be aggressively truncated by the IDE parser or fail to execute entirely. This constraint forces architects to adopt modular design patterns, breaking massive automation pipelines into smaller, composable sub-workflows that invoke one another.10

Furthermore, the file must initiate with YAML frontmatter. At an absolute minimum, this frontmatter must contain a description key.17 The Antigravity interface parses this YAML block to populate the Agent Manager's dynamic command dropdown menu, providing human operators with contextual tooltips and equipping the agent with semantic understanding of the workflow's overarching objective.6

Workflows also natively support shell-style parameter injection. When a human operator invokes a workflow, they can pass trailing arguments which the engine dynamically resolves within the Markdown body. For instance, an invocation of /deploy staging v1.2.3 prompts the engine to map the string "staging" to the variable $1 and "v1.2.3" to $2 anywhere these placeholders appear in the workflow file.19 This dynamic parameterization transforms static markdown documents into highly flexible, reusable functional macros.

Ultimately, workflows are exclusively triggered via the slash command syntax (e.g., /workflow-name) directly within the Agent Manager's chat interface.10 This explicit invocation differentiates workflows from background rules or autonomously selected skills, placing deterministic control firmly in the hands of the human orchestrator.

## **Architectural Framework: Workflows, Rules, and Skills**

A pervasive anti-pattern in the adoption of agentic IDEs involves confounding the distinct purposes of the various configuration files, leading to context saturation and unpredictable agent behavior.8 Elite system architecture demands a rigorous delineation of responsibilities across what can be termed the "Triad of Agent Control": Rules, Skills, and Workflows.8

### **Rules: Passive, Persistent Constraints**

Rules are the foundational governance mechanisms of the workspace, located globally (e.g., \~/.gemini/GEMINI.md or the newer cross-tool standard \~/.gemini/AGENTS.md) and locally (.agents/rules/\*.md and the repository root AGENTS.md).8 They function as the immutable constitution of the project.

The nature of a Rule is entirely passive and persistent. They are generally "always-on," silently injected into the system prompt at the beginning of every session, or dynamically activated based on file glob patterns (such as applying specific React linting rules only when a src/\*\*/\*.tsx file is accessed).10 Rules do not tell an agent *what* to do; they dictate *how* the agent must behave across all operations. They enforce coding standards, demand Test-Driven Development protocols, establish security boundaries (e.g., "Never commit .env files"), and define the required tone of the agent's output.8

### **Skills: Agent-Triggered Subroutines**

Skills occupy the middle ground of the autonomy spectrum and reside within dedicated directories such as .agents/skills/\<skill-folder\>/SKILL.md.14 They represent the agent's modular, specialized toolbelt.

Unlike Workflows, Skills are active but highly autonomous. The human operator does not typically invoke them directly via a slash command. Instead, when an objective is provided, the Gemini reasoning engine evaluates the catalog of available skills by scanning their names and descriptions. If a skill semantically matches the required task—such as a database-migration skill or a playwright-automation skill—the agent autonomously reads the comprehensive SKILL.md file and executes its specialized logic.8 Skills encapsulate deep methodologies, instructing the agent on exactly how to leverage specific Model Context Protocol (MCP) servers, execute bundled helper scripts, or format complex JSON payloads without requiring the user to hold that knowledge.8

### **Workflows: Deterministic Trajectory Controllers**

Workflows, residing in .agents/workflows/\<name\>.md, are the active, user-triggered Standard Operating Procedures (SOPs) of the development lifecycle.8

The defining characteristic of a Workflow is its ability to temporarily strip the agent of its open-ended autonomy. While a Skill informs the agent on *how* to perform a task if it independently decides the task is necessary, a Workflow rigidly *forces* the model through a pre-defined sequence of interconnected steps.8 They are the codification of repetitive, complex developer pipelines. By invoking a slash command, the architect dictates a strict trajectory, ensuring that the agent performs operations like code generation, unit testing, and documentation updating in a specific, unalterable order.10

| Architectural Feature | Rules (.agents/rules/) | Skills (.agents/skills/) | Workflows (.agents/workflows/) |
| :---- | :---- | :---- | :---- |
| **Invocation Mechanism** | Passive (Always On or Glob match) | Agent-Triggered (Contextual selection) | User-Triggered (/slash-command) |
| **Primary Architectural Use** | Coding standards, security limits, global boundaries | Specialized task knowledge, complex MCP tool usage | Repetitive pipelines, SOPs, multi-agent orchestration |
| **Structural Format** | Markdown guidelines | Folder containing SKILL.md and helper scripts | Markdown file featuring YAML frontmatter and // directives |
| **Agent Autonomy Level** | High (Guides autonomous choices) | Medium (Agent chooses to invoke and adapt) | Low (Strict step-by-step sequential execution) |

## **Advanced Syntax and Execution Directives**

The transition from a standard chat interface to a robust execution engine is facilitated by the advanced syntax capabilities introduced in the AgentKit 2.0 runtime, which powers the later versions of Google Antigravity.18 This runtime enables workflows to operate as highly sophisticated Domain Specific Languages (DSLs), supporting macro-directives that drastically expand the boundaries of prompt execution.

The implementation of these directives allows workflows to break free from linear text generation and interact dynamically with the IDE's terminal, browser, and file system. The parsing engine recognizes specific annotations prefixed by // to trigger these advanced computational behaviors.17

| Directive Syntax | Execution Mechanics and Architectural Purpose |
| :---- | :---- |
| **// parallel** | Instructs the orchestration engine to spawn concurrent agent threads for the immediate subsequent steps. This resolves the latency bottlenecks associated with linear execution, allowing the system to handle non-blocking operations—such as installing package dependencies while simultaneously executing static type checks—drastically reducing total wall-clock execution time.18 |
| **// if \[condition\]** | Introduces boolean logic gates into the workflow sequence. The agent evaluates the natural language or programmatic condition (e.g., verifying if a test suite output contains failure flags). The subsequent operational step is only executed if the condition resolves to true, enabling sophisticated self-healing loops and error handling.18 |
| **// run workflow: \[name\]** | The primary mechanism for workflow chaining and composition. It permits one workflow to autonomously invoke another. This is critical for bypassing the 12,000-character constraint, enabling architects to construct massive "Super-Workflows" that orchestrate multiple specialized sub-workflows in sequence.10 |
| **// capture:** | Directs the agent to capture the standard output, terminal log, or result of a specific step and store it within a named variable. This variable can then be referenced downstream in the workflow execution using Handlebars syntax {{VAR\_NAME}}, allowing for dynamic data passing between discrete steps.18 |
| **// turbo** | By default, the IDE's Review Policy restricts agents from executing terminal commands without explicit human approval. Placing // turbo directly above a step temporarily bypasses this restriction, setting the SafeToAutoRun flag to true for that specific operation. This is essential for non-destructive operations like directory creation or dependency installation.17 |
| **// turbo-all** | When placed anywhere within the workflow document, this global annotation grants the agent full autonomous execution privileges for the entirety of the workflow, bypassing all interactive prompts. This should be utilized with extreme caution and only on heavily tested, non-destructive pipelines.17 |

## **Best-Practice Principles for Workflow Engineering**

Deploying effective automation in Antigravity requires a fundamental paradigm shift from traditional imperative programming toward Spec-Driven Development (SDD) and agentic orchestration.23 Elite systems architects do not merely write prompts; they engineer constrained operational environments. The following principles distinguish production-grade workflows from rudimentary instructional text.

### **The Blackboard Pattern and State Management (state.md)**

The most significant vulnerability of agentic development is state drift. Because Large Language Models are stochastic systems, orchestrating multiple agents across long temporal horizons often results in "hallucinated" progress, where the agent forgets its overarching objective or assumes a task is complete before it has been verified.9 Elite architectures mitigate this through the strict implementation of the Blackboard Pattern.9

This pattern involves establishing a central file, typically designated as state.md at the project root, which serves as the definitive state vector and the single source of truth for the entire AI squad.9 The project is effectively modeled as a Finite State Machine (FSM). Every workflow is engineered to consistently read from and write to this file.9

Crucially, the Blackboard Pattern enables the creation of "Safety Latches".9 Before an agent is permitted to write source code, the workflow forces the agent to read state.md. If the Current Stage variable does not explicitly equal a pre-approved state (e.g., USER\_APPROVAL\_PENDING), the workflow forces the agent to halt execution and output a failure protocol.9 This architectural safeguard guarantees that highly stochastic agents can never autonomously modify the codebase unless the deterministic FSM indicates that it is safe and authorized to do so.

### **Artifact-First Execution Protocol**

Workflows must strictly prohibit the output of raw, unstructured code directly into the chat interface. Ephemeral chat logs are not version-controlled, are difficult to audit, and degrade context rapidly.5 Instead, workflows must enforce the "Artifact-First" protocol, mandating the generation of persistent, human-readable Markdown artifacts that externalize the agent's cognitive process and work history.27

These artifacts are generally stored in an .antigravity/brain/ or artifacts/ directory and include several core typologies.5 The implementation\_plan.md outlines the proposed technical architecture before execution begins.5 The task.md serves as a granular checklist, with workflows directing the agent to cross off items using the built-in task\_boundary tool.5 Finally, the walkthrough.md is generated post-execution to provide a summary of completed work, incorporating visual evidence such as browser screenshots or verification logs.5 By explicitly demanding these artifacts, the workflow transitions the agent from a conversational chatbot into a rigorous, auditable engineering entity.5

### **Context Optimization and the "Lost in the Middle" Phenomenon**

Despite the Gemini 3.1 Pro model boasting a massive context window capable of ingesting entire repositories, practical application reveals that AI models inevitably suffer from context degradation over extended, continuous sessions.15 The "Lost in the Middle" phenomenon dictates that as context grows, agents may preserve overarching architectural decisions while discarding nuanced instructional details or recent tool outputs.16

Elite workflows actively manage this limitation through proactive compaction strategies. A master orchestration workflow should incorporate explicit steps that trigger the IDE's /compact utility to summarize older messages while retaining recent context.15 Furthermore, advanced workflows utilize a /handoff sub-routine to compile the current FSM state, lessons learned, and active tasks into a structured HANDOFF.md file. This permits the human architect to initiate a completely fresh session, unburdened by bloated chat history, while seamlessly maintaining the project's operational trajectory.15

### **Explicit Permission Boundaries**

Unfettered autonomy is an architectural hazard. Based on comprehensive analyses of over 2,500 repositories utilizing custom agent configurations, the most successful workflows establish strict, unambiguous "Don't Touch" zones and permission boundaries.16

Workflows must delineate operations into a definitive three-tier hierarchy.16

| Permission Tier | Operational Definition | Example Tasks |
| :---- | :---- | :---- |
| **Always (Autonomous)** | Operations the agent may execute continually without prompting for human approval. | Reading source files, running single-file linters, executing isolated unit tests, formatting code.22 |
| **Ask First (Gated)** | Operations requiring explicit human sign-off via the IDE's Review Policy before proceeding. | Database schema alterations, adding external dependencies (npm install), modifying CI/CD configurations, executing Terraform deployments.16 |
| **Never (Restricted)** | Operations the agent is strictly prohibited from attempting under any circumstances. | Committing .env files, force-pushing to production branches, circumventing the FSM state machine.16 |

These boundaries must be explicitly coded into the workflow logic or deeply embedded within the overarching AGENTS.md rule set to ensure that self-healing loops do not inadvertently result in destructive infrastructure operations.22

## **Production Workflow Templates**

The following seven templates represent highly optimized, production-grade workflows engineered specifically for the Gemini 3 Pro model operating within the Antigravity IDE. To function correctly, they must be saved exclusively within the \<workspace-root\>/.agents/workflows/ directory, adhering strictly to the YAML frontmatter specifications and utilizing the advanced AgentKit 2.0 macro-directives.

### **Template 1: The Artifact-First Scaffolder (/scaffold)**

This workflow demonstrates dynamic parameter passing, the utilization of the // turbo directive for autonomous directory initialization, and the rigorous enforcement of the Artifact-First protocol to prevent unverified code generation.

## ---

**description: Scaffolds a new feature by generating strict implementation plans before execution.**

# **Feature Scaffolding Protocol**

**Target Feature:** $1

1. **Context Ingestion:** Read AGENTS.md and state.md to understand the current architectural guidelines and the Finite State Machine status.  
2. **Specification Generation:** Do NOT write source code. Act as a Lead Systems Architect. Create a detailed architectural specification for the feature "$1". Ensure the specification strictly adheres to the boundaries defined in AGENTS.md.  
   // turbo  
3. Run mkdir \-p.antigravity/brain/artifacts/  
4. **Artifact Creation:** Save the generated specification to .antigravity/brain/artifacts/implementation\_plan\_$1.md.  
5. **Task Breakdown:** Break the implementation plan into highly granular, sequential sub-tasks. Save this structured checklist to .antigravity/brain/artifacts/task\_$1.md.  
6. **Safety Latch Update:** Update the Blackboard state file (state.md), setting the Current Stage variable to PLANNING\_COMPLETE.  
7. **Execution Halt:** Terminate the workflow immediately. Prompt the user with the following exact phrase: "Scaffolding complete. Please review the implementation plan and task list. Reply 'Proceed' to begin execution phase."

**Execution Analysis:** By utilizing the $1 parameter, the workflow dynamically adapts to any feature requested via the chat interface (e.g., /scaffold authentication\_module). The // turbo directive allows the agent to create the artifact directories without triggering the IDE's security review policy, minimizing friction.17 Crucially, the workflow terminates before any application code is written, enforcing the Spec-Driven Development (SDD) methodology and allowing the human architect to intercept and correct hallucinations in the planning phase.23

### **Template 2: The Multi-Agent PR Reviewer (/pr-review)**

This template acts as an adversarial Senior Security Engineer, capturing local terminal output into a variable and reviewing staged diffs against global project rules.

## ---

**description: Acts as an adversarial Senior Engineer to review staged git diffs against security and architectural rules.**

# **Pull Request Pre-Flight Audit**

1. **Diff Extraction:**  
   // capture: STAGED\_DIFF  
   // turbo  
2. Run git diff \--cached  
3. **Context Alignment:** Read the global rules located at .agents/rules/security.md and the core AGENTS.md file.  
4. **Adversarial Analysis:** Analyze the contents of {{STAGED\_DIFF}}. You must adopt the persona of a highly critical, adversarial Senior Security Engineer. Systematically identify O(n) algorithmic inefficiencies, SOLID principle violations, and potential OWASP security flaws.  
5. **Report Generation:** Create a structured markdown audit report. For every issue identified, you must provide:  
   * The exact File Path and Line Number.  
   * The Severity Level (CRITICAL, HIGH, LOW).  
   * A concise explanation of the architectural or security flaw.  
   * An explicit, optimized code replacement block.  
6. Save the comprehensive report to .antigravity/brain/artifacts/pr\_audit\_report.md.  
7. **State Verification:** If the Severity Level of any finding contains the string "CRITICAL", update state.md to PR\_REJECTED. Otherwise, update the state to PR\_READY.

**Execution Analysis:** This workflow demonstrates the power of the // capture directive.18 Instead of relying on the LLM to hallucinate the current state of the codebase, it forcefully injects the deterministic output of the git diff terminal command directly into the workflow's context window. By explicitly prompting the agent to adopt an "adversarial" persona, the workflow actively fights the LLM's natural inclination toward sycophancy, resulting in vastly more rigorous code reviews.25

### **Template 3: The TDD Cycle & Visual Regression (/tdd-verify)**

This workflow highlights the advanced conditional branching (// if) and parallel execution (// parallel) mechanics introduced in AgentKit 2.0, ensuring that AI-written code is proven correct through rigorous testing loops.

## ---

**description: Executes a rigorous Test-Driven Development cycle and visual regression verification.**

# **TDD & Verification Cycle**

**Target Module:** $1

1. **Test Generation:** Read the source code for the module specified in $1. Generate comprehensive unit tests covering both positive execution paths and edge cases, strictly utilizing the workspace's designated testing framework.  
2. **Test Execution:**  
   // capture: TEST\_RESULTS  
   // turbo  
3. Run the newly generated test suite via the terminal.  
   // if  
4. **Self-Healing Loop:** Analyze the stack traces and failure logs present in {{TEST\_RESULTS}}. Modify the source code of $1 to rectify the implementation logic. Loop back and repeat Step 2 until all tests pass.  
   // parallel  
5. **Visual Verification:** Dispatch the Antigravity Browser Subagent to navigate to the local development server hosting the component $1.  
6. **Static Analysis:** Run standard linting and formatting across the modified files.  
7. **Artifact Finalization:** Capture a screenshot of the rendered UI state. Save the visual evidence alongside the finalized passing test logs into a new file named walkthrough\_$1.md.

**Execution Analysis:** This represents a true autonomous loop. The // if \[condition\] directive enables the agent to evaluate the outcome of the terminal command stored in TEST\_RESULTS and make autonomous routing decisions.18 If the tests fail, the agent enters a self-healing loop. Once the code passes, the // parallel directive allows the agent to simultaneously launch a browser for visual verification and run terminal linting commands, significantly compressing the feedback cycle.18

### **Template 4: The Legacy Code Refactor (/refactor-module)**

Refactoring legacy systems poses immense risks regarding technical debt and regression. This workflow relies heavily on the Blackboard pattern to ensure safe, methodical migration.

## ---

**description: Systematically refactors a legacy module into modern architecture using strict state verification.**

# **Safe Legacy Refactoring Protocol**

**Target Directory:** $1

1. **State Verification Latch:** Read the project state.md.  
   // if  
2. Halt execution immediately. Output the following error to the chat: "\> Unauthorized Access. Finite State Machine is not in USER\_APPROVAL\_PENDING status."  
3. **Dependency Mapping:** Analyze all files within the directory $1. Generate a comprehensive dependency graph utilizing Mermaid JS syntax to visualize coupling.  
4. **Incremental Conversion:** Refactor the files in $1 sequentially to match the modern architectural standards defined in AGENTS.md. Do NOT perform mass edits; modify one file at a time.  
   // capture: TYPE\_CHECK  
   // turbo  
5. Run the project's static type-checker (e.g., tsc \--noEmit).  
   // if  
6. Iterate strictly on the refactored files to resolve all identified type errors before proceeding.  
7. **State Advancement:** Update state.md to reflect REFACTOR\_COMPLETE. Document all breaking changes, deprecated functions, and API shifts in the repository's CHANGELOG.md.

**Execution Analysis:** This workflow implements a hard security boundary. By evaluating the Current Stage against the FSM stored in state.md, it ensures that the agent cannot begin tearing apart legacy architecture unless a human architect has explicitly updated the state vector to permit it.9 The mandate to use Mermaid JS forces the agent to map the conceptual architecture before modifying the structural code, reducing the likelihood of circular dependencies.7

### **Template 5: The "God Mode" Super-Workflow (/god-mode)**

The 12,000-character limit necessitates composition. This template demonstrates workflow chaining, orchestrating a massive end-to-end pipeline by invoking smaller, specialized sub-workflows.

## ---

**description: End-to-end orchestration pipeline triggering scaffold, test, and documentation sub-workflows.**

# **Ultimate Orchestrator (God Mode)**

**Feature Request:** $1

1. **Initialize Blackboard FSM:**  
   // run workflow: advance-state "INIT"  
2. **Phase 1: Architecture & Scaffolding:**  
   // run workflow: scaffold "$1"  
3. **Pause for Human Authorization:** Halt execution. Wait for explicit user confirmation on the generated .antigravity/brain/artifacts/implementation\_plan\_$1.md.  
4. **Phase 2: Implementation Execution:** Act as the Lead Full-Stack Engineer. Implement the codebase strictly according to the tasks outlined in task\_$1.md.  
5. **Phase 3: Automated Verification:**  
   // run workflow: tdd-verify "$1"  
6. **Phase 4: Global Documentation:**  
   // run workflow: generate-docs  
7. **Finalize FSM State:**  
   // run workflow: advance-state "COMPLETE"  
8. **Memory Compaction:** Execute the /compact command to clear context window bloat and summarize the session, ensuring state.md remains the primary persistent knowledge base.

**Execution Analysis:** This is the pinnacle of agentic orchestration.10 By utilizing the // run workflow: \[name\] directive, the master orchestrator bypasses character limitations entirely, acting purely as a routing mechanism that dispatches sub-agents to handle highly specific tasks.10 The inclusion of the /compact command at the end is a critical context management technique, ensuring that long-running sessions do not crash the IDE due to token exhaustion.15

### **Template 6: The MCP Database Architect (/db-migrate)**

As Antigravity evolves, external systems integration via the Model Context Protocol (MCP) becomes essential.8 This workflow standardizes database schema generation and migration logic.

## ---

**description: Orchestrates database schema design and executes migrations via MCP server tools.**

# **Database Architecture and Migration Protocol**

**Target Entity:** $1

1. **Schema Design:** Act as a Principal Database Architect. Design a normalized database schema for the entity "$1". Define all primary keys, foreign key constraints, and indexing strategies.  
2. **Review Policy Check:** Present the proposed schema to the user. Halt execution until the user replies with "Schema Approved".  
3. **Migration Generation:** Generate the SQL migration scripts required to implement the approved schema. Save these scripts to the /migrations/ directory following the project's timestamp naming convention.  
4. **MCP Execution:** Connect to the configured PostgreSQL MCP server.  
   // turbo  
5. Execute the generated migration scripts against the local development database using the appropriate MCP tool commands.  
6. **Verification:** Query the information\_schema via the MCP server to verify that the tables, columns, and constraints were created successfully.  
7. **Artifact Generation:** Append the updated schema topology to .antigravity/brain/artifacts/database\_schema.md.

**Execution Analysis:** Rather than relying on the LLM to write code that the user must manually copy and paste into a database client, this workflow dictates that the agent must autonomously leverage an attached MCP server.8 The workflow explicitly requires a human "Review Policy Check" before execution, aligning with the "Ask First" permission boundary principles critical for destructive or highly consequential operations.16

### **Template 7: The Blackboard State Advancer (/advance-state)**

A utility workflow designed strictly to maintain the integrity of the Finite State Machine, preventing hallucinated state changes across complex multi-agent interactions.

## ---

**description: Safely and deterministically advances the global state machine within state.md.**

# **State Advancement Protocol**

**Requested State:** $1

1. **Read Current State:** Read the contents of state.md located at the project root.  
2. **Validate Transition:** Ensure that transitioning the state to $1 is a valid FSM move based on the current active state. If the move is invalid, halt and alert the user.  
3. **Log Execution:** Append an entry to the Execution Log section of state.md. This entry must detail the current timestamp, the previous state, and the newly requested state ($1).  
4. **Write State Vector:** Update the Current Stage variable in state.md to precisely $1.  
5. **Output Confirmation:** Display a success message in the chat interface: "State vector successfully transitioned to $1. Awaiting next command sequence."

**Execution Analysis:** While seemingly simple, this sub-workflow is the linchpin of the Blackboard Pattern.9 By centralizing state modifications into a single, specialized workflow, the system architect prevents sprawling operational workflows from improperly modifying the FSM. It acts as a controlled setter function for the project's global state vector, ensuring an auditable, linear record of agentic progress.9

## **Anti-Patterns in Antigravity Workflow Design**

Even equipped with highly optimized templates, architectural missteps can severely degrade the efficacy of the Gemini 3.1 Pro agents. System architects must remain vigilant and actively engineer their environments to avoid the following pervasive anti-patterns.

The most common failure mode is the **Monolithic Workflow**, which leads directly to context bloat. Attempting to combine scaffolding, test generation, database migrations, and deployment logic into a single, massive workflow file inevitably breaches the 12,000-character constraint.10 More dangerously, even if it fits within the limit, it overloads the model's immediate working memory. Workflows must be aggressively decoupled, utilizing the // run workflow: \[name\] chaining syntax to modularize complex operations.10

Another critical error is **Vague Persona Delegation**. Initiating workflows with generic instructional language (e.g., "Help me write this code" or "Fix the bug") strips the reasoning engine of vital context. Elite workflows must explicitly invoke specialized personas defined within the global AGENTS.md file (e.g., "Act as the Lead Infrastructure DevOps Engineer").31 This anchors the model's output to specific architectural methodologies and dramatically increases accuracy.

**Blackboard Abandonment**, or state drift, occurs when architects allow agents to execute long-running asynchronous tasks without mandating updates to a central state.md file.9 Without a definitive, externalized state vector, stochastic agents rapidly lose track of their progress across multi-agent orchestrations, frequently resulting in repetitive execution loops, hallucinated completion statuses, or skipped procedural steps.9

Finally, the **Implicit Tooling Trust** anti-pattern represents a severe operational security risk.22 If a workflow does not strictly define "Never" boundaries, an autonomous agent granted // turbo-all permissions might independently execute highly destructive operations.17 In a misguided attempt to resolve a failing test suite during a self-healing loop, an unconstrained agent could perform a git reset \--hard, drop local database tables, or overwrite critical configuration files.22 Explicit permission boundaries are not optional; they are mandatory for production safety.

## **Starter Workflow Library Structure & Future-Proofing**

To ensure enterprise-grade scalability, ease of onboarding, and readiness for impending model upgrades, the Antigravity workspace must be rigorously organized. A production-ready repository should reflect the following architectural structure, segregating state, rules, and execution logic into distinct, manageable namespaces.

/ ├── state.md \# The Blackboard FSM state vector 9 ├── AGENTS.md \# Global personas, tier-permissions, and boundaries 12 ├──.antigravity/ │ └── brain/ │ ├── artifacts/ \# Persistent outputs (task.md, implementation\_plan.md) 5 │ └── memory/ \# Long-term knowledge base maintained across sessions 30 ├──.agents/ \# The primary Antigravity configuration directory 13 │ ├── rules/ \# Passive constraints (e.g., security.md, typescript.md) 8 │ ├── skills/ \# Agent-invoked subroutines (e.g., /database-architect/SKILL.md) 14 │ └── workflows/ \# User-invoked macros and orchestration controllers 10 │ ├── scaffold.md │ ├── pr-review.md │ ├── tdd-verify.md │ ├── refactor-module.md │ ├── db-migrate.md │ ├── visual-regression.md │ └── advance-state.md

### **Future-Proofing for Gemini 3.5 and the MCP Ecosystem**

As Google continues to advance the Antigravity platform and the broader Vertex AI Model Garden, the integration of Model Context Protocol (MCP) servers will rapidly become the primary mechanism for extending agent capabilities.8 The era of agents hallucinating terminal commands to interact with external APIs is ending.

Elite workflows must be designed to interface seamlessly with the MCP ecosystem. Rather than hardcoding fragile API curl requests or database connection strings within workflow files, workflows should be written to instruct agents to utilize MCP tools dynamically. For example, a workflow should instruct the agent to leverage an n8n-mcp or github-mcp server configured within the project's mcp\_servers.json file.35 This abstraction decouples the workflow's logic from the underlying infrastructure, rendering the workflows highly portable across different environments.

Furthermore, as the underlying hardware improves and context windows expand significantly beyond the 1-million-token threshold, the temptation to abandon structured workflows in favor of massive, monolithic "mega-prompts" will undoubtedly rise. This temptation must be resisted. The physical limitation of LLM context windows is increasingly being replaced by the cognitive limitation of "attention scatter," where the model simply loses focus on the core objective amidst a sea of context.15 Strict Spec-Driven Development, enforced through deterministic, modular .md workflows, ensures that regardless of the underlying model's raw processing power, the engineering output remains architecturally sound, auditable, and perfectly aligned with enterprise objectives.

#### **Works cited**

1. How to Set Up and Use Google Antigravity \- Codecademy, accessed April 5, 2026, [https://www.codecademy.com/article/how-to-set-up-and-use-google-antigravity](https://www.codecademy.com/article/how-to-set-up-and-use-google-antigravity)  
2. Google Antigravity Documentation, accessed April 5, 2026, [https://antigravity.google/docs/home](https://antigravity.google/docs/home)  
3. Parallel agents in Antigravity, accessed April 5, 2026, [https://medium.com/google-cloud/parallel-agents-in-antigravity-64237120161d](https://medium.com/google-cloud/parallel-agents-in-antigravity-64237120161d)  
4. Introducing Google Antigravity, a New Era in AI-Assisted Software Development, accessed April 5, 2026, [https://antigravity.google/blog/introducing-google-antigravity](https://antigravity.google/blog/introducing-google-antigravity)  
5. Getting Started with Google Antigravity, accessed April 5, 2026, [https://codelabs.developers.google.com/getting-started-google-antigravity](https://codelabs.developers.google.com/getting-started-google-antigravity)  
6. Tutorial : Getting Started with Google Antigravity | by Romin Irani \- Medium, accessed April 5, 2026, [https://medium.com/google-cloud/tutorial-getting-started-with-google-antigravity-b5cc74c103c2](https://medium.com/google-cloud/tutorial-getting-started-with-google-antigravity-b5cc74c103c2)  
7. Models \- Google Antigravity Documentation, accessed April 5, 2026, [https://antigravity.google/docs/models](https://antigravity.google/docs/models)  
8. Tutorial : Getting Started with Google Antigravity Skills, accessed April 5, 2026, [https://medium.com/google-cloud/tutorial-getting-started-with-antigravity-skills-864041811e0d](https://medium.com/google-cloud/tutorial-getting-started-with-antigravity-skills-864041811e0d)  
9. Google Antigravity IDE Skills & Workflows: Building an Enterprise-grade AI Squad with Finite State Machine Architecture | by Eren Karatas | Medium, accessed April 5, 2026, [https://medium.com/@eren.karatas/google-antigravity-ide-skills-workflows-building-an-enterprise-grade-ai-squad-with-finite-state-184ade6f7fa7](https://medium.com/@eren.karatas/google-antigravity-ide-skills-workflows-building-an-enterprise-grade-ai-squad-with-finite-state-184ade6f7fa7)  
10. Rules / Workflows \- Google Antigravity Documentation, accessed April 5, 2026, [https://antigravity.google/docs/rules-workflows](https://antigravity.google/docs/rules-workflows)  
11. Customize Google Antigravity with rules and workflows \- Mete Atamel, accessed April 5, 2026, [https://atamel.dev/posts/2025/11-25\_customize\_antigravity\_rules\_workflows/](https://atamel.dev/posts/2025/11-25_customize_antigravity_rules_workflows/)  
12. Guide with AGENTS.md & Examples (2026) \- Antigravity Rules, accessed April 5, 2026, [https://antigravity.codes/blog/user-rules](https://antigravity.codes/blog/user-rules)  
13. Why is there an inconsistency between the .agent and .agents folders? : r/google\_antigravity, accessed April 5, 2026, [https://www.reddit.com/r/google\_antigravity/comments/1rf4599/why\_is\_there\_an\_inconsistency\_between\_the\_agent/](https://www.reddit.com/r/google_antigravity/comments/1rf4599/why_is_there_an_inconsistency_between_the_agent/)  
14. Agent Skills \- Google Antigravity Documentation, accessed April 5, 2026, [https://antigravity.google/docs/skills](https://antigravity.google/docs/skills)  
15. The Neuron's Prompt Tip of the Day Digest \- February 2026, accessed April 5, 2026, [https://www.theneuron.ai/ai-news-digests/the-neurons-prompt-tip-of-the-day-digest---february-2026/](https://www.theneuron.ai/ai-news-digests/the-neurons-prompt-tip-of-the-day-digest---february-2026/)  
16. How to Build Your AGENTS.md (2026): The Context File That Makes AI Coding Agents Actually Work | Augment Code, accessed April 5, 2026, [https://www.augmentcode.com/guides/how-to-build-agents-md](https://www.augmentcode.com/guides/how-to-build-agents-md)  
17. Google Antigravity Prompts \- GitHub Gist, accessed April 5, 2026, [https://gist.github.com/Phantomn/ac35e2eb15be2eb63bc58f5eeee9c99a](https://gist.github.com/Phantomn/ac35e2eb15be2eb63bc58f5eeee9c99a)  
18. Antigravity Workflows: Create Automation Recipes with Examples (2026), accessed April 5, 2026, [https://antigravity.codes/blog/workflows](https://antigravity.codes/blog/workflows)  
19. Claude Code Skill \- command-development \- FastMCP, accessed April 5, 2026, [https://fastmcp.me/skills/details/338/command-development](https://fastmcp.me/skills/details/338/command-development)  
20. Build Better AI Agents with Google Antigravity Skills and Workflows \- KDnuggets, accessed April 5, 2026, [https://www.kdnuggets.com/build-better-ai-agents-with-google-antigravity-skills-and-workflows](https://www.kdnuggets.com/build-better-ai-agents-with-google-antigravity-skills-and-workflows)  
21. Can we talk Antigravity tips, tricks & workflows? : r/google\_antigravity \- Reddit, accessed April 5, 2026, [https://www.reddit.com/r/google\_antigravity/comments/1pzq883/can\_we\_talk\_antigravity\_tips\_tricks\_workflows/](https://www.reddit.com/r/google_antigravity/comments/1pzq883/can_we_talk_antigravity_tips_tricks_workflows/)  
22. Agents.md best practices \- GitHub Gist, accessed April 5, 2026, [https://gist.github.com/0xfauzi/7c8f65572930a21efa62623557d83f6e](https://gist.github.com/0xfauzi/7c8f65572930a21efa62623557d83f6e)  
23. Specs Driven Development with Antigravity IDE and AGENTS.md/Antigravity.md \- YouTube, accessed April 5, 2026, [https://www.youtube.com/watch?v=g-jYIbf6nbo](https://www.youtube.com/watch?v=g-jYIbf6nbo)  
24. How Google Antigravity is changing spec-driven development \- Medium, accessed April 5, 2026, [https://medium.com/google-cloud/benefits-and-challenges-of-spec-driven-development-and-how-antigravity-is-changing-the-game-3343a6942330](https://medium.com/google-cloud/benefits-and-challenges-of-spec-driven-development-and-how-antigravity-is-changing-the-game-3343a6942330)  
25. Share your best Google Antigravity Skills, Rules & Workflows. : r/google\_antigravity \- Reddit, accessed April 5, 2026, [https://www.reddit.com/r/google\_antigravity/comments/1r3hlis/share\_your\_best\_google\_antigravity\_skills\_rules/](https://www.reddit.com/r/google_antigravity/comments/1r3hlis/share_your_best_google_antigravity_skills_rules/)  
26. Artifacts \- Google Antigravity Documentation, accessed April 5, 2026, [https://antigravity.google/docs/artifacts](https://antigravity.google/docs/artifacts)  
27. antigravity-workspace-template/docs/en/PHILOSOPHY.md at main \- GitHub, accessed April 5, 2026, [https://github.com/study8677/antigravity-workspace-template/blob/main/docs/en/PHILOSOPHY.md](https://github.com/study8677/antigravity-workspace-template/blob/main/docs/en/PHILOSOPHY.md)  
28. hamodywe/antigravity-mastery-handbook: A comprehensive guide to Google Antigravity, the agentic AI development platform from Google. Covers concepts, features, comparisons, and real-world use cases \- GitHub, accessed April 5, 2026, [https://github.com/hamodywe/antigravity-mastery-handbook](https://github.com/hamodywe/antigravity-mastery-handbook)  
29. Google Antigravity System Prompt Analysis | PDF | Command Line Interface \- Scribd, accessed April 5, 2026, [https://www.scribd.com/document/986523905/Leaked-Antigravity-System-Prompt-Report](https://www.scribd.com/document/986523905/Leaked-Antigravity-System-Prompt-Report)  
30. can1357/oh-my-pi: AI Coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more \- GitHub, accessed April 5, 2026, [https://github.com/can1357/oh-my-pi](https://github.com/can1357/oh-my-pi)  
31. How to write a great agents.md: Lessons from over 2,500 repositories \- The GitHub Blog, accessed April 5, 2026, [https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/)  
32. I tried Google's new Antigravity IDE so you don't have to (vs Cursor/Windsurf) \- Reddit, accessed April 5, 2026, [https://www.reddit.com/r/ChatGPTCoding/comments/1p35bdl/i\_tried\_googles\_new\_antigravity\_ide\_so\_you\_dont/](https://www.reddit.com/r/ChatGPTCoding/comments/1p35bdl/i_tried_googles_new_antigravity_ide_so_you_dont/)  
33. antigravity-awesome-skills/CATALOG.md at main \- GitHub, accessed April 5, 2026, [https://github.com/sickn33/antigravity-awesome-skills/blob/main/CATALOG.md](https://github.com/sickn33/antigravity-awesome-skills/blob/main/CATALOG.md)  
34. Build Autonomous Developer Pipelines using agents.md and skills.md in Antigravity, accessed April 5, 2026, [https://codelabs.developers.google.com/autonomous-ai-developer-pipelines-antigravity](https://codelabs.developers.google.com/autonomous-ai-developer-pipelines-antigravity)  
35. n8n-mcp/docs/ANTIGRAVITY\_SETUP.md at main \- GitHub, accessed April 5, 2026, [https://github.com/czlonkowski/n8n-mcp/blob/main/docs/ANTIGRAVITY\_SETUP.md](https://github.com/czlonkowski/n8n-mcp/blob/main/docs/ANTIGRAVITY_SETUP.md)  
36. study8677/antigravity-workspace-template: The ultimate starter kit for AI IDEs, Claude code，codex, and other agentic coding environments. \- GitHub, accessed April 5, 2026, [https://github.com/study8677/antigravity-workspace-template](https://github.com/study8677/antigravity-workspace-template)