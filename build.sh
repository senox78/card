#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
output_dir=${OUTPUT_DIR:-"$script_dir/build"}

university=${UNIVERSITY:-}
university_email=${UNIVERSITY_EMAIL:-}

mkdir -p -- "$output_dir"

typst compile "$script_dir/card.typ" "$output_dir/front.pdf" \
  --root "$script_dir"

typst compile "$script_dir/back.typ" "$output_dir/back.pdf" \
  --root "$script_dir" \
  --input "university=$university" \
  --input "university-email=$university_email"

printf 'Built %s and %s\n' "$output_dir/front.pdf" "$output_dir/back.pdf"
