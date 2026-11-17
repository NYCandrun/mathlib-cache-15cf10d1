#!/usr/bin/env bash
# restore.sh -- rebuild the Mathlib cache (15cf10d19dfd4cdee9602318e271fa3ce99c454d, 9,116 .ltar files) from the 5 tar parts
# in this folder. Usage: bash restore.sh [CACHE_PARENT]   (default $HOME/.cache -> files land in $HOME/.cache/mathlib)
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; DEST="${1:-$HOME/.cache}"
(cd "$HERE" && sha256sum -c --quiet SHA256SUMS)
mkdir -p "$DEST"
for i in 1 2 3 4 5; do tar -xf "$HERE/mathlib-15cf10d1-cache-part$i-of-5.tar" -C "$DEST"; done
(cd "$DEST/mathlib" && sha256sum -c --quiet "$HERE/SHA256SUMS-ltar.txt")
echo "OK: $(ls "$DEST/mathlib" | wc -l) cache files in $DEST/mathlib"
echo "next: cd <project pinned to Mathlib 15cf10d1> && lake exe cache get && lake build"
