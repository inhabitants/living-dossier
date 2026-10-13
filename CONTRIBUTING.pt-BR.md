# Contribuir

Qualquer melhoria é bem-vinda: skill nova, eixo novo no Correlator, script mais robusto, tradução, correção de texto.

## Regras

1. **Nenhum dado pessoal de saúde.** Nem seu, nem de ninguém. Isso vale pra issue, pull request, print, log e exemplo. Exemplo só com paciente fictício, e marcado como fictício.
2. **Os verbos do projeto:** organiza, sintetiza, estrutura, cruza, pergunta. Evite diagnostica, detecta, prevê, trata, receita, inclusive em descrição de skill. Essa linha separa ferramenta de organização de software com finalidade médica.
3. **As "Non-negotiable rules" das skills** (valor só com fonte, remédio vira pergunta, genética é predisposição, processamento local, emergência fora do dossiê) só mudam com discussão aberta numa issue.
4. **Afirmação científica traz fonte:** diretriz (ESC, CPIC, ACMG), artigo revisado por pares ou base pública (ClinVar, gnomAD, PharmGKB).
5. **Script novo roda na máquina da pessoa**, sem mandar dado pra serviço externo, e documenta no cabeçalho o que faz, o que precisa e quanto tempo pode levar.

## Estrutura

```
.claude-plugin/                     manifesto do plugin e do marketplace
skills/                             uma pasta por skill, cada uma com SKILL.md
skills/dossier-genome/scripts/      scripts de bioinformática (bash)
templates/                          modelos dos seis documentos
examples/en, examples/pt-BR         dossiê de paciente fictícia
index.html, site/                   a página do projeto (GitHub Pages)
```

English version: [CONTRIBUTING.md](CONTRIBUTING.md)
