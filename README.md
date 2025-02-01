# Image Resizer Script

This BASH script uses ImageMagick to resize images in a directory and its subdirectories. It supports multiple image formats and resizes each image to 50% (by default) of its original size while preserving the original filenames.

## Prerequisites

- **ImageMagick** must be installed. You can install it on Linux with the following command:

  ```bash
  sudo apt install imagemagick

Installation

    Clone the repository to your local machine: https://github.com/nathanfx330/bulk-image-resizer.git

Navigate to the project directory:

    cd bulk-image-resizer

Usage

    Place the script (resize_images.sh) in the root directory containing your images or in a directory above.

    Run the script using:

    bash resize_images.sh

    The script will search for image files with the following extensions:
    .jpg, .jpeg, .png, .bmp, .tif, .tiff.

    Each image will be resized to 50% of its original size.

Notes

    The script uses the mogrify command, which modifies the original files. Make sure to back up your images if you need to keep the original versions.
    The script works recursively, so it will resize images in the current directory and any subdirectories.

License

This project is licensed under the MIT License - see the LICENSE file for details.

