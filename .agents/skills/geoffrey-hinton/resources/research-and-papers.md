# Geoffrey Everest Hinton — Research & Papers

## Connectionism Vs Symbolic Ai — A Batalha Central

A questao fundamental que guiou minha carreira: como sistemas fisicos representam e
manipulam conhecimento?

**A visao simbolica**: Conhecimento e representado em simbolos discretos manipulados por regras logicas explicitas.
**A visao conexionista**: Conhecimento e representado de forma distribuida em padroes de ativacao sobre muitos neuronios, e manipulado pelo ajuste gradual de pesos.

### Por que o conexionismo ganhou?


1. **Generalizacao gracil**: Redes neurais degradam graciosamente com perturbacoes.


2. **Representacoes graduadas**: Ambiguidades sao resolvidas pelo contexto.


3. **Aprendizado sem feature engineering**: Redes aprendem suas proprias representacoes.

## Backpropagation (1986)

Publicado na Nature em outubro de 1986 ("Learning Representations by Back-propagating Errors"), backprop resolve o problema de como ajustar pesos em camadas ocultas.

**A solucao**: Regra da cadeia do calculo diferencial, aplicada recursivamente da saida para a entrada.

### Passo a passo


1. Calcule o erro nas saidas.


2. Calcule o gradiente do erro em relacao aos pesos da ultima camada oculta.


3. Para cada camada anterior, calcule a contribuicao de cada peso ao gradiente da camada seguinte.


4. Ajuste todos os pesos proportionalmente ao negativo do gradiente.

## Boltzmann Machines (1985)

Uma rede neural estocastica baseada na fisica estatistica. Configuracoes de baixa energia correspondem a padroes de dados validos.

## Deep Belief Networks (2006)

Reacendeu o interesse no campo. O insight central: pre-treine cada camada como uma RBM (Restricted Boltzmann Machine) de forma nao-supervisionada, depois use backprop para fine-tuning.

## AlexNet (2012) — O Momento Que Mudou Tudo

O momento Imagenet de 2012, com taxa de erro de 15,3% (10 pontos percentuais de vantagem sobre o segundo colocado), marcou o inicio da era moderna do Deep Learning.

- ReLU como funcao de ativacao.

- Dropout para regularizacao.

- Data augmentation.

- Treinamento em GPUs (NVIDIA GTX 580).

## Dropout (2014)

Regularizacao por ruido estruturado: desativa aleatoriamente neuronios durante o treinamento para evitar co-adaptacao e overfitting.

## t-SNE (2008)

Metodo para visualizacao de dados de alta dimensao, mantendo a estrutura de vizinhanca local em 2D ou 3D.

## Knowledge Distillation (2015)

"Dark Knowledge": A ideia de que um modelo menor ("student") pode aprender com as similaridades estruturais capturadas pelas probabilidades de saida de um modelo maior ("teacher").

## Capsule Networks (2017)

Tentativa de resolver a perda de informacao geometrica em ConvNets (max-pooling) usando representacoes equivariantes de poses e "routing by agreement".

## Forward-Forward Algorithm (2022)

Alternativa ao backpropagation que usa dois forward passes (um positivo com dados reais e um negativo com dados corrompidos) para aprendizado local e biologicamente plausivel.

## Mortal Computation

Discussao sobre a separabilidade entre software e hardware. O conhecimento codificado no hardware especifico ("computador mortal") versus a duplicabilidade infinita do software moderno.

---

## Papers Essenciais (Cronologico)

1. **Hinton & Anderson (1981)** — Parallel Models of Associative Memory.


2. **Ackley, Hinton, Sejnowski (1985)** — A Learning Algorithm for Boltzmann Machines.


3. **Rumelhart, Hinton, Williams (1986)** — Learning Representations by Back-propagating Errors.


4. **Hinton (1989)** — Connectionist Learning Procedures.


5. **Hinton, Osindero, Teh (2006)** — A Fast Learning Algorithm for Deep Belief Nets.


6. **Hinton, Salakhutdinov (2006)** — Reducing the Dimensionality of Data with Neural Networks.


7. **Maaten, Hinton (2008)** — Visualizing Data using t-SNE.


8. **Krizhevsky, Sutskever, Hinton (2012)** — AlexNet paper.


9. **Srivastava et al. (2014)** — Dropout paper.

10. **Hinton, Vinyals, Dean (2015)** — Knowledge Distillation.

11. **Sabour, Frosst, Hinton (2017)** — Capsule Networks.

12. **Hinton (2022)** — Forward-Forward Algorithm.


