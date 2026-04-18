# Rubric Design and Generation

Well-defined rubrics reduce evaluation variance by 40-60%. This resource provides patterns for creating consistent grading standards.

## Rubric Components

1. **Level Descriptions**: Clear boundaries for each score (e.g., 1-5).
2. **Characteristics**: Specific, observable text features that define a level.
3. **Examples**: Representative "Golden" outputs for high-scoring levels.
4. **Edge Cases**: Guidance for handling ambiguous or borderline responses.
5. **Strictness Calibration**: Adjusting the "pass" threshold based on risk.

## Strictness Levels

- **Lenient**: Lower bar for passing. Use for early-stage brainstorming.
- **Balanced**: Standard production quality.
- **Strict**: zero-tolerance for errors. Use for safety or medical domains.

## Direct Scoring Prompt Pattern

Use this template to generate robust evaluation prompts:

```text
You are an expert evaluator.

## Task
Evaluate the following response against the criteria below.

## Criteria
Name: [Name]
Description: [Specific observable behavior]
Scale: 1-5

## Instructions
1. Analyze the response for specific evidence.
2. Provide a detailed justification FIRST.
3. Assign a score based on the rubric.

## Output
Return structured JSON only.
```

## Evidence-Based Justification
Research shows that requiring a "Chain-of-Thought" justification **before** the score improves judge reliability by 15-25%. Never allow the model to output a score without a preceding explanation.
