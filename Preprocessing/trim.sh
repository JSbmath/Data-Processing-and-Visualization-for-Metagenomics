#!/bin/bash
mkdir -p ~/Camda2024/trim
mkdir -p ~/Camda2024/utrim


for infile in ~/Camda2024/reads/paired/*_1.fastq.gz
do 
   base=$(basename ${infile} _1.fastq.gz)
   trimmomatic PE -threads 4  ~/Camda2024/reads/paired/${base}_1.fastq.gz \
   ~/Camda2024/reads/paired/${base}_2.fastq.gz \
   ~/Camda2024/trim/${base}_1.trim.fastq.gz ~/Camda2024/utrim/${base}_1un.trim.fastq.gz \
   ~/Camda2024/trim/${base}_2.trim.fastq.gz ${base}_2un.trim.fastq.gz \
SLIDINGWINDOW:4:20 MINLEN:35 ILLUMINACLIP:/files/camda2024/TruSeq3-PE.fa:2:40:15
done
