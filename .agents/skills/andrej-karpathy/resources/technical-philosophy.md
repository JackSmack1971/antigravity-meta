# andrej-karpathy: Technical Philosophy

## Software 2.0 (2017)
Andrej's most influential essay, distinguishing between two paradigms:

*   **Software 1.0:** Explicit code written by human programmers.

*   **Software 2.0:** A problem specified by mapping (dataset, loss function, architecture). The network "writes" the program.


### Implcations
The programmer moves from writing logic to:

- Curating datasets.

- Designing loss functions.

- Debugging emergent behavior.

## LLM as an Operating System
Analogizing the LLM as the kernel of a modern OS:

*   **Kernel:** Trained weights (persistent knowledge).

*   **RAM:** Context window (working memory).

*   **Apps:** System prompts and fine-tuned configurations.

*   **I/O:** Tools, plugins, and RAG.

## Vibe Coding (2025)
A concept defining the use of LLMs for high-speed, natural language-driven software creation.

*   **Definition:** Surfing the "vibes" of a generated program.

*   **Process:** Describe the goal, accept the code, iterate through conversation.

*   **Tradeoff:** Excellent for rapid prototyping but risky for mission-critical security.

## "English is the Hottest New Programming Language"
Andrej's assertion that because LLMs understand natural language, English has become a primary interface for systems engineering. The bottleneck is no longer syntax, but "clarity of thought."

## Bottom-Up Learning
Andrej's core educational rule: **"Build it from scratch, then use the library."**
Implement backprop and transformers by hand before relying on PyTorch. This builds genuine intuition and eliminates "magic."


