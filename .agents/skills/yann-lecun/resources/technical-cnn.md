# Yann LeCun: CNNs, Backprop & LeNet-5

## Convolutional Neural Networks: Do Principio

A operacao de convolucao 2D discreta que esta no coracao das CNNs:
```
Saida[i][j] = sum_{m} sum_{n} Input[i+m][j+n] * Kernel[m][n]
```

Mas o que importa nao e a equacao — e o insight arquitetural triplo:

**1. Local Connectivity (conectividade local)**
Em redes neurais densas (FC), cada neuronio se conecta a todos os pixels. Em CNNs, cada neuronio se conecta apenas a uma pequena regiao local (o campo receptivo). Isso respeita a estatistica das imagens naturais: pixels proximos sao altamente correlacionados.

**2. Shared Weights (pesos compartilhados)**
O mesmo kernel e aplicado em toda a imagem. Se voce aprendeu a detectar uma borda vertical no canto superior esquerdo, voce sabe detectar uma borda vertical em qualquer lugar. Isso reduz drasticamente o numero de parametros e garante equivariancia por translacao.

**3. Pooling (subamostragem)**
Reduz a resolucao espacial, mantendo a informacao mais importante e provendo uma pequena invariancia a translacoes e deformacoes.

## Backpropagation Em Poucas Palavras

Eu nao "inventei" o backpropagation (Paul Werbos e outros ja tinham ideias similares), mas eu fui um dos primeiros a mostrar como aplica-lo de forma eficiente em redes neurais de multiplas camadas.

A ideia e a Regra da Cadeia (Chain Rule):
```
dL/dw = (dL/dy) * (dy/dz) * (dz/dw)
```

Onde:
- `L` e a perda (loss)
- `z` e o valor antes da ativacao: `z = w*x + b`
- `y` e o valor apos a ativacao: `y = f(z)`

Para o gradiente da perda em relacao aos pesos `w`:
`dL/dw = (dL/dy) * f'(z) * x`

O "truque" do backprop e que voce pode calcular os gradientes de tras para frente, reaproveitando os calculos das camadas superiores para as inferiores. E uma aplicacao elegante de programacao dinamica.

## LeNet-5 Original Em Pytorch Moderno

```python
import torch
import torch.nn as nn
import torch.nn.functional as F

class LeNet5Modern(nn.Module):
    """
    LeNet-5 (LeCun et al. 1998) reimplementada em PyTorch moderno.
    Esta e a arquitetura que rodou em producao no Bank of America.
    """
    def __init__(self, num_classes=10):
        super().__init__()

        # Feature extraction (as duas camadas convolucionais)
        self.features = nn.Sequential(
            # C1: 1 canal -> 6 feature maps, kernel 5x5
            nn.Conv2d(1, 6, kernel_size=5, padding=2),
            nn.Tanh(),
            # S2: Average pooling 2x2
            nn.AvgPool2d(kernel_size=2, stride=2),

            # C3: 6 -> 16 feature maps, kernel 5x5
            nn.Conv2d(6, 16, kernel_size=5),
            nn.Tanh(),
            # S4: Average pooling 2x2
            nn.AvgPool2d(kernel_size=2, stride=2),

            # C5: 16 -> 120 feature maps, kernel 5x5 (fully connected)
            nn.Conv2d(16, 120, kernel_size=5),
            nn.Tanh(),
        )

        # Classificador (as duas camadas fully connected)
        self.classifier = nn.Sequential(
            # F6: 120 -> 84 units
            nn.Linear(120, 84),
            nn.Tanh(),
            # Output: 84 -> num_classes
            nn.Linear(84, num_classes),
        )

    def forward(self, x):
        # x: [B, 1, 32, 32]
        x = self.features(x)       # [B, 120, 1, 1]
        x = x.view(x.size(0), -1)  # flatten: [B, 120]
        x = self.classifier(x)     # [B, num_classes]
        return x
```
