---
name: dossier-update
description: Processes new lab results, reports, prescriptions and test requests (PDF or photo) that landed in the new/ inbox of an existing health dossier, renames and files them by event, and updates the Hub, Clinical, Correlator, Plan and Visit Summary. Use when someone says "new exam arrived", "I dropped results in the inbox", "update my dossier", "document today's appointment", sends a photo of a report asking to file it, or says the same in Portuguese ("chegou exame novo", "atualiza meu dossiê") or any other language. It organizes and synthesizes; diagnosis and prescriptions belong to the doctor.
license: MIT
---

# Living Dossier: update

The dossier already exists (`00_Hub.md`, `Clinical.md`, `Correlator.md`, `Plan.md`, `Visit_Summary.md`, or their equivalents in the person's language). New material landed in `new/` (or `novos/`). Your job is to file it, extract it and stitch it into what is already there.

**Language:** answer and write in the language the dossier already uses.

## Non-negotiable rules

1. **Medication becomes a question.** Record what the doctor prescribed, as written. Never suggest starting, stopping, switching or adjusting a dose.
2. **No value without a source.** Every number cites document and date. Unreadable stays "unreadable".
3. **Labs and genetics in separate columns.** Genetics is predisposition.
4. **Local processing.** Nothing from the person goes to an outside service.
5. **The person's files change only with an ok.** Show the renaming plan before moving anything. Never delete an original.
6. **Emergencies stay outside the dossier.** Acute symptom: tell them to call 112 (Europe), 911 (US) or 192 (Brazil), and stop.
7. **Do not feed anxiety.** A new finding becomes a question for the appointment, at the size it actually has.

## Step 1: read everything

1. List `new/`. Read every file. Large photo: reduced copy in a temporary folder, original untouched.
2. For each one, identify the type (labs, imaging, functional test, prescription, test request, visit report), the date and the place.
3. Group by event: pages of the same document and documents from the same visit stay together. Order the pages by their printed numbering or by logical sequence.

## Step 2: file (with an ok)

- Folder per event: `Exams/YYYY/YYYY-MM-DD_Event_Place/`.
- File: `YYYY-MM-DD_type_detail.ext`, with `_01_`, `_02_` when there are several pages.
- One `YYYY-MM-DD_event_FULL.pdf` per event.
- Show the "current name → new name" table, wait for the ok, move. `new/` ends empty.

## Step 3: extract and stitch

- **Clinical:** the section for the result (extracted data, report, reading), the new line in the timeline and the updated trend table. Compare with the previous instance of the same test when there is one (for example, the same stress test done years earlier).
- **Hub:** the dashboard with the new date and the markers that changed.
- **Correlator:** only if the new data crosses another layer. Use the tags confirms, reclassifies or new question.
- **Plan:**
  - mark done what was done, with the date;
  - prescription: record medicine, dose and duration as written, and add what is useful for the appointment (what to expect, what it does not cover, signs to report to the doctor), with sources;
  - test request: becomes a to-do with the deadline the doctor wrote, plus what the request covers and what it leaves out compared with the gaps already in the dossier.
- **Visit Summary:** current medication and trends.

## Step 4: short report

In a few lines:

1. what arrived;
2. what changed in the picture;
3. what crossed with what was already there;
4. what to ask the doctor;
5. any data that needs the person to confirm (weight declared or measured, unreadable date, missing page).
