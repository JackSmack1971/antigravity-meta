# Yann LeCun: EBMs & SSL Implementation

## Energy-Based Models (EBM)

EBMs sao uma das minhas contribuicoes que acho mais subestimada e que vai ser mais influente a longo prazo.

**O problema com modelos probabilisticos**:
Para ter uma distribuicao de probabilidade valida, voce precisa de uma integral (ou soma) sobre todo o espaco que seja 1. Para espacos de alta dimensao, calcular essa constante de normalizacao (a partition function Z) e intratavel.

```
P(x) = exp(-E(x)) / Z
Z = integral exp(-E(x)) dx   # intratavel em alta dimensao!
```

**A solucao EBM**: esquecer Z. Defina uma funcao de energia `E(x)` que:
- Seja baixa para configuracoes compativeis com o dado observado.
- Seja alta para configuracoes incompativeis.

Treine diretamente a funcao de energia com contrastive divergence ou metodos de score matching. Isso e fundamental para AGI porque o mundo real nao tem uma distribuicao de probabilidade bem-definida. JEPA e, em certo sentido, um EBM no espaco de representacoes:
```
E(x, y) = ||f_theta(x) - g_phi(f_theta_bar(y))||^2
```

## SSL: SimCLR Simplificado Em Pytorch

```python
import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.transforms as T

class EnergyBasedModel(nn.Module):
    """
    EBM: F(x) = energia de x
    Baixa energia = alta compatibilidade
    Alta energia = baixa compatibilidade
    """
    def __init__(self, latent_dim=512):
        super().__init__()
        self.energy_net = nn.Sequential(
            nn.Linear(latent_dim, 256),
            nn.SiLU(),
            nn.Linear(256, 128),
            nn.SiLU(),
            nn.Linear(128, 1)  # escalar: energia
        )

    def energy(self, x):
        """Retorna energia de x"""
        return self.energy_net(x).squeeze(-1)

    def contrastive_loss(self, x_pos, x_neg):
        """
        L = E[F(x_pos)] - E[F(x_neg)] + regularizacao
        """
        E_pos = self.energy(x_pos)
        E_neg = self.energy(x_neg)
        loss = E_pos.mean() - E_neg.mean()
        reg = 0.1 * (E_pos.pow(2).mean() + E_neg.pow(2).mean())
        return loss + reg

def get_ssl_augmentations(size=224):
    """As augmentacoes definem o que o modelo aprende a ser invariante."""
    return T.Compose([
        T.RandomResizedCrop(size, scale=(0.2, 1.0)),
        T.RandomHorizontalFlip(),
        T.ColorJitter(brightness=0.4, contrast=0.4, saturation=0.4, hue=0.1),
        T.RandomGrayscale(p=0.2),
        T.GaussianBlur(kernel_size=size//10*2+1, sigma=(0.1, 2.0)),
        T.ToTensor(),
        T.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
    ])
```
