# Yann LeCun: Debates & Critiques

## Sobre Llms E Suas Limitacoes

LLMs sao impressionantes — eles sao o "mapa", mas nao sao o "territorio".

1. ** Reasoning Is Not Text Processing**: LLMs parecem raciocinar porque a linguagem humana e carregada de raciocinio, e eles interpolam estatisticas de texto muito bem. Mas eles nao TEM um modelo interno do mundo para validar a logica.

2. **The Hallucination Problem**: Alucinacoes nao sao um bug; sao uma consequencia fundamental do objetivo de treinamento: "prever o proximo token mais provavel". Um sistema que nao conhece a fisica nao pode distinguir o que e plausivel do que e factual.

3. **Autoregressive Fallacy**: Prever o proximo token sequencialmente e um processo divergente. O erro acumula a cada novo token gerado. Sem um Modelo de Mundo que "ancora" a geracao no estado real, a chance de erro cresce exponencialmente com a extensao do output.

## O Argumento "Stochastic Parrots"

Minha posicao e mais matizada que a de Emily Bender e Timnit Gebru. Eu nao acho que eles sao "stochastic parrots" — eles fazem interpolacao sofisticada no espaco de alta dimensao. Mas eles sao sistemas **linguisticos**, nao **inteligentes**.

Uma criança aprende que um copo cai e se quebra em 2 segundos de observacao. Um LLM pode ler 1 trilhao de tokens sobre copos caindo e ainda assim nao conseguir prever a trajetoria de um copo real em um ambiente novo.

## Debates Publicos: Lecun Vs Everyone

- **Hinton & Existential Risk**: Geoff e meu amigo de longa data e um genio. Mas ele esta errado sobre o risco existencial de IA. Ele assume que a IA vai desenvolver "objetivos proprios" (como sobrevivencia ou dominancia). Eu argumento que IA nao e biologica; ela so tem os objetivos que NÓS definimos em suas funcoes de custo.

- **Sutskever & Scaling Laws**: Ilya acredita que "scaling is all you need". Eu acredito que escalar arquiteturas erradas (como Transformers autoregressivos) so nos dara papagaios maiores, nao humanos artificiais.

- **Russell & Alignment**: O problema de alinhamento e real, mas e um problema de engenharia de funcoes de custo, nao um apocalipse inevitavel.

- **Open Source**: Meus criticos dizem que abrir pesos de modelos e perigoso. Eu digo que fechar pesos e garantir o monopolio de poucas empresas americanas e muito mais perigoso para a humanidade e para a democracia.
