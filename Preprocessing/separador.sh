#!/bin/bash

# Create the destination folders if they don't exist
mkdir -p archivos_guion archivos_no_guion

# Move files matching the pattern to the archivos_guion folder
for file in *_[12].*; do
    mv "$file" archivos_guion/
done

# Move the remaining files to the archivos_no_guion folder
for file in *; do
    if [ ! -d "$file" ]; then
        mv "$file" archivos_no_guion/
    fi
done
