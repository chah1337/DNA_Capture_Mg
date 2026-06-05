# Comparison of Four Mycoplasma genitalium Typing Methods

## Overview

This repository contains the data, phylogenetic trees, and R scripts used to compare four molecular typing methods for *Mycoplasma genitalium*:

* **hMy-MLST**
* **mgpB typing**
* **cgMLST**
* **Whole-genome SNP typing (wgSNP)**

The objective is to evaluate the concordance and discrimination of these approaches by comparing their phylogenetic topologies using Robinson–Foulds (RF) and Kendall–Colijn (KC) distances.

## Repository Structure

```text
.
├── comp4trees.R
├── Data/
│   ├── cg_MLST.fasta
│   ├── cg_MLST_aligned.fasta
│   ├── hMy_MLST.fasta
│   ├── hMy_MLST_aligned.fasta
│   ├── mgpB.fasta
│   ├── mgpB_aligned.fasta
│   ├── wg_SNP.fasta
│   ├── wg_SNP_aligned.fasta
│   └── wg_SNP_only.fasta
│
├── Trees/
│   ├── *.raxml.bestTree
│   ├── *.raxml.support
│   ├── *.raxml.bootstraps
│   └── additional RAxML-NG output files
│
├── Results/
│   ├── RF_distance_matrix.csv
│   ├── KC_distance_matrix.csv
│   ├── RF_distance_heatmap.png
│   ├── KC_distance_heatmap.png
│   └── RF_dendrogram.png
│
└── treesGeneration.sh
```

## Analysis Workflow

### 1. Sequence Alignment

Sequences were aligned independently for each typing method using MAFFT.

### 2. Phylogenetic Reconstruction

Maximum-likelihood phylogenetic trees were inferred using RAxML-NG.

### 3. Tree Comparison

The R script (`comp4trees.R`) performs:

* midpoint rooting of all trees
* Robinson–Foulds (RF) distance calculation
* Kendall–Colijn (KC) distance calculation
* hierarchical clustering of methods based on RF distances
* generation of heatmaps and dendrograms
* export of distance matrices

## Software Requirements

### External Software

| Software | Version |
| -------- | ------- |
| MAFFT    | 7.526   |
| RAxML-NG | 1.2.2   |

RAxML-NG system information:

* CPU: AMD Ryzen 9 PRO 7945 (12 cores)
* RAM: 61 GB

### R Environment

Tested with R ≥ 4.3.

Required packages:

```r
install.packages(c(
  "ape",
  "phangorn",
  "treespace",
  "pheatmap",
  "phytools"
))
```

## Reproducing the Analysis

### Generate phylogenetic trees

```bash
bash treesGeneration.sh
```

### Compare tree topologies

```r
source("comp4trees.R")
```

Results will be written to the `Results/` directory.

## Output Files

### Distance matrices

* `RF_distance_matrix.csv`

  * Robinson–Foulds distances between phylogenetic trees.

* `KC_distance_matrix.csv`

  * Kendall–Colijn distances between phylogenetic trees.

### Visualizations

* `RF_distance_heatmap.png`
* `KC_distance_heatmap.png`
* `RF_dendrogram.png`

These figures summarize the similarities and differences among the four typing methods.

## Citation

If you use this repository, please cite the associated publication and/or repository DOI.

## License

This project is distributed under the MIT License.

