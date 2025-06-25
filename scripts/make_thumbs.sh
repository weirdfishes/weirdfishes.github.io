#!/bin/bash

set -e

GALLERY_PATH="assets/img/galleries"

for dir in "$GALLERY_PATH"/*/full; do
  [ -d "$dir" ] || continue
  gallery=$(basename "$(dirname "$dir")")
  thumb_dir="$GALLERY_PATH/$gallery/thumbs"
  mkdir -p "$thumb_dir"

  echo "Generating thumbnails for $gallery..."

  for ext in jpg jpeg JPG JPEG; do
    # Check for matching files before calling mogrify
    shopt -s nullglob
    files=("$dir"/*.$ext)
    shopt -u nullglob

    if [ ${#files[@]} -gt 0 ]; then
      mogrify -path "$thumb_dir" -resize 300x300^ -gravity center -extent 300x300 "${files[@]}"
    fi
  done
done

echo "✅ Thumbnails generated."