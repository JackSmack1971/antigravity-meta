# Bias Mitigation in LLM-as-Judge

LLM judges exhibit systematic biases that must be actively mitigated to ensure reliable evaluation results.

## The Bias Landscape

| Bias Type | Description | Mitigation Strategy |
|-----------|-------------|---------------------|
| **Position Bias** | Preferential treatment for the first response in pairwise comparison. | **Position Swap**: Evaluate twice with swapped roles; majority vote for winner. |
| **Length Bias** | Higher ratings for longer responses regardless of quality. | **Length-Agnostic Prompting**: Explicitly instruct judge to ignore word count. |
| **Self-Enhancement** | Models rate their own outputs higher than other models. | **External Judges**: Use a different (often larger) model for evaluation. |
| **Verbosity Bias** | Detailed explanations rated higher even when irrelevant. | **Penalty Rubrics**: Explicitly penalize irrelevant detail in the grading rubric. |
| **Authority Bias** | Confident tone preferred over actual accuracy. | **Evidence Requirement**: Require the judge to cite specific facts/quotes. |

## Position Mitigation Protocol (Pairwise)

To eliminate position bias in pairwise evaluation, follow these steps:

1. **Pass 1**: Present Response A as "Response 1" and Response B as "Response 2".
2. **Pass 2**: Present Response B as "Response 1" and Response A as "Response 2".
3. **Consistency Check**:
   - If both passes agree on the winner (considering the swap), the result is **consistent**.
   - If the winner changes (e.g., both times the judge chose "Response 1"), a **position bias** was detected.
4. **Final Verdict**:
   - Consistent: Return common winner with averaged confidence.
   - Inconsistent: Return a **TIE** or use a tie-breaking larger model.

## Confidence Calibration

Confidence scores should be adjusted based on consistency:
- **Full Consistency**: Confidence = `(Conf_Pass1 + Conf_Pass2) / 2`.
- **Inconsistency**: Confidence = `0.0`.
- **Ambiguous Tie**: If the judge selected "Tie" in both passes, return Tie with high confidence.
