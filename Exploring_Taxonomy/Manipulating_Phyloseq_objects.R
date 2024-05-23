# Load required packages
library("phyloseq")  # Load phyloseq package for analyzing metagenomic data
library("ggplot2")   # Load ggplot2 package for creating plots
library("RColorBrewer")  # Load RColorBrewer package for color palettes
library("patchwork")  # Load patchwork package for combining plots

# Set the working directory to the location of the taxonomic data files
setwd("~/Camda2024/TAXONOMY_READS")

# Create a phyloseq object by importing the BIOM file
merged_metagenomes <- import_biom("cuatroc.biom")

# View the taxonomic labels data in the phyloseq object
View(merged_metagenomes@tax_table@.Data)

# Remove unnecessary characters from the taxonomic labels
merged_metagenomes@tax_table@.Data <- substring(merged_metagenomes@tax_table@.Data, 4)

# Assign informative names to the columns of the taxonomic labels data
colnames(merged_metagenomes@tax_table@.Data)<- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species")

# Explore the unique phyla in the taxonomic labels
unique(merged_metagenomes@tax_table@.Data[,"Phylum"])

# Count the number of OTUs assigned to the phylum Actinobacteria
sum(merged_metagenomes@tax_table@.Data[,"Phylum"] == "Actinobacteria")

# View the abundance table in the phyloseq object
View(merged_metagenomes@otu_table@.Data)

# Explore the unique families in the taxonomic labels
unique(merged_metagenomes@tax_table@.Data[,"Family"])
