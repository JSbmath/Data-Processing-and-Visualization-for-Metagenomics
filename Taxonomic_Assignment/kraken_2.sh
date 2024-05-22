#!/bin/bash

# Output directory for kraken2 results
output_dir="TAXONOMY_READS_1"

# Create the output directory if it doesn't exist
mkdir -p $output_dir

# Loop through all the fastq files and run kraken2 for each single-end file
for file in *.trim.fastq.gz
do
    # Get the base name of the file (without extension)
    base=$(basename $file .trim.fastq.gz)

    # Run kraken2 for this single-end file
    kraken2 --db /files/db_kraken2 --threads 4 $file --output $output_dir/$base.kraken --report $output_dir/$base.report
done
