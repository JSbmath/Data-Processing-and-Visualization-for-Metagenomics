FastQC was used to perform a quality analysis using the sequences obtained as a result of running Trimmomatic.

After processing for each input file, FastQC created a .zip file and a .html file. 

Finally, each .zip file was decompressed, and each file named "summary.txt" from each .zip file was concatenated into a single file that we called "fastqc_summaries.txt".

fastqc_summaries.txt is a record of the results we obtained for all our samples.
