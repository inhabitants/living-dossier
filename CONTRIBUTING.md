# Contributing · Contribuir

**English** · [Português](#português)

## English

Any improvement is welcome: a new skill, a new axis in the Correlator, a sturdier script, a translation, a text fix.

1. **No personal health data.** Not yours, not anyone's. That goes for issues, pull requests, screenshots, logs and examples. Examples only with a fictional patient, marked as fictional.
2. **The project's verbs:** organize, synthesize, structure, cross, ask. Avoid diagnose, detect, predict, treat, prescribe, including in skill descriptions. That line separates an organization tool from software with a medical purpose.
3. **The skills' "Non-negotiable rules"** (values only with a source, medication becomes a question, genetics is predisposition, local processing, emergencies outside the dossier) only change after an open discussion in an issue.
4. **Scientific claims come with a source:** a guideline (ESC, CPIC, ACMG), a peer-reviewed paper or a public database (ClinVar, gnomAD, PharmGKB).
5. **A new script runs on the person's machine**, sends no data to outside services, and documents in its header what it does, what it needs and how long it can take.

## Português

Qualquer melhoria é bem-vinda: skill nova, eixo novo no Correlator, script mais robusto, tradução, correção de texto.

1. **Nenhum dado pessoal de saúde.** Nem seu, nem de ninguém. Isso vale pra issue, pull request, print, log e exemplo. Exemplo só com paciente fictício, e marcado como fictício.
2. **Os verbos do projeto:** organiza, sintetiza, estrutura, cruza, pergunta. Evite diagnostica, detecta, prevê, trata, receita, inclusive em descrição de skill. Essa linha separa ferramenta de organização de software com finalidade médica.
3. **As "Non-negotiable rules" das skills** (valor só com fonte, remédio vira pergunta, genética é predisposição, processamento local, emergência fora do dossiê) só mudam com discussão aberta numa issue.
4. **Afirmação científica traz fonte:** diretriz (ESC, CPIC, ACMG), artigo revisado por pares ou base pública (ClinVar, gnomAD, PharmGKB).
5. **Script novo roda na máquina da pessoa**, sem mandar dado pra serviço externo, e documenta no cabeçalho o que faz, o que precisa e quanto tempo pode levar.

## Layout · Estrutura

```
.claude-plugin/                     plugin and marketplace manifests · manifesto do plugin e do marketplace
skills/                             one folder per skill · uma pasta por skill
skills/dossier-genome/scripts/      bioinformatics scripts (bash) · scripts de bioinformática
templates/                          the six document templates · modelos dos seis documentos
examples/en, examples/pt-BR         fictional patient · paciente fictícia
index.html, site/                   the project page (GitHub Pages) · a página do projeto
```
