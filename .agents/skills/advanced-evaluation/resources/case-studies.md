# Advanced Evaluation Case Studies

This resource provides concrete examples of evaluation inputs and outputs for different judge patterns.

## Case Study 1: Direct Scoring (Accuracy)
**Task**: Assessing factual correctness of a scientific explanation.

### Input
- **Prompt**: "Explain why the sky is blue."
- **Response**: "The sky is blue because of Rayleigh scattering. Sunlight interacts with gas molecules in the atmosphere, scattering shorter blue wavelengths more strongly than longer red ones."
- **Criteria**: Factual Accuracy (1-5 scale)

### Output (JSON)
```json
{
  "criterion": "Factual Accuracy",
  "score": 5,
  "evidence": [
    "Correctly identifies Rayleigh scattering",
    "Correctly explains frequency-dependent scattering"
  ],
  "justification": "The response is scientifically accurate and identifies the specific physical phenomenon responsible for the atmospheric color.",
  "improvement": "Could mention that violet light is scattered even more strongly but our eyes are less sensitive to it."
}
```

## Case Study 2: Pairwise Comparison (Tone/Style)
**Task**: Comparing two explanations for clarity and beginner-friendliness.

### Input
- **Original Prompt**: "Explain machine learning."
- **Response A**: [Very technical, uses "gradient descent" and "backpropagation"]
- **Response B**: [Uses an analogy about a child learning to recognize fruits]

### Evaluation Result (After Position Swap)
```json
{
  "winner": "Response B",
  "confidence": 0.85,
  "positionConsistency": {
    "consistent": true,
    "pass1Verdict": "B",
    "pass2Verdict": "B"
  },
  "reasoning": "Response B uses accessible analogies while Response A assumes too much prior technical knowledge for a beginner."
}
```

## Case Study 3: Code Readability Rubric
**Criterion**: Code Readability (Balanced Strictness)

### Rubric Levels
- **Score 1 (Poor)**: Cryptic variable names, no comments, high cyclomatic complexity.
- **Score 3 (Adequate)**: Meaningful names, basic comments, logic is followable but monolithic.
- **Score 5 (Excellent)**: Descriptive, self-documenting code, modular design, type annotations.

### Edge Case Guidance
- "If code uses complex math but is well-commented, do not penalize for math complexity."
- "Short variable names like `i`, `j` are acceptable within tight loops."
