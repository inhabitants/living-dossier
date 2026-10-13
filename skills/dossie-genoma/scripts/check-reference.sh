#!/usr/bin/env bash
# Dossiê Vivo: mostra qual referência um CRAM/BAM espera, pra você baixar exatamente a certa.
#
# Uso:   bash check-reference.sh arquivo.cram [caminho_do_samtools]
# Ler o cabeçalho não precisa da referência e leva segundos.
set -euo pipefail

ALN="${1:?Informe o arquivo .cram ou .bam}"
SAMTOOLS="${2:-samtools}"

HEADER="$("$SAMTOOLS" view -H "$ALN")"

echo "== Primeiras sequências (@SQ):"
printf '%s\n' "$HEADER" | grep '^@SQ' | head -5

echo
echo "== Padrão de nome dos cromossomos:"
if printf '%s\n' "$HEADER" | grep -q $'^@SQ\tSN:chr1\t'; then
  echo "chr1, chr2... (estilo UCSC/GRCh38 'chr')"
else
  echo "1, 2... (estilo Ensembl/1000G, sem 'chr')"
fi

echo
echo "== Pistas de build no cabeçalho:"
printf '%s\n' "$HEADER" | grep -Eo 'GRCh3[78][^[:space:]]*|hg19|hg38|hs37d5|hs38[^[:space:]]*|GCA_[0-9.]+' | sort | uniq -c || echo "(nenhuma pista explícita)"

echo
echo "== MD5 (campo M5) do primeiro cromossomo:"
printf '%s\n' "$HEADER" | grep '^@SQ' | head -1 | grep -Eo 'M5:[0-9a-f]+' || echo "(sem campo M5)"
echo
echo "Baixe a referência com o mesmo build, o mesmo padrão de nome e, se houver M5, confira o MD5 da sequência."
