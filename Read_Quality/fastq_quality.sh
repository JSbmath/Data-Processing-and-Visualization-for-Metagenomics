#!/bin/bash

# Ask the user for the path
read -p "Enter the folder path: " path

# Check if the folder exists
if [ ! -d "$path" ]; then
   echo "The folder $path does not exist."
   exit 1
fi

# Create the "Quality" folder if it doesn't exist
mkdir -p "$path/Quality"

# Run FastQC for all .fastq and .fastq.gz files in the folder
fastqc "$path"/*.fastq* -o "$path/Quality"
