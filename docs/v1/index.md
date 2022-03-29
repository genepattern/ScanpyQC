# ScanpyQC Documentation

<b>Description: </b> Create Scanpy Quality Control Plots to enable unblinded dataset filtering with ScanpyUtilities. This module can be run both before and after the ScanpyUtilities module to determine which filtering thresholds to apply in ScanpyUtilities as well as to determine the outcome of this filtering.

<b>Author(s): </b> Wrapped as a module by Anthony S. Castanza, Mesirov Lab, UCSD School of Medicine

<b>Contact: </b> Module specific issues: [https://genepattern.org/help](https://genepattern.org/help)

## References

- [Wolf, A.F., et al. (2018). SCANPY: large-scale single-cell gene expression data analysis. Genome Biology. 19:15](https://rdcu.be/cJ6nC)

- [Lun, A.T.L., et al. (2016). A step-by-step workflow for low-level analysis of single-cell RNA-seq data with Bioconductor. F1000Res., 5, 2122.](https://doi.org/10.12688/f1000research.9501.2)

- [https://github.com/theislab/scanpy/tree/1.3.3](https://github.com/theislab/scanpy/tree/1.3.3)

## Parameters:

| Name             | Description                                                                                                                                                                                                                                                                                           |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| data file*       | A file containing single-cell data. h5ad, loom and mtx file formats are accepted. A 10x formatted hdf5 file may also be provided along with the 'genome' argument. The file will be internally converted to an h5ad file before proceeding.                                                           |
| mtGenes          | <i>Optional.</i> A file containing a list of the gene ids for mitochondrial genes. Used for annotating mitochondrial genes so percent abundance can be calculated and downstream filtering applied. If a dataset already has mitochondrial genes annotated under .var['mt'] this file can be skipped. |
| output basename* | Base filename used for labeling output files. Default = <data.file_basename>                                                                                                                                                                                                                          |
| genome           | <i> <b>Only</b> used for 10x formatted HDF5 files.</i> When converting a 10x formatted HDF5 file, the module will internally call read_10x_h5 from the scanpy package. This function expects a genome argument which specifies the name of the data set in the HDF5 file. e.g. 'GRCh38'.              |
 *required

## Output Files

<p> Several plots each containing multiple components are produced.

| Output Filename                                                                      | Desctiption                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|--------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| violin_\<output.basename>_qc_violin_plots.png                                        | <b>This is the main output file for most users.</b> <br>This plot contains 2-3 panels of violin plots (the third is only produced if either mtGenes is given, or the 'mt' key is annotated). <ul><li>The first panel plots n_genes_by_counts (the number of genes with at least 1 count in a cell - equivelent to Seurat's 'nFeature_RNA'). This is useful for selecting cells with minimum and maximum thresholds for number of genes expressed. <li>The second panel plots the total number of counts in each cell, useful for selecting cells which are within certian read depth thresolds. <li>The final panel plots the mitochondrial percentage of each cell, useful for eliminating cells that have an overabundance of mitochondria.</ul> |
| \<output.basename>_qc_total_genes_by\_<br>counts_vs_total_counts_with_histograms.png | This plot contains a plot of n_genes_by_counts vs. total_counts, accompanied by stacked histograms as produced by scanpy's .pp.calculate_qc_metrics function.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| scatter_\<output.basename>\_qc_n_cells_by\_<br>counts_vs_total_counts.png            | This contains a scatterplot of the number of cells with a specific number of counts (n_cells_by_counts) vs. the total number of counts.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| scatter_\<output.basename>_qc_n_genes_by\_<br>counts_vs_total_counts.png             | This contains a scatterplot of the number of expressed genes vs. the total number of counts in a cell (allows for the estiamtion of sequencing depth.)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| scatter_\<output.basename>_qc_pct_counts\_<br>mitochondrial_vs_total_counts.png      | Only produced if either mtGenes is given, or the 'mt' key is annotated. Produces a plot of the percentage of mitochondrial counts (pct_counts_mt) vs. total_counts. Useful for setting mitochondrial filtering thresholds                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

## Example Data:


## Module Technical Details
<b> Module Language: </b> Python 3.6<br><br>

<b> Algorithm Version: </b> Scanpy 1.3.3

<b>Source Repository: </b> [https://github.com/genepattern/ScanpyQC/releases/tag/v1](https://github.com/genepattern/ScanpyQC/releases/tag/v1)

<b>Docker image: </b> [

| **Version** | **Comment**      |
|-------------|------------------|
| 1           | Initial release. |
