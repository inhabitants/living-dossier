#!/usr/bin/env bash
# Living Dossier: genotypes only the positions you care about, straight from the CRAM/BAM, without scanning the whole file.
#
# Usage:
#   bash genotype-positions.sh file.cram reference.fa positions.tsv output.vcf.gz [bcftools] [samtools]
#
# positions.tsv: CHROM<TAB>POS (1-based), one per line, with the same naming as the reference
#                (chr1 or 1). Convert rsIDs to coordinates in the right build first (Ensembl, dbSNP).
#
# Uses -R (regions through the index): jumps straight to the positions. Never swap it for -T on a
# large CRAM, which reads the whole file. Needs the index (.crai/.bai); without one, the script
# builds it (can take ~1 h on a 30x genome).
set -euo pipefail

ALN="${1:?.cram/.bam file}"
REF="${2:?reference .fa (with .fai)}"
POS="${3:?positions.tsv}"
OUT="${4:?output.vcf.gz}"
BCFTOOLS="${5:-bcftools}"
SAMTOOLS="${6:-samtools}"

if [ ! -f "$REF.fai" ]; then
  echo "Indexing the reference..."
  "$SAMTOOLS" faidx "$REF"
fi

if [ ! -f "$ALN.crai" ] && [ ! -f "$ALN.bai" ] && [ ! -f "${ALN%.*}.crai" ] && [ ! -f "${ALN%.*}.bai" ]; then
  echo "No index. Building one (slow on a whole genome)..."
  "$SAMTOOLS" index "$ALN"
fi

"$BCFTOOLS" mpileup -f "$REF" -R "$POS" -a FORMAT/AD,FORMAT/DP -Ou "$ALN" \
  | "$BCFTOOLS" call -m -Oz -o "$OUT"
"$BCFTOOLS" index -f "$OUT"

echo "Genotypes in $OUT"
echo "Check the depth (DP): a position with low DP (< 10) is a weak read, treat it as 'to be confirmed'."
echo "Positions with no reads at all do not appear in the output."
