#!/usr/bin/env bash
# Dossiê Vivo: kit pequeno de re-análise. VCF limpo comprimido, índice e checksums,
# pra você não depender do arquivo gigante (CRAM) no futuro.
#
# Uso:   bash reanalysis-kit.sh variantes.vcf[.gz] pasta_de_saida [caminho_do_bcftools]
# A leitura completa do VCF também valida o arquivo: erro aqui costuma indicar arquivo corrompido.
set -euo pipefail

VCF="${1:?arquivo .vcf ou .vcf.gz}"
OUTDIR="${2:?pasta de saída}"
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

echo "Kit em $OUTDIR: $n variantes, índice e MD5SUMS.txt."
echo "Guarde junto um README com o build da referência e a data da análise."
