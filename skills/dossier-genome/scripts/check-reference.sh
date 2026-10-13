#!/usr/bin/env bash
# Living Dossier: shows which reference a CRAM/BAM expects, so you download exactly the right one.
#
# Usage: bash check-reference.sh file.cram [path_to_samtools]
# Reading the header does not need the reference and takes seconds.
set -euo pipefail

ALN="${1:?Give the .cram or .bam file}"
SAMTOOLS="${2:-samtools}"

HEADER="$("$SAMTOOLS" view -H "$ALN")"

echo "== First sequences (@SQ):"
printf '%s\n' "$HEADER" | grep '^@SQ' | head -5

echo
echo "== Chromosome naming:"
if printf '%s\n' "$HEADER" | grep -q $'^@SQ\tSN:chr1\t'; then
  echo "chr1, chr2... (UCSC/GRCh38 'chr' style)"
else
  echo "1, 2... (Ensembl/1000G style, no 'chr')"
fi

echo
echo "== Build hints in the header:"
printf '%s\n' "$HEADER" | grep -Eo 'GRCh3[78][^[:space:]]*|hg19|hg38|hs37d5|hs38[^[:space:]]*|GCA_[0-9.]+' | sort | uniq -c || echo "(no explicit hint)"

echo
echo "== MD5 (M5 field) of the first chromosome:"
printf '%s\n' "$HEADER" | grep '^@SQ' | head -1 | grep -Eo 'M5:[0-9a-f]+' || echo "(no M5 field)"
echo
echo "Download a reference with the same build and the same naming and, if there is an M5, check the sequence MD5."
