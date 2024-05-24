For Taxonomic assignment of metagenomic reads, we used the Kraken program. To achieve this, we created two Bash scripts: one that takes as input the files with paired-end reads (kraken.sh), and another that takes as input the files with single-end reads (kraken_2.sh). It is worth noting that the input files were not the ones obtained after the assembly process, but rather the ones obtained from the Trimmomatic program (ending with .trim.fastq.gz).

Finally we used Pavian with our results. Pavian is a visualization tool that allows comparison between multiple samples.
