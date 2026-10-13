# Correlator: Example Patient (fictional)

> 🧭 [Hub](00_Hub.md) · Clinical · Genetics · [Correlator](Correlator.md) · Plan · Visit summary

> **Fictional data.** Every crossing gets a tag: **confirms**, **reclassifies** or **new question**. Every action is a test to request or a question for the doctor.

## Axis: metabolic

- **Labs:** HbA1c 5.4% (03/2019) → 5.6% (05/2022) → 5.9% (04/2025). Fasting glucose 104 mg/dL (04/2025).
- **Genome:** TCF7L2 rs7903146 C/T, one copy of the common variant most associated with type 2 diabetes.
- **Family:** mother with type 2 diabetes at 52.
- **Home:** no data.

**Verdict:** **confirms.** The lab trend, the predisposition in the DNA and the family history point the same way. The predisposition explains the rise; it does not decide the outcome.
**Action:** ask the GP whether a glucose tolerance test and fasting insulin are worth doing, and how often to repeat HbA1c.

---

## Axis: gastrointestinal

- **Labs:** no specific test.
- **Genome:** LCT −13910, one copy of the lactase persistence allele.
- **Family:** no data.
- **Home:** reports discomfort with milk.

**Verdict:** **reclassifies.** People with the persistence allele usually keep making lactase as adults, so primary lactose intolerance becomes unlikely. The discomfort with milk needs another explanation.
**Action:** take to the gastroenterologist: "could the discomfort with dairy have another cause?"

---

## Axis: cardiovascular

- **Labs:** LDL 162 mg/dL (04/2025).
- **Genome:** SLCO1B1 rs4149056 T/C, reduced function of the liver transporter for statins.
- **Family:** father with high blood pressure since 60.
- **Home:** average blood pressure of 128/82 mmHg over 7 days of readings (03/2025).

**Verdict:** **new question.** Reduced-function SLCO1B1 changes the choice and dose of some statins, according to the 2022 CPIC guideline. It only matters if the doctor considers treatment.
**Action:** take the LDL, the home blood pressure average and the SLCO1B1 result to the cardiologist, and ask: "if a statin is on the table, does this change which one and at what dose?"

---

## Axis: iron and vitamins

- **Labs:** ferritin 11 ng/mL and hemoglobin 12.4 g/dL (04/2025). Vitamin D 18 ng/mL (04/2025).
- **Genome:** nothing relevant on the chip.
- **Family:** no data.
- **Home:** no data.

**Verdict:** **new question.** Low iron stores with hemoglobin at the lower limit.
**Action:** ask the GP for the likely cause of the low ferritin and whether vitamin D and iron need investigation or replacement.

---

## Summary matrix

| Axis | Genome | Labs / family | Verdict | Action |
|---|---|---|---|---|
| Metabolic | TCF7L2 C/T | HbA1c 5.4 → 5.9 · mother T2D at 52 | **confirms** | glucose test + insulin? |
| Gastrointestinal | LCT persistent | discomfort with milk | **reclassifies** | another cause? |
| Cardiovascular | SLCO1B1 reduced function | LDL 162 · home BP 128/82 · father HBP | **new question** | statin: which and what dose? |
| Iron and vitamins | nothing found | ferritin 11 · vit. D 18 | **new question** | cause and replacement? |

## Gaps that would close correlations

1. **Fasting insulin (HOMA-IR)**: shows whether insulin resistance has started.
2. **ApoB and Lp(a)**: refine cardiovascular risk; Lp(a) is measured once in a lifetime.
3. **Working up the low ferritin**: closes the iron axis.
