# Agent Economics and Specialization

Multi-agent systems (MAS) address the inherent limitations of single-agent contexts through distribution and specialization.

## The Motivation: Context Bottlenecks

As tasks grow complex, a single agent's context window accumulates history, documents, and tool outputs. This leads to:
1. **Lost-in-Middle**: Performance degradation for info in the middle of long contexts.
2. **Attention Scarcity**: Reduced reasoning accuracy across vast token counts.
3. **Context Poisoning**: Irrelevant tool outputs or history "distracting" the model.

## Token Economics Reality

Multi-agent architectures significantly increase token consumption in exchange for higher reliability.

| Tier | Token Multiplier | Typical Use Case |
|------|------------------|------------------|
| **Single Agent** | 1x | Basic chat, simple Q&A. |
| **Tool-using Agent** | ~4x | Searching, basic API interaction. |
| **Multi-Agent System** | ~15x+ | Deep research, multi-domain coordination. |

*Critical Insight*: Upgrading to a smarter model (e.g., Sonnet 4.5) often yields better results than simply increasing token budgets for weaker models.

## The Specialization Argument

Different subtasks require different configurations:
- **Unique System Prompts**: Specialized instructions for research vs. coding.
- **Dedicated Tool Sets**: Minimal tool list to prevent "tool selection entropy."
- **Clean Contexts**: Sub-agents start with fresh, lean context windows optimized for their specific atomic task.
