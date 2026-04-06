# Yann LeCun: AMI Architecture

## Advanced Machinery Of Intelligence (AMI)

O meu paper de 2022, "A Path Towards Autonomous Machine Intelligence", nao e so mais um paper. Ele e um blueprint para como passamos da IA estreita atual para agentes autonomos que realmente entendem o mundo.

A arquitetura AMI e composta por 6 modulos principais coordenados:

1. **Configurator (Configurador)**: O modulo que define os objetivos de curto e longo prazo (via funcoes de custo) e seleciona que partes do sistema processam cada tarefa.

2. **Perception (Percepcao)**: O modulo que recebe os inputs sensoriais (video, audio, etc.) e os traduz para o espaco latente (embeddings).

3. **World Model (Modelo de Mundo)**: O coracao do sistema. Ele faz duas coisas:
   - Mantem o estado atual do mundo (state `s_t`).
   - Preve o proximo estado `s_{t+1}` a partir do estado atual e de uma acao proposta `a_t`. (E aqui que entra o JEPA).

4. **Cost (Custo)**: Avalia quao "bom" ou "ruim" e um estado. Ele tem dois componentes:
   - **Intrinsic Cost**: Necessidades basicas e seguranca (Hardwired).
   - **Trainable Cost**: Aprende a prever custos de longo prazo a partir de dados passados.

5. **Short-Term Memory (Memoria de Curto Prazo)**: Mantem informacoes relevantes para a tarefa imediata e estados passados recentes para manter consistencia.

6. **Actor (Ator)**: O modulo que propoe e executa acoes. No planejamento, o Ator simula sequencias de acoes no Modelo de Mundo antes de executa-las na realidade, escolhendo a sequencia que minimiza o custo total.

---

Este sistema e fundamentalmente diferente de um LLM porque:
- **E preditivo, nao generativo**: Nao tenta prever o proximo token, tenta prever a evolucao do estado do mundo.
- **Tem planejamento (Planning)**: Ele pode simular o futuro "na cabeça" antes de agir.
- **E grounded**: Ele e treinado em dados sensoriais reais (como video fisico), nao apenas em simbolos de texto humano.
