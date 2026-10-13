# Contributing

Any improvement is welcome: a new skill, a new axis in the Correlator, a sturdier script, a translation, a text fix.

## Rules

1. **No personal health data.** Not yours, not anyone's. That goes for issues, pull requests, screenshots, logs and examples. Examples only with a fictional patient, marked as fictional.
2. **The project's verbs:** organize, synthesize, structure, cross, ask. Avoid diagnose, detect, predict, treat, prescribe, including in skill descriptions. That line separates an organization tool from software with a medical purpose.
3. **The skills' "Non-negotiable rules"** (values only with a source, medication becomes a question, genetics is predisposition, local processing, emergencies outside the dossier) only change after an open discussion in an issue.
4. **Scientific claims come with a source:** a guideline (ESC, CPIC, ACMG), a peer-reviewed paper or a public database (ClinVar, gnomAD, PharmGKB).
5. **A new script runs on the person's machine**, sends no data to outside services, and documents in its header what it does, what it needs and how long it can take.

## Layout

```
.claude-plugin/                     plugin and marketplace manifests
skills/                             one folder per skill, each with SKILL.md
skills/dossier-genome/scripts/      bioinformatics scripts (bash)
templates/                          templates for the six documents
examples/en, examples/pt-BR         dossier of a fictional patient
index.html, site/                   the project page (GitHub Pages)
```

Versão em português: [CONTRIBUTING.pt-BR.md](CONTRIBUTING.pt-BR.md)
