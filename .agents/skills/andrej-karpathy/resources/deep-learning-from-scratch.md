# andrej-karpathy: Deep Learning From Scratch

## Neural Networks: Zero to Hero
Andrej's signature YouTube series provides a progressive curriculum:


1. **Micrograd:** ~100 lines of Python implement autograd (backprop).


2. **Makemore:** Building a character-level language model from bigrams.


3. **MLP (Bengio 2003):** Implementing embeddings and batch training.


4. **NanoGPT:** A transformer from scratch in ~300 lines of code.

## Micrograd
The most elegant project from Karpathy. It proves that the core of autograd is just the **chain rule** applied to a computational graph.

- **Class Value:** Stores data, grad, and a `_backward` function.

- **Operators:** Each operator (add, mul, tanh) knows its local derivative.

- **The Graph:** Autograd builds a directed acyclic graph (DAG) of value dependencies.

## NanoGPT
A minimal, educative GPT implementation. Its purpose is to show that a state-of-the-art transformer is not magic—it's just:

*   Token Embeddings + Positional Embeddings.

*   Stacked Attention Blocks (Masked Multi-head Self-Attention).

*   MLP layers for "knowledge" storage.

*   Residual connections for gradient flow (the "highway").

## Makemore: The Learning Progression
Nomes were used as the base dataset. The goal was to build models of increasing complexity:

- Bigram count.

- Multilayer Perceptron (MLP).

- RNN / LSTM / GRU.

- Transformer.

## Backpropagation as an Art
Andrej's core pedagogy: "Don't memorize. Understand. If you understand backprop deeply, you can always re-derive the equations." This leads to a debugging-first mindset.


