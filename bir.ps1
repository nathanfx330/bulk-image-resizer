# Check if ImageMagick is installed (using 'magick')
$magickPath = Get-Command magick -ErrorAction SilentlyContinue
if (-not $magickPath) {
    Write-Host "ImageMagick is not installed. Install it with: choco install imagemagick"
    exit 1
}

# Get the script directory
$DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -Path $DIR

# Process images
Get-ChildItem -Recurse -File -Include *.jpg, *.jpeg, *.png, *.bmp, *.tif, *.tiff | ForEach-Object {
    $img = $_.FullName
    Write-Host "Resizing: $img"
    & magick $img -resize 50% $img
}

Write-Host "All images resized successfully."
