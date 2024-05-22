#!/bin/bash

# Directory containing the fastq files
fastq_dir=""

# Output directory for the assembly results
output_dir="../results_metaspades_single"

# Change to the directory containing the fastq files
#cd $fastq_dir

# Loop through all the fastq files and run metaspades for each pair
for file in *.trim.fastq.gz
do
    # Get the base name of the file (without extension)
    base=$(basename $file .trim.fastq.gz)
    
    # Create the specific output directory for this pair of files
    mkdir -p $output_dir/assembly_$base
    
    # Run metaspades for this pair of files
    metaspades.py --12 ${base}.trim.fastq.gz -o $output_dir/assembly_$base
done
