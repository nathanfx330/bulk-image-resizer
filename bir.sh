#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "ImageMagick is not installed. Install it with: sudo apt install imagemagick"
    exit 1
fi

# Get the script directory
DIR="$(dirname "$0")"
cd "$DIR" || exit 1

# Process images
find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.bmp" -o -iname "*.tif" -o -iname "*.tiff" \) | while read -r img; do
    echo "Resizing: $img"
    convert "$img" -resize 50% "$img"
done

echo "All images resized successfully."
