# Data Processing and Visualization for Metagenomics / Procesamiento y Visualización de Datos para Metagenómica

This repository contains the final project for the subject of Statistics for the Microbiome. The goal of this project was to process and visualize metagenomic data using various bioinformatics tools and techniques. The genomic data sequences used for this project are stored in the file `sequences.txt`.

Este repositorio contiene el proyecto final para la materia de Estadística para el Microbioma. El objetivo de este proyecto fue procesar y visualizar datos metagenómicos utilizando diversas herramientas y técnicas de bioinformática. Las secuencias de datos genómicos utilizadas para este proyecto se encuentran en el archivo `sequences.txt`.

---

## Project Overview / Resumen del Proyecto

This project follows the guide provided by [Metagenomics Analysis - Carpentries Lab](https://carpentries-lab.github.io/metagenomics-analysis/). The workflow includes preprocessing, assembly, taxonomic assignment, and visualization of metagenomic data. Below is a detailed description of each step.

Este proyecto sigue la guía proporcionada por [Metagenomics Analysis - Carpentries Lab](https://carpentries-lab.github.io/metagenomics-analysis/). El flujo de trabajo incluye preprocesamiento, ensamblaje, asignación taxonómica y visualización de datos metagenómicos. A continuación se describe cada paso en detalle.

---

## Workflow / Flujo de Trabajo

### 1. Preprocessing / Preprocesamiento

All sequences were downloaded from NCBI. The dataset included single-end reads (e.g., `ERR210598.fastq.gz`), paired-end reads (e.g., `SRR5383391_1.fastq.gz` and `SRR5383391_2.fastq.gz`), and sequences with both. To optimize storage, single-end reads were removed from sequences that contained both types.

Todas las secuencias se descargaron de NCBI. El conjunto de datos incluía lecturas de extremo único (single-end, por ejemplo, `ERR210598.fastq.gz`), lecturas de extremo pareado (paired-end, por ejemplo, `SRR5383391_1.fastq.gz` y `SRR5383391_2.fastq.gz`) y secuencias con ambos tipos. Para optimizar el almacenamiento, se eliminaron las lecturas de extremo único de las secuencias que contenían ambos tipos.

#### Tools Used / Herramientas Utilizadas
- **Bash scripts**: 
  - `separador.sh`: Separates files into two folders: `archivos_guion` (for files with "_1" or "_2") and `archivos_no_guion` (for remaining files).
  - `salvar_lista.sh`: Creates a list of unique file names without extensions and "_1" or "_2" endings.
  - `checar_no_guion.sh`: Checks files in `archivos_no_guion` against the list in `lista.txt` and moves unmatched files to `archivos_guion`.
- **Trimmomatic**: Used for trimming and filtering low-quality reads.
  - `trim.sh`: Processes paired-end reads.
  - `trim_2.sh`: Processes single-end reads.

After trimming, the output files were:
- `.trim.fastq.gz`: High-quality reads suitable for further analysis.
- `un.trim.fastq.gz`: Low-quality reads that were discarded.

---

### 2. Read Quality Analysis / Análisis de Calidad de Lecturas

**FastQC** was used to evaluate the quality of the trimmed sequences. For each input file, FastQC generated a `.zip` file and a `.html` file. The `summary.txt` files from each `.zip` file were concatenated into a single file named `fastqc_summaries.txt`.

**FastQC** se utilizó para evaluar la calidad de las secuencias recortadas. Para cada archivo de entrada, FastQC generó un archivo `.zip` y un archivo `.html`. Los archivos `summary.txt` de cada `.zip` se concatenaron en un solo archivo llamado `fastqc_summaries.txt`.

#### Results / Resultados
- Most metrics evaluated by FastQC had a "PASS" status, indicating that the sequences were of good quality and suitable for further analysis.
- La mayoría de las métricas evaluadas por FastQC tuvieron un estado "PASS", lo que indica que las secuencias eran de buena calidad y adecuadas para análisis posteriores.

---

### 3. Assembly / Ensamblaje

Two programs were used for the assembly process:
- **MetaSPAdes**: Used for single-end reads due to limited processing power.
- **MEGAHIT**: Used for paired-end reads, as it is more efficient for larger datasets.

Se utilizaron dos programas para el proceso de ensamblaje:
- **MetaSPAdes**: Se utilizó para lecturas de extremo único debido a la limitación de recursos de procesamiento.
- **MEGAHIT**: Se utilizó para lecturas de extremo pareado, ya que es más eficiente para conjuntos de datos más grandes.

---

### 4. Taxonomic Assignment / Asignación Taxonómica

For taxonomic assignment, the **Kraken** program was used. Two Bash scripts were created:
- `kraken.sh`: Processes paired-end reads.
- `kraken_2.sh`: Processes single-end reads.

The input files were the trimmed reads obtained from Trimmomatic (files ending with `.trim.fastq.gz`). The results were visualized using **Pavian**, a tool for comparing multiple samples.

Para la asignación taxonómica, se utilizó el programa **Kraken**. Se crearon dos scripts en Bash:
- `kraken.sh`: Procesa lecturas de extremo pareado.
- `kraken_2.sh`: Procesa lecturas de extremo único.

Los archivos de entrada fueron las lecturas recortadas obtenidas de Trimmomatic (archivos que terminan en `.trim.fastq.gz`). Los resultados se visualizaron utilizando **Pavian**, una herramienta para comparar múltiples muestras.

---

### 5. Exploring Taxonomy / Exploración Taxonómica

Using the `kraken-biom` program, a BIOM format table named `cuatroc.biom` was created. This table contains taxonomic abundances for each sample, with rows representing taxa and columns representing samples.

Utilizando el programa `kraken-biom`, se creó una tabla en formato BIOM llamada `cuatroc.biom`. Esta tabla contiene las abundancias taxonómicas para cada muestra, con filas que representan taxones y columnas que representan muestras.

#### Visualizations / Visualizaciones
- **Alpha Diversity**: Observed OTUs, Chao1, and Shannon indices were calculated. The results showed significant variation in species richness and evenness across samples.
- **Beta Diversity**: An NMDS plot revealed considerable variation in species composition, with some clustering observed.
- **Absolute Abundance**: Acidobacteria was the most abundant phylum.
- **Relative Abundance**: Actinobacteria and Bacteroidetes were the dominant phyla, each constituting around 30-35% of the bacterial community.

---

## Repository Structure / Estructura del Repositorio

- **sequences.txt**: Contains the genomic data sequences used in this project.
- **Preprocessing/**: Contains scripts and results for sequence preprocessing.
- **Read_Quality/**: Contains FastQC results and summaries.
- **Assembly/**: Contains assembly results using MetaSPAdes and MEGAHIT.
- **Taxonomic_Assignment/**: Contains Kraken results and Pavian visualizations.
- **Exploring_Taxonomy/**: Contains BIOM tables and diversity plots.

---
