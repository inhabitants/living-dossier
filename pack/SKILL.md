---
name: living-dossier
description: Builds and keeps a personal health dossier. Turns a folder of lab results (PDF or photo), prescriptions, family history and genetic data into six cross-linked Markdown documents (Hub, Clinical, Genetics, Correlator, Plan, Visit Summary), then files every new result that lands in the inbox and stitches it into what is already there. Use when someone asks to "build my health dossier", "organize my lab results", "put my exams and my DNA together", "prepare a summary for my doctor", "new exam arrived", "update my dossier", "what does my 23andMe say", "analyze my genome", or the same in Portuguese ("monta meu dossiê de saúde", "organiza meus exames", "chegou exame novo", "atualiza meu dossiê", "analisa meu genoma") or any other language. It organizes, synthesizes and structures; diagnosis and prescriptions belong to the doctor.
license: MIT
---

# Living Dossier

Three jobs, one file each. Look at the person's folder and pick:

- **No dossier yet** (no `00_Hub.md`, or its equivalent in the person's language): follow [references/build.md](references/build.md).
- **The dossier exists** and something landed in `new/` (or `novos/`), or the person sends a new report, prescription or test request: follow [references/update.md](references/update.md).
- **Genetic data** (a 23andMe, MyHeritage or Ancestry file, a VCF or a CRAM), during the build or on its own: follow [references/genome.md](references/genome.md). It writes `Genetics.md` and the genetic crossings of the Correlator.

Each file opens with its non-negotiable rules; the build and the update share the same seven. Read them before touching any file of the person's.

## Next to this file

- `templates/`: the six documents the build fills in.
- `examples/`: the Hub and the Correlator of a fictional patient, in English and in Portuguese. That is the bar.
- `scripts/`: the bash scripts the genome uses with samtools and bcftools (Linux, macOS, or WSL on Windows). A consumer chip needs none of them.
- `DISCLAIMER.md`: what this is not.
