#!/bin/bash

# Directory containing the fastq files
fastq_dir=""

# Output directory for the assembly results
output_dir="../results_megahit"

# Create the main output directory if it doesn't exist
mkdir -p "$output_dir"

# Change to the directory containing the fastq files
cd $fastq_dir

# Loop through all the fastq files and run megahit for each pair
for file in *_1.trim.fastq.gz
do
    # Get the base name of the file (without extension)
    base=$(basename $file _1.trim.fastq.gz)
    
    # Create the specific output directory for this pair of files
    output_subdir="$output_dir/assembly_$base"
    
    # Remove the output directory if it already exists
    rm -rf "$output_subdir"
    
    # Run megahit for this pair of files
    megahit -1 "${base}_1.trim.fastq.gz" -2 "${base}_2.trim.fastq.gz" -o "$output_subdir"
done
