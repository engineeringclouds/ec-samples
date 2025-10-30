#!/usr/bin/env bash
set -euo pipefail

echo "[info] Running repository checks..."

declare -a shell_files
while IFS= read -r -d '' file; do
  shell_files+=("$file")
done < <(find samples templates tools -type f -name '*.sh' -print0 2>/dev/null)

for file in "${shell_files[@]}"; do
  echo "[lint] bash -n $file"
  bash -n "$file"
done

echo "[info] Checks complete. Add additional tooling as the repository matures."
