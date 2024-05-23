#First run Bacterial_Diversity_Analysis_using_Phyloseq.R
# Group the data at the phylum level using the tax_glom() function
percentages_glom <- tax_glom(percentages, taxrank = 'Phylum')

# View the taxonomic data table after agglomeration
View(percentages_glom@tax_table@.Data)

# Convert the percentages_glom object into a data frame using the psmelt() function
percentages_df <- psmelt(percentages_glom)

# Check the structure of the percentages_df data frame
str(percentages_df)

# Group the absolute abundance data at the phylum level
absolute_glom <- tax_glom(physeq = merged_metagenomes, taxrank = "Phylum")

# Convert the absolute_glom object into a data frame
absolute_df <- psmelt(absolute_glom)

# Check the structure of the absolute_df data frame
str(absolute_df)

# Convert the Phylum column of the absolute_df data frame into a factor
absolute_df$Phylum <- as.factor(absolute_df$Phylum)

# Create a color palette for the phyla in the absolute_df data frame
phylum_colors_abs<- colorRampPalette(brewer.pal(8,"Dark2")) (length(levels(absolute_df$Phylum)))

# Create a stacked bar plot to visualize the absolute abundance by phylum and sample
absolute_plot <- ggplot(data= absolute_df, aes(x=Sample, y=Abundance, fill=Phylum))+
  geom_bar(aes(), stat="identity", position="stack")+
  scale_fill_manual(values = phylum_colors_abs)

# Convert the Phylum column of the percentages_df data frame into a factor
percentages_df$Phylum <- as.factor(percentages_df$Phylum)

# Create a color palette for the phyla in the percentages_df data frame
phylum_colors_rel<- colorRampPalette(brewer.pal(8,"Dark2")) (length(levels(percentages_df$Phylum)))

# Create a stacked bar plot to visualize the relative abundance by phylum and sample
relative_plot <- ggplot(data=percentages_df, aes(x=Sample, y=Abundance, fill=Phylum))+
  geom_bar(aes(), stat="identity", position="stack")+
  scale_fill_manual(values = phylum_colors_rel)

# Display the absolute and relative abundance plots
absolute_plot
relative_plot

# Convert the Phylum column of the percentages_df data frame into characters
percentages_df$Phylum <- as.character(percentages_df$Phylum)

# Group phyla with relative abundance less than 0.5% into a single category
percentages_df$Phylum[percentages_df$Abundance < 0.5] <- "Phyla < 0.5% abund."

# View the unique phyla in the percentages_df data frame after grouping
unique(percentages_df$Phylum)

# Convert the Phylum column of the percentages_df data frame into a factor
percentages_df$Phylum <- as.factor(percentages_df$Phylum)

# Update the color palette for the phyla in the percentages_df data frame
phylum_colors_rel<- colorRampPalette(brewer.pal(8,"Dark2")) (length(levels(percentages_df$Phylum)))

# Update the stacked bar plot to visualize the relative abundance by phylum and sample
relative_plot <- ggplot(data=percentages_df, aes(x=Sample, y=Abundance, fill=Phylum))+
  geom_bar(aes(), stat="identity", position="stack")+
  scale_fill_manual(values = phylum_colors_rel)

# Display the updated relative abundance plot
relative_plot

# Filter cyanobacteria (Cyanobacteria) from the merged_metagenomes object
cyanos <- subset_taxa(merged_metagenomes, Phylum == "Cyanobacteria")

# View the unique phyla in the cyanos object
unique(cyanos@tax_table@.Data[,2])

# Transform the cyanobacteria counts to percentages
cyanos_percentages <- transform_sample_counts(cyanos, function(x) x*100 / sum(x) )

# Group cyanobacteria at the genus level
cyanos_glom <- tax_glom(cyanos_percentages, taxrank = "Genus")

# Convert the cyanos_glom object into a data frame
cyanos_df <- psmelt(cyanos_glom)

# Group genera with relative abundance less than 10% into a single category
cyanos_df$Genus[cyanos_df$Abundance < 10] <- "Genera < 10.0 abund"

# Convert the Genus column of the cyanos_df data frame into a factor
cyanos_df$Genus <- as.factor(cyanos_df$Genus)

# Create a color palette for the cyanobacteria genera
genus_colors_cyanos<- colorRampPalette(brewer.pal(8,"Dark2")) (length(levels(cyanos_df$Genus)))

# Create a stacked bar plot to visualize the relative abundance of cyanobacteria genera by sample
plot_cyanos <- ggplot(data=cyanos_df, aes(x=Sample, y=Abundance, fill=Genus))+
  geom_bar(aes(), stat="identity", position="stack")+
  scale_fill_manual(values = genus_colors_cyanos)

# Display the relative abundance plot of cyanobacteria genera
plot_cyanos
