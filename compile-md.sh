#!/bin/bash

# ======= CONFIG =======


# ======================

# Convert all .md files recursively to .html
find . -name '*.md' -exec bash -c '
for mdfile; do
  htmlfile="${mdfile%.md}.html"
  title=$(head -n 1 "$mdfile" | sed "s/^# //")
  temp_md="$(mktemp --suffix=".md")"
  awk "BEGIN{found=0} /^# / && found==0 {found=1; next} {print}" "$mdfile" > "$temp_md"

  pandoc "$temp_md" --standalone \
    --css "https://cdn.jsdelivr.net/npm/water.css@2/out/light.css" \
    --metadata title="$title" \
    -o "$htmlfile"
  rm "$temp_md"
  echo "✔ Converted: $mdfile → $htmlfile"
done
' bash {} +

#--include-in-header="$HEADER_FILE" \
#   title=$(head -n 1 "$mdfile" | sed "s/^# //")
#     --metadata title="$title" \
