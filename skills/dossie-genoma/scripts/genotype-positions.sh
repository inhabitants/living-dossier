#!/usr/bin/env bash
# Dossiê Vivo: genotipa só as posições de interesse direto do CRAM/BAM, sem varrer o arquivo inteiro.
#
# Uso:
#   bash genotype-positions.sh arquivo.cram referencia.fa posicoes.tsv saida.vcf.gz [bcftools] [samtools]
#
# posicoes.tsv: CHROM<TAB>POS (1-based), uma por linha, com o mesmo padrão de nome da referência
#               (chr1 ou 1). Converta rsID em coordenada no build certo antes (Ensembl, dbSNP).
#
# Usa -R (regiões pelo índice): pula direto pras posições. Nunca troque por -T num CRAM grande,
# que lê o arquivo inteiro. Precisa do índice (.crai/.bai); sem ele, o script cria (pode levar ~1 h em 30x).
set -euo pipefail

ALN="${1:?arquivo .cram/.bam}"
REF="${2:?referencia .fa (com .fai)}"
POS="${3:?posicoes.tsv}"
OUT="${4:?saida.vcf.gz}"
BCFTOOLS="${5:-bcftools}"
SAMTOOLS="${6:-samtools}"

if [ ! -f "$REF.fai" ]; then
  echo "Indexando a referência..."
  "$SAMTOOLS" faidx "$REF"
fi

if [ ! -f "$ALN.crai" ] && [ ! -f "$ALN.bai" ] && [ ! -f "${ALN%.*}.crai" ] && [ ! -f "${ALN%.*}.bai" ]; then
  echo "Sem índice. Criando (demorado em genoma completo)..."
  "$SAMTOOLS" index "$ALN"
fi

"$BCFTOOLS" mpileup -f "$REF" -R "$POS" -a FORMAT/AD,FORMAT/DP -Ou "$ALN" \
  | "$BCFTOOLS" call -m -Oz -o "$OUT"
"$BCFTOOLS" index -f "$OUT"

echo "Genótipos em $OUT"
echo "Confira a profundidade (DP): posição com DP baixo (< 10) é leitura fraca, trate como 'a confirmar'."
echo "Posição sem nenhuma leitura não aparece na saída."
