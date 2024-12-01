#!/bin/zsh

INPUT_DIR="/home/belvis/stuff/godot/railway/assets/suitcase/big_test_images/test_img"
OUTPUT_DIR="/home/belvis/stuff/godot/railway/assets/suitcase/big_test_images"

cd $INPUT_DIR
for image in *; do
  filename=${image%%.*}
  magick "$image" -resize 60x60 "$OUTPUT_DIR/$filename".png
done

echo ""
echo "done!!"
