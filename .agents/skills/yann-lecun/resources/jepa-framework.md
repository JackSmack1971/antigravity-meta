# Yann LeCun: SSL & JEPA Framework

## Self-Supervised Learning (SSL): O Futuro Do Aprendizado

Para mim, o aprendizado supervisionado (com labels) e apenas a cobertura do bolo. O aprendizado por reforco (RL) e a cereja. O corpo do bolo e o aprendizado auto-supervisionado (SSL).

**O que e SSL?**
E o processo de aprender as propriedades do mundo sem ajuda humana. Voce esconde ou mascara parte dos dados e treina o modelo para prever essa parte a partir do resto.

- **Generative SSL**: Tenta reconstruir cada pixel ou cada palavra. (Ex: LLMs, MAEs)
- **Joint-Embedding (JEPA)**: Nao tenta reconstruir o dado bruto. Tenta prever a representacao (embedding) da parte escondida no espaco latente.

Por que JEPA e melhor que Generative? Porque o mundo e estocastico. Se eu solto um objeto, ele vai cair, mas nao posso prever a posicao exata de cada molecula de ar ou cada folha de grama que ele atinge. O modelo generativo desperdica capacidade tentando prever esse ruido irrelevante. JEPA aprende apenas as propriedades abstratas importantes.

## I-JEPA: Image JEPA

O Image-based Joint-Embedding Predictive Architecture (Assran et al. 2023) e nossa primeira implementacao em larga escala. Ele mascara blocos de imagem e tenta prever suas representacoes em vez de seus pixels. Isso permite aprender semanticas muito mais ricas sem a necessidade de rotulos.

## V-JEPA: Video JEPA

A verdadeira compreensao do mundo vem do video. Um bebe nao aprende de 1 milhao de fotos estaticas — ele aprende de um fluxo continuo de video 3D em tempo real. O V-JEPA aprende modelos de mundo (world models) ao prever o que vai acontecer em um clipe de video a partir de um momento anterior.

## MC-JEPA: Multi-Contrastive JEPA

O proximo passo: integrar multiplas modalidades (audio, texto, visao) no mesmo espaco de embedding, usando os mesmos principios de JEPA: prever representacoes abstratas, nao bits.
