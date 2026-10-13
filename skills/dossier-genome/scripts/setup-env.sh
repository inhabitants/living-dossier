#!/usr/bin/env bash
# Living Dossier: creates an isolated environment with samtools, bcftools and htslib via micromamba, no sudo.
#
# Usage:   bash setup-env.sh [environment_folder]
# Default: ~/dossier-bio
# Needs:   bash, curl, tar with bzip2. Linux or macOS. On Windows, run it inside WSL.
# Time:    a few minutes, depending on your connection.
#
# Note: the environment path must not contain ":" (it breaks Java tools and some binaries).
set -euo pipefail

ENV_DIR="${1:-$HOME/dossier-bio}"
case "$ENV_DIR" in
  *:*) echo "The environment path must not contain ':' -> $ENV_DIR" >&2; exit 1 ;;
esac

MM="$(command -v micromamba || true)"
if [ -z "$MM" ]; then
  case "$(uname -s)-$(uname -m)" in
    Linux-x86_64)  PLAT=linux-64 ;;
    Linux-aarch64) PLAT=linux-aarch64 ;;
    Darwin-arm64)  PLAT=osx-arm64 ;;
    Darwin-x86_64) PLAT=osx-64 ;;
    *) echo "Unsupported platform: $(uname -s)-$(uname -m). On Windows, use WSL." >&2; exit 1 ;;
  esac
  mkdir -p "$HOME/.local/bin"
  echo "Downloading micromamba ($PLAT)..."
  curl -Ls "https://micro.mamba.pm/api/micromamba/$PLAT/latest" | tar -xj -C "$HOME/.local" bin/micromamba
  MM="$HOME/.local/bin/micromamba"
fi

echo "Creating environment at $ENV_DIR..."
"$MM" create -y -p "$ENV_DIR" -c conda-forge -c bioconda samtools bcftools htslib

"$ENV_DIR/bin/samtools" --version | head -1
"$ENV_DIR/bin/bcftools" --version | head -1
echo
echo "Done. Use $ENV_DIR/bin/samtools and $ENV_DIR/bin/bcftools"
echo "or pass those paths as the last argument of the other scripts."
