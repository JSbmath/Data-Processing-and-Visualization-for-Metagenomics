#!/bin/bash

# Output directory for kraken2 results
output_dir="TAXONOMY_READS"

# Create the output directory if it doesn't exist
mkdir -p $output_dir

# Loop through all the fastq files and run kraken2 for each pair
for file in *_1.trim.fastq.gz
do
    # Get the base name of the file (without extension)
    base=$(basename $file _1.trim.fastq.gz)

    # Run kraken2 for this pair of files
    kraken2 --db /files/db_kraken2 --threads 4 --paired ${base}_1.trim.fastq.gz ${base}_2.trim.fastq.gz --output $output_dir/$base.kraken --report $output_dir/$base.report
done
