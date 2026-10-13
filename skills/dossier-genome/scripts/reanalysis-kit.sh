#!/usr/bin/env bash
# Living Dossier: a small re-analysis kit. Clean compressed VCF, index and checksums,
# so you do not depend on the giant file (CRAM) in the future.
#
# Usage: bash reanalysis-kit.sh variants.vcf[.gz] output_folder [path_to_bcftools]
# Reading the whole VCF also validates it: an error here usually means a corrupted file.
set -euo pipefail

VCF="${1:?.vcf or .vcf.gz file}"
OUTDIR="${2:?output folder}"
BCFTOOLS="${3:-bcftools}"

mkdir -p "$OUTDIR"
base="$(basename "$VCF")"
base="${base%.gz}"
base="${base%.vcf}"
CLEAN="$OUTDIR/$base.clean.vcf.gz"

"$BCFTOOLS" view "$VCF" -Oz -o "$CLEAN"
"$BCFTOOLS" index -t -f "$CLEAN"
n="$("$BCFTOOLS" view -H "$CLEAN" | wc -l | tr -d ' ')"

(
  cd "$OUTDIR"
  if command -v md5sum >/dev/null 2>&1; then
    md5sum ./*.vcf.gz ./*.tbi > MD5SUMS.txt
  else
    md5 -r ./*.vcf.gz ./*.tbi > MD5SUMS.txt
  fi
)

echo "Kit in $OUTDIR: $n variants, index and MD5SUMS.txt."
echo "Keep a README next to it with the reference build and the analysis date."
