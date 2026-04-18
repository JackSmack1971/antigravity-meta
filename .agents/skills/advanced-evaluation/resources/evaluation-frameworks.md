# Evaluation Frameworks and Decision-Making

Choosing the right evaluation method is critical for system reliability. This resource provides a taxonomy and decision tree for LLM-as-Judge implementations.

## Evaluation Taxonomy

### 1. Direct Scoring
A single LLM rates a response on a defined scale (e.g., 1-5).
- **Best for**: Objective criteria (factual accuracy, format compliance).
- **Reliability**: High for well-defined tasks; lower for subjective preference.
- **Metric**: Spearman's Correlation (ρ).

### 2. Pairwise Comparison
An LLM compares two responses and selects a winner.
- **Best for**: Subjective preferences (tone, style, persuasiveness).
- **Reliability**: Superior for quality judgments (MT-Bench, 2023).
- **Metric**: Agreement rate, Position consistency.

## Decision Tree

```text
Is there an objective ground truth?
├── Yes → Use Direct Scoring
│   └── (Accuracy, Syntax, toxicity)
│
└── No → Is it a preference vs quality judgment?
    ├── Yes → Use Pairwise Comparison
    │   └── (Better tone, more helpful, better formatting)
    │
    └── No → Reference-based
        └── (Summarization vs source text)
```

## Scaling Strategies

1. **PoLL (Panel of LLMs)**: Use multiple models as judges and aggregate (majority vote) to reduce individual model bias.
2. **Hierarchical Eval**: Use cheap models (e.g., GPT-4o-mini) for initial screening, and expensive models (e.g., Claude 3.5 Sonnet) for edge cases.
3. **Human-in-the-loop**: Use automated evaluation for high-confidence outputs and flag low-confidence results for human review.
