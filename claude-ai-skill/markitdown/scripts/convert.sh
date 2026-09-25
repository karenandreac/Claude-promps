#!/bin/bash
# Usage: convert.sh <input-file> [output.md]
set -euo pipefail

in="$1"
out="${2:-/home/claude/converted/$(basename "$in").md}"
mkdir -p "$(dirname "$out")"

if ! python3 -c "import markitdown" >/dev/null 2>&1; then
  pip install --quiet 'markitdown[all]' >&2 || pip install --quiet --break-system-packages 'markitdown[all]' >&2
fi

python3 -m markitdown "$in" -o "$out"
echo "Markdown: $out"
echo "Size: $(wc -c < "$out") bytes, $(wc -l < "$out") lines (original: $(wc -c < "$in") bytes)"
