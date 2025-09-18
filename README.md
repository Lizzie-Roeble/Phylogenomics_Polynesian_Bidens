# Polynesian _Bidens_ Phylogenomics Pipeline

Welcome to the Polynesian _Bidens_ phylogenomics repository! This project focuses on understanding the evolution, systematics, and biogeographic history of the  _Bidens_ radiation across the Pacific islands.

The Pacific _Bidens_ are a striking example of adaptive radiation in island plants. Across the remote Hawaiian, Marquesas, Society, and Austral Islands, this group has diversified into one of the largest plant radiations in Polynesia, with 42 described species. Each island harbors unique species shaped by local environments, from the corkscrew-shaped achenes of _Bidens torta_, reflecting a loss of dispersal, to the spectacular bird-pollinated capitula of _Bidens cosmoides_. Hawaiian _Bidens_ in particular have one of the highest documented rates of plant speciation per unit area. The Pacific _Bidens_ are an ideal system for exploring the processes that drive island evolution and diversification.

Building on previous phylogenetic studies of Polynesian Bidens (Knope et al., [2012](https://doi.org/10.1111/j.1365-2699.2012.02687.x); Knope et al., [2020a](https://doi.org/10.1093/jhered/esz066), [2020b](https://doi.org/10.1111/jse.12704)), we are currently generating a target capture (Hyb-Seq) phylogeny for the group. This repository provides a fully commented, step-by-step pipeline for processing the pilot Hyb-Seq data, with the goal of making the workflow transparent, reproducible, and accessible for researchers interested in plant phylogenomics.

## What’s in this repository

Scripts: Helper scripts for running the pipeline from raw sequences to alignments and phylogenetic inference.

[Resources](https://github.com/Lizzie-Roeble/Phylogenomics_Polynesian_Bidens/tree/main/resources): Sample namelists and cleaned target files to get started with the pipeline.

[Wiki](https://github.com/Lizzie-Roeble/Phylogenomics_Polynesian_Bidens/wiki/Target-Capture-Bioinformatics): Detailed step-by-step guide explaining the pipeline, software setup, project structure, and analysis workflow.


## The pipeline demonstrates how to:

* Process raw sequencing data (trimming, QC).

* Run HybPiper to recover target genes and identify paralogs.

* Resolve paralogy and build high-quality alignments.

* Infer gene trees and species trees for coalescent-based phylogenetic analyses.

<p align="center">
  <img src="https://github.com/user-attachments/assets/0ca11010-9f24-4dd9-8a66-7e70c81c8283" alt="Bidens_cosmoides-bw" style="width:400px;"/>
</p>
