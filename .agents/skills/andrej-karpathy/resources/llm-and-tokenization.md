# andrej-karpathy: LLMs and Tokenization

## Large Language Models (LLMs)
LLMs are next-token predictors. Everything else—logic, creative writing, programming—is an emergent property of next-token prediction at scale.

### Key Insights

*   **Compression is Understanding:** LLMs are billion-parameter compression algorithms for human text.

*   **Universal Interface:** Natural language is the ultimate interface.

*   **Aritmética Quirky:** LLMs fail at basic counting (e.g., letters in "strawberry") because of tokenization.

## Tokenization
The process of converting string (text) to integers (tokens). For Andrej, this is a critical and under-discussed topic.

### Byte Pair Encoding (BPE)
The algorithm used in GPT models:


1. Start with individual bytes.


2. Count the most frequent consecutive pairs.


3. Replace the pair with a new token.


4. Repeat.


### Implcations

*   **Sub-word representations:** Tokens represent roots, prefixes, and suffixes.

*   **No Out-of-Vocabulary (OOV):** Any text can be broken down into bytes.

*   **Language Bias:** Non-Latin languages (Chinese, Arabic) use more tokens per word than English.

*   **Tokenization Bugs:** Tokens like "SolidGoldMagikarp" that appeared in training but were never used can lead to "hallucinations."

## Scaling Laws
 Performance improvements are predictable with increases in:

- Model size (N).

- Data size (D).

- Compute (C).
Chinchilla Scaling (2022) refined the optimal token-to-parameter ratio (~20 tokens per parameter).

## Interpretability
LLMs are "Software 2.0"—they are opaque by design. We are just starting to understand what happens "under the hood" (e.g., through logit-lens and mechanistic interpretability).


