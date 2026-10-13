#!/usr/bin/env bash
# Dossiê Vivo: cria um ambiente isolado com samtools, bcftools e htslib via micromamba, sem sudo.
#
# Uso:    bash setup-env.sh [pasta_do_ambiente]
# Padrão: ~/dossie-bio
# Precisa: bash, curl, tar com bzip2. Linux ou macOS. No Windows, rode dentro do WSL.
# Tempo:  alguns minutos, conforme a internet.
#
# Atenção: o caminho do ambiente não pode conter ":" (quebra ferramentas Java e alguns binários).
set -euo pipefail

ENV_DIR="${1:-$HOME/dossie-bio}"
case "$ENV_DIR" in
  *:*) echo "O caminho do ambiente não pode conter ':' -> $ENV_DIR" >&2; exit 1 ;;
esac

MM="$(command -v micromamba || true)"
if [ -z "$MM" ]; then
  case "$(uname -s)-$(uname -m)" in
    Linux-x86_64)  PLAT=linux-64 ;;
    Linux-aarch64) PLAT=linux-aarch64 ;;
    Darwin-arm64)  PLAT=osx-arm64 ;;
    Darwin-x86_64) PLAT=osx-64 ;;
    *) echo "Plataforma não suportada: $(uname -s)-$(uname -m). No Windows, use o WSL." >&2; exit 1 ;;
  esac
  mkdir -p "$HOME/.local/bin"
  echo "Baixando micromamba ($PLAT)..."
  curl -Ls "https://micro.mamba.pm/api/micromamba/$PLAT/latest" | tar -xj -C "$HOME/.local" bin/micromamba
  MM="$HOME/.local/bin/micromamba"
fi

echo "Criando ambiente em $ENV_DIR..."
"$MM" create -y -p "$ENV_DIR" -c conda-forge -c bioconda samtools bcftools htslib

"$ENV_DIR/bin/samtools" --version | head -1
"$ENV_DIR/bin/bcftools" --version | head -1
echo
echo "Pronto. Use $ENV_DIR/bin/samtools e $ENV_DIR/bin/bcftools"
echo "ou passe esses caminhos como último argumento dos outros scripts."
