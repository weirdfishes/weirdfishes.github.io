#!/bin/bash

set -e

GALLERY_PATH="assets/img/galleries"

for dir in "$GALLERY_PATH"/*/full; do
  [ -d "$dir" ] || continue
  gallery=$(basename "$(dirname "$dir")")
  thumb_dir="$GALLERY_PATH/$gallery/thumbs"
  mkdir -p "$thumb_dir"
  mogrify -path "$thumb_dir" -resize 300x300^ -gravity center -extent 300x300 "$dir"/*.jpg
done

echo "Thumbnails generated."
