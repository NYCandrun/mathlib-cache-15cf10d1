# Prebuilt Mathlib cache for commit 15cf10d19dfd4cdee9602318e271fa3ce99c454d, in 50 + 1 zips

The 9,116 `.ltar` files that `lake exe cache get` downloads from cache.mathlib.org for Mathlib `15cf10d1...`
(Lean toolchain `leanprover/lean4:v4.36.0-rc2`). They unpack to the compiled `.olean` files (~6.8 GB).
Split into 50 data zips of under 10 MB plus this part 00 (README, checksums, `restore_mathlib_cache.sh`).

Put all 51 zips in one directory, then:

    unzip -o mathlib-15cf10d1-cache-00-of-50.zip
    bash mathlib-cache-part00/restore_mathlib_cache.sh .        # -> ~/.cache/mathlib, verified by checksum
    cd lean && lake exe cache get && lake build                  # "No files to download", then unpack + build

Still needed from the network: the Lean toolchain and the git sources of Mathlib and its dependencies (github.com).

## Getting this branch

Download the whole branch as one zip:
`https://github.com/NYCandrun/mathlib-cache-15cf10d1/archive/refs/heads/zip50.zip`
or clone only this branch: `git clone --depth 1 --single-branch -b zip50 https://github.com/NYCandrun/mathlib-cache-15cf10d1.git`

Check the parts with `sha256sum -c SHA256SUMS` before restoring. The same cache as 5 uncompressed tar parts is on
the `main` branch.
