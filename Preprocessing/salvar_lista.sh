#!/bin/bash

# Create an empty file if it doesn't exist
touch lista.txt

# Loop through the files in the archivos_guion folder
for archivo in archivos_guion/*; do
    # Get the file name without extension and "_1" or "_2" ending
    nombre_archivo="$(basename "$archivo")"
    nombre_sin_extension="${nombre_archivo%_[12].*}"
    
    # Check if the name is already in the list
    grep -qx "$nombre_sin_extension" lista.txt || echo "$nombre_sin_extension" >> lista.txt
done
