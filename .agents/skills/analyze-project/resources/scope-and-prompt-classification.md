# Scope and Prompt Classification

This resource categorize why a session's complexity changed during execution.

## Prompt Sufficiency Scoring (0-2)

Evaluate the initial user request based on these criteria:
- **Boundedness**: Does it have a clear end state?
- **Testability**: Can success be verified automatically/manually?
- **Dependency Awareness**: Did it mention critical existing files?
- **Constraint Specificity**: Were non-goals or rigid rules included?

*Sufficiency Bands*:
- **High (10-12)**: Clear, bounded, and technical.
- **Medium (6-9)**: Functional but lacks implementation detail.
- **Low (0-5)**: Ambiguous or "blind" requests.

## Scope Change Taxonomy

| Type | Description | Attribution |
|------|-------------|-------------|
| **Human-Added** | User requested new features during the session. | User |
| **Necessary Discovered** | Hidden complexity (e.g., dependencies) required fixed to succeed. | Technical Debt |
| **Agent-Introduced** | Agent performed unrequested cleanup or redesign. | Agent |

*Critical Analysis*: Friction due to **Necessary Discovered Scope** is a sign of repo fragility, while **Human-Added Scope** is a sign of spec ambiguity or evolving needs.
