#!/bin/bash

# Function to get the name without extension
get_nombre_sin_extension() {
    local nombre_archivo="$(basename "$1")"
    local nombre_sin_extension="${nombre_archivo%%.*}"
    echo "$nombre_sin_extension"
}

# Loop through the files in the archivos_no_guion folder
for archivo in archivos_no_guion/*; do
    # Get the file name without extension
    nombre_sin_extension="$(get_nombre_sin_extension "$archivo")"
    
    # Check if the name is in the list
    if ! grep -qx "$nombre_sin_extension" lista.txt; then
        echo "$nombre_sin_extension"
        mv "$archivo" archivos_guion/
    fi
done
