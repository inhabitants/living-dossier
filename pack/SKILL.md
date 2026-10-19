---
name: living-dossier
description: Builds and keeps a personal health dossier. Turns a folder of lab results (PDF or photo), prescriptions, family history and genetic data into six cross-linked Markdown documents (Hub, Clinical, Genetics, Correlator, Plan, Visit Summary), then files every new result that lands in the inbox and stitches it into what is already there. Use when someone asks to "build my health dossier", "organize my lab results", "put my exams and my DNA together", "prepare a summary for my doctor", "new exam arrived", "update my dossier", or the same in Portuguese ("monta meu dossiê de saúde", "organiza meus exames", "chegou exame novo", "atualiza meu dossiê") or any other language. It organizes, synthesizes and structures; diagnosis and prescriptions belong to the doctor.
license: MIT
---

# Living Dossier

Two jobs, one file each. Look at the person's folder and pick:

- **No dossier yet** (no `00_Hub.md`, or its equivalent in the person's language): follow [references/build.md](references/build.md).
- **The dossier exists** and something landed in `new/` (or `novos/`), or the person sends a new report, prescription or test request: follow [references/update.md](references/update.md).

Both files open with the same seven non-negotiable rules. Read them before touching any file of the person's.

## Next to this file

- `templates/`: the six documents the build fills in.
- `examples/`: the Hub and the Correlator of a fictional patient, in English and in Portuguese. That is the bar.
- `DISCLAIMER.md`: what this is not.

## Genetics

Reading a consumer chip or a whole genome lives in the full plugin, as the `dossier-genome` skill (https://github.com/inhabitants/living-dossier). It sets up samtools and bcftools on the person's own machine, so it does not ship in this package. Without it, the dossier is built from labs, family and home measurements: leave `Genetics.md` out, keep the genome column empty in the Correlator, and say so in the Hub.
