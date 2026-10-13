# Living Dossier

A Claude Code plugin that organizes your medical life in one folder: lab results, genome, family history and what you measure at home, crossed in a single place. You walk into the appointment knowing what to ask.

> **Organization, synthesis and structuring of information.** Your doctor has the final word. Medication only with a prescription. Read the [DISCLAIMER](DISCLAIMER.md) before using it.

Site: [sapiensinteticos.com/living-dossier](https://www.sapiensinteticos.com/living-dossier) · Leia em português: [README.pt-BR.md](README.pt-BR.md)

## Why I made this

There was a time when my first brain was failing. I had brain fog: my reasoning couldn't keep up, I kept losing the thread, and deciding anything about my own health became a weight I couldn't carry alone.

That's when AI became my second brain. Back then it was Gemini, a technology far below what we have today, and it still protected me. It organized what I couldn't organize, translated lab reports and conversations with doctors, and gave me back the bare minimum of control to make better decisions when my cognition couldn't keep up. It helped save my life.

Over time I gathered years of lab results, reports from different doctors in different countries, my family history and my genome. Getting to know myself at a biological level, with an agent translating all of it, gave me the chance to return to a life I thought was in the past. Today the one doing this work with me is Claude Opus 5.5, in the most responsible and detailed way I have ever seen.

None of this is medical advice. It is my motivation. Health varies a lot from person to person, and what worked for me is a starting point.

What I feel now is only gratitude. To Gemini, and to the whole context that made this possible: technology getting cheaper year after year, open source, the research and the published work of people I will never meet, feeding one dataset after another until it reached me. This plugin is my way of giving a little back. It is free and fully open, so that better and smarter people than me can make good use of it and adapt it to what they need.

Borderless

## What it does

- Reads lab reports in PDF and photos of exams, and extracts every value with its date, lab and reference range.
- Builds six Markdown documents: Hub, Clinical, Genetics, Correlator, Plan and a one-page Visit Summary.
- Crosses lab results, genetics, family history and home measurements, and tags every crossing as **confirms**, **reclassifies** or **new question**.
- Turns anything about medication into a question for your doctor.
- Files your documents in one folder per event, with standard names.
- With a whole genome, guides the analysis on your own machine with open bioinformatics tools.

## What it does not do

- Diagnosis.
- Starting, changing or stopping medication.
- Risk scores meant to replace a medical assessment.
- Emergencies. An acute symptom is a case for emergency services: **112** in Europe, **911** in the US, **192** (SAMU) in Brazil.

## Install

In Claude Code:

```
/plugin marketplace add inhabitants/living-dossier
/plugin install living-dossier@living-dossier
```

To try a local copy, replace `inhabitants/living-dossier` with the folder path.

Recommended: Anthropic's official document skills, for reading PDFs.

```
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
```

Any other agent can follow the skills straight from the repo: point it at [`llms.txt`](llms.txt).

## How to use it

1. Create a folder for your health, **outside any git repository**. Put your lab reports, photos, prescriptions and DNA file in it. Inside it, create `new/` as your inbox.
2. Open Claude Code in that folder and ask: *"build my health dossier"*. The `dossier-build` skill takes inventory, asks what is missing and writes the documents.
3. New results: drop the PDF or photo into `new/` and say *"new exam arrived"*. The `dossier-update` skill renames, files and updates everything.
4. DNA: ask *"analyze my genome"*. The `dossier-genome` skill handles consumer chips (23andMe, MyHeritage, Ancestry) and whole genomes (VCF and CRAM).
5. Bring `Visit_Summary.md` to your next appointment.

The skills are written in English and answer in your language: ask in Portuguese, Spanish or anything else, and the dossier comes out in that language.

## What you get

| Document | Contents |
|---|---|
| `00_Hub.md` | Dashboard with the markers that matter most and links to the other documents |
| `Clinical.md` | Every result extracted, timeline by year, trends, active problems |
| `Genetics.md` | Only what is actionable: cardiovascular risk, pharmacogenomics, carrier status, ancestry |
| `Correlator.md` | By health axis, labs × genetics × family × home, with the tag of each crossing |
| `Plan.md` | What to do, in order: one blood draw, appointments with questions ready, how often to repeat each test |
| `Visit_Summary.md` | One page to bring to the doctor |

The templates live in [`templates/`](templates/). A finished dossier for a fictional patient lives in [`examples/`](examples/) (English and Portuguese).

## Privacy

- Your data stays in your folder. The plugin has no server and collects nothing.
- Claude reads the files it opens for you through Anthropic's API. With a whole genome, the tools run on your computer and Claude reads only the results; the raw file stays on your disk.
- DNA is the most permanent data you have: you can change a password, not a genome. Avoid uploading your file to free interpretation websites.
- This repository's `.gitignore` blocks common lab and DNA formats, but the main protection is keeping your dossier folder out of git.

## Status

Published as is, by one person, for free. There is no support promise. Forks are welcome, and so are pull requests that follow [CONTRIBUTING](CONTRIBUTING.md).

## License

[MIT](LICENSE). Use it, copy it, adapt it.

From the bench at [Sapiens Sintéticos](https://www.sapiensinteticos.com). Not affiliated with Anthropic. Claude is a trademark of Anthropic, PBC.
