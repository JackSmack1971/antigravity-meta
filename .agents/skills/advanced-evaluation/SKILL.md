---
name: advanced-evaluation
description: This skill should be used when the user asks to "implement LLM-as-judge", "compare model outputs", "create evaluation rubrics", "mitigate evaluation bias", or mentions direct scoring, pairwise comparison, position bias, evaluation pipelines, or automated quality assessment.
risk: safe
source: community
date_added: 2026-03-18
---

# Advanced Evaluation

## Overview

Implement production-grade LLM-as-judge patterns to evaluate model outputs. This skill provides a taxonomy for choosing the right evaluation method and protocols for mitigating systematic biases.

## 📚 Resources

| Resource | Description |
|----------|-------------|
| [Evaluation Frameworks](file:///c:/workspaces/antigravity-meta/.agents/skills/advanced-evaluation/resources/evaluation-frameworks.md) | Choosing between Direct Scoring and Pairwise Comparison. |
| [Bias Mitigation](file:///c:/workspaces/antigravity-meta/.agents/skills/advanced-evaluation/resources/bias-mitigation.md) | Protocols for Position, Length, and Verbosity bias. |
| [Rubric Design](file:///c:/workspaces/antigravity-meta/.agents/skills/advanced-evaluation/resources/rubric-design.md) | Patterns for creating consistent grading standards. |
| [Case Studies](file:///c:/workspaces/antigravity-meta/.agents/skills/advanced-evaluation/resources/case-studies.md) | Implementation examples for Accuracy, Tone, and Readability. |

## Core Decision Framework

### Direct Scoring
Best for **objective** criteria (accuracy, format). Rates on a scale (1-5/1-10).
> See [Evaluation Frameworks](file:///c:/workspaces/antigravity-meta/.agents/skills/advanced-evaluation/resources/evaluation-frameworks.md) for details.

### Pairwise Comparison
Best for **subjective** preference (style, tone, helpfulness). Compares two outputs directly.
> Required: Always use [Bias Mitigation](file:///c:/workspaces/antigravity-meta/.agents/skills/advanced-evaluation/resources/bias-mitigation.md) (Position Swap).

## Best Practices
1. **Justification First**: Always require the judge to provide evidence *before* the score.
2. **Swap Positions**: When using pairwise comparison, run the evaluation twice with roles swapped.
3. **Calibrate Confidence**: Adjust confidence values based on judge consistency and evidence quality.

## Related Skills
- `context-fundamentals`: Prompt structure for evaluation.
- `tool-design`: Building evaluation infrastructure.

## Summary
Build reliable evaluation systems by selecting the correct taxonomy and aggressively mitigating LLM biases.
