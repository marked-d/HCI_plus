#!/bin/bash

indir=./markdown
outdir=./converted_files

mkdir -p $outdir

read -p "Enter input filename (with .md extension): " input_file

echo "Select output format:"
echo "1) EPUB (e-book)"
echo "2) HTML"
echo "3) Microsoft Word (.docx)"
echo "4) OpenOffice/LibreOffice (.odt)"

read -p "Enter number of desired format: " output_format

for f in $indir/*.md
do
  if [[ "$output_format" == "1" ]]; then
    pandoc $f -s -o $outdir/$(basename $f .md).epub  --quiet 
  elif [[ "$output_format" == "2" ]]; then
    pandoc $f -s -o $outdir/$(basename $f .md).html  --quiet
  elif [[ "$output_format" == "3" ]]; then
    pandoc $f -s -o $outdir/$(basename $f .md).docx --extract-media=.
  elif [[ "$output_format" == "4" ]]; then
    pandoc $f -s -o $outdir/$(basename $f .md).odt 
  else
    echo "Error: Invalid output format selected."
    exit 1
  fi
done