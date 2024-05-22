#!/bin/bash
mkdir -p ~/Camda2024/trim_single

for infile in ~/Camda2024/reads/single/*.fastq.gz
do
base=$(basename ${infile} .fastq.gz)
trimmomatic SE -threads 4 ~/Camda2024/reads/single/${base}.fastq.gz \
~/Camda2024/trim_single/${base}.trim.fastq.gz \
SLIDINGWINDOW:4:20 MINLEN:35 ILLUMINACLIP:/files/camda2024/TruSeq3-PE.fa:2:40:15
done
