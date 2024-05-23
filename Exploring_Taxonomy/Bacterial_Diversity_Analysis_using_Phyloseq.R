#first run Manipulating_Phyloseq_objects.R
# Subset the merged_metagenomes object to include only bacteria
merged_metagenomes <- subset_taxa(merged_metagenomes, Kingdom == "Bacteria")

# View the merged_metagenomes object
merged_metagenomes

# Calculate the total number of reads in each sample
sample_sums(merged_metagenomes)

# Plot alpha diversity measures (Observed, Chao1, Shannon) for the samples
plot_richness(physeq = merged_metagenomes,
              measures = c("Observed","Chao1","Shannon"))

# Subset the merged_metagenomes object to remove any OTUs with blank genus
merged_metagenomes <- subset_taxa(merged_metagenomes, Genus != "") #Only genus that are no blank

# Check for any remaining blank taxonomic assignments
summary(merged_metagenomes@tax_table@.Data== "")

# Convert the absolute abundances to relative abundances (percentages)
percentages <- transform_sample_counts(merged_metagenomes, function(x) x*100 / sum(x) )

# View the first few rows of the relative abundance table
head(percentages@otu_table@.Data)

# Perform beta diversity analysis using NMDS with Bray-Curtis distance
meta_ord <- ordinate(physeq = percentages, method = "NMDS",
                     distance = "bray")

# Plot the NMDS ordination results
plot_ordination(physeq = percentages, ordination = meta_ord)
