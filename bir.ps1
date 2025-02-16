# Check if ImageMagick is installed (using 'magick')
$magickPath = Get-Command magick -ErrorAction SilentlyContinue
if (-not $magickPath) {
    Write-Host "ImageMagick is not installed. Install it with: choco install imagemagick"
    exit 1
}

# Define the X resolution (set this to your desired width in pixels)
$xResolution = 1500  # Set X resolution to 1500 pixels (width)
$resizePercentage = 50  # Set percentage for resizing (e.g., 50%)

# Get the script directory
$DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -Path $DIR

# Ask user for resize option
$resizeOption = Read-Host "Do you want to resize by (1) Percentage or (2) Fixed Width? (Enter 1 or 2)"

# Process images
Get-ChildItem -Recurse -File -Include *.jpg, *.jpeg, *.png, *.bmp, *.tif, *.tiff | ForEach-Object {
    $img = $_.FullName
    Write-Host "Processing: $img"
    
    if ($resizeOption -eq "1") {
        # Resize by percentage
        Write-Host "Resizing by $resizePercentage%"
        & magick $img -resize ${resizePercentage}% -comment "Resized by $resizePercentage%" $img
    } elseif ($resizeOption -eq "2") {
        # Resize by fixed width (xResolution), maintaining aspect ratio for Y
        Write-Host "Resizing to X=$xResolution pixels width"
        & magick $img -resize ${xResolution}x -comment "Resized to X=$xResolution pixels width" $img
    } else {
        Write-Host "Invalid option. Skipping image."
    }
}

Write-Host "All images processed successfully."
