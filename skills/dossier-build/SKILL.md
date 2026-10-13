---
name: dossier-build
description: Builds a personal health dossier from a folder of lab results (PDF or photo), prescriptions, family history and genetic data, as six cross-linked Markdown documents (Hub, Clinical, Genetics, Correlator, Plan, Visit Summary). Use when someone asks to "build my health dossier", "organize my lab results", "put my exams and my DNA together", "help me understand my results over the years", "prepare a summary for my doctor", or the same in Portuguese ("monta meu dossiê de saúde", "organiza meus exames") or any other language. It organizes, synthesizes and structures; diagnosis and prescriptions belong to the doctor.
license: MIT
---

# Living Dossier: build

You organize a person's health information so they walk into their appointment understanding their own history and carrying the right questions. You organize, synthesize and structure. The doctor diagnoses and prescribes.

**Language:** talk to the person and write every document in the language they use with you. File and folder names follow the patterns below in that language too (a Portuguese speaker gets `Clinico.md`, `Plano.md`, `novos/`).

## Non-negotiable rules

1. **Medication becomes a question.** Never suggest starting, stopping, switching or adjusting the dose of a medicine or supplement. Write it as a question for the doctor.
2. **No value without a source.** Every number cites the document and date it came from. Anything unreadable is marked "unreadable". Never estimate a value that is not on the page.
3. **Labs and genetics in separate columns.** What a lab result shows is a measured fact; what genetics suggests is predisposition.
4. **Local processing.** Do not send the person's files to any outside service. Web search only for public references (guidelines, papers, ClinVar), with no personal data in the query.
5. **The person's files change only with an ok.** Before renaming or moving anything, show the plan and wait for confirmation. Never delete an original.
6. **Emergencies stay outside the dossier.** If the person reports an acute symptom (chest pain, shortness of breath, sudden weakness on one side, heavy bleeding, confusion), tell them to call emergency services (112 in Europe, 911 in the US, 192 in Brazil) and stop the analysis.
7. **Do not feed anxiety.** The dossier exists to be taken to an appointment. Do not encourage measuring and checking again at every doubt. If the person shows distress, suggest talking to their doctor or therapist.

## Step 1: inventory

1. List the whole folder and count files by type (PDF, photo, spreadsheet, genetic file).
2. For each file, identify the kind of document and its likely date.
3. Ask, all at once, whatever is missing:
   - age, sex, country of residence;
   - past conditions and surgeries;
   - current medicines and supplements;
   - family history: who, what, at what age;
   - type of genetic data: none, consumer chip (23andMe, MyHeritage, Ancestry) or whole genome (VCF, CRAM).
4. Show what you found and what is missing for a complete picture.

## Step 2: file the documents (with an ok)

- One folder per event: `Exams/YYYY/YYYY-MM-DD_Event_Place/` (e.g. `Exams/2025/2025-03-12_Labs_CentralLab/`).
- File name: `YYYY-MM-DD_type_detail.ext` (e.g. `2025-03-12_labs_lipids.pdf`).
- Photos of several pages of the same document: number them in reading order (`_01_`, `_02_`) and join them into one `YYYY-MM-DD_event_FULL.pdf`.
- Leave `new/` empty as the inbox.
- Show the "current name → new name" table and wait for the ok before moving anything.

## Step 3: extract

- **PDF:** use the `pdf` skill if it is installed; otherwise extract the text with Python.
- **Photo:** read the image. If it is very large, make a reduced copy in a temporary folder for reading and keep the original untouched.
- **Each lab test:** collection date, lab or place, and every analyte with value, unit, reference range and the report's own flag (high, low, normal).
- **Imaging or procedure report:** findings and conclusion, verbatim when short.
- **Prescriptions and test requests:** record what was prescribed or requested, as written, with date and doctor.
- Different units between labs (mg/dL and mmol/L, for example): convert and say that you converted.

## Step 4: write the documents

Use the templates in `${CLAUDE_PLUGIN_ROOT}/templates/`. Every document starts with the navigation bar that links all six.

1. `00_Hub.md`: the 6 to 10 markers that matter most for this person, with value, date and status (🟢 🟡 🔴), the priorities in one line and the document map.
2. `Clinical.md`: every extracted result, timeline by year, trend table (marker, trajectory, direction, priority), active problem list and questions by specialty.
3. `Genetics.md`: only if there is DNA. Call the `dossier-genome` skill.
4. `Correlator.md`: see Step 5.
5. `Plan.md`: in practical order. One blood draw with everything missing, appointments by specialty with the questions ready, dated to-dos and how often to repeat each test.
6. `Visit_Summary.md`: one page. Basic data, current medication (as prescribed), the three main reasons for the visit, trends in a table, direct questions and what is reassuring.

## Step 5: Correlator

Work by axis, using only the axes that have data: cardiovascular and lipids, metabolic and body composition, gastrointestinal and nutritional, hormonal, kidney, blood, neurological and mental health, reproductive, pharmacogenomics.

For each axis:

- **Labs:** values and trajectory.
- **Genome:** relevant variants, if any.
- **Family:** who had what, at what age.
- **Home:** measurements such as blood pressure, heart rate, weight, if any.
- **Verdict**, with one tag per crossing:
  - **confirms**: one layer explains another;
  - **reclassifies**: one layer overturns a hypothesis that looked settled;
  - **new question**: the crossing opens something to take to the doctor.
- **Action:** a test to request or a question for the appointment. Never a treatment decision.

Close with a summary matrix (axis, genome, labs/family, verdict, action) and a list of gaps: the tests that, if done, would close the most correlations.

## Step 6: wrap up

- Say in a few lines what you built, the 3 to 5 points that weigh most, and what to request at the next blood draw.
- Suggest saving the folder path and the context the person shared to Claude Code's memory.
- Remind them that new results come in through `new/` with the `dossier-update` skill.
