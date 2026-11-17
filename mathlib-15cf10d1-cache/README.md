# Prebuilt Mathlib cache for commit 15cf10d19dfd4cdee9602318e271fa3ce99c454d (5 tar parts)

The 9,116 `.ltar` files that `lake exe cache get` downloads from cache.mathlib.org for Mathlib `15cf10d1...`
(toolchain `leanprover/lean4:v4.36.0-rc2`), split into 5 plain (uncompressed) tar files under 100 MB each.
They unpack to the compiled `.olean` files (~6.8 GB), so Mathlib need not be built from source.

    bash restore.sh                       # checks the 5 parts, extracts to ~/.cache/mathlib, checks all 9,116 files
    cd <project> && lake exe cache get && lake build     # "No files to download", then unpack + build

Valid only for a project whose lake-manifest.json pins Mathlib to 15cf10d1. Still needed from the network: the Lean
toolchain and the git sources of Mathlib and its dependencies. `SHA256SUMS` covers the parts and the script;
`SHA256SUMS-ltar.txt` covers every cache file.
