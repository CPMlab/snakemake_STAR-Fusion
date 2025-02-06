# RNA-seq Fusion Detection Pipeline (STAR-Fusion)

## Overview
This pipeline automates RNA sequencing (RNA-seq) analysis for detecting fusion genes using STAR-Fusion. It processes input FASTQ files, aligns reads, and identifies fusion transcripts in a structured workflow using Snakemake.

## Dependencies
The following software and Python libraries are required:

- **STAR-Fusion**: Fusion detection tool for RNA-seq
- **Snakemake**: Workflow management system
- **Python**: Required for Snakemake execution
- **Pandas**: For sample data processing
- **NumPy**: For numerical operations
- **OS module**: For path handling

## Pipeline Structure
The pipeline consists of the following Snakemake rules:

![image](https://github.com/user-attachments/assets/5d21dc13-2e28-4586-a6bb-13ca309bee27)

### 1. `rule all`
Defines the final output, ensuring that fusion detection and quality control reports are successfully generated.
- **Output Files**:
  - `FusionInspector-validate/finspector.fusion_predictions.final`: Final validated fusion transcript report
  - `multiqc_report.html`: Quality control report

### 2. `get_samples()`
Extracts the list of sample names from `samples.tsv`, ensuring that all required samples are processed.

### 3. `format_options(options)`
Formats optional command-line arguments into a single string for STAR-Fusion execution.

## Configuration
The `config.yaml` file should specify input paths, output directories, and analysis options. Example:

```yaml
samples: "samples.tsv"
options:
  paired: true
path:
  data: "./data"
  pipeline: "./pipeline"
```

## Included Rules
The pipeline includes additional Snakemake rule files:
- `rules/qc.smk`: Quality control analysis
- `rules/star_fusion.smk`: RNA-seq alignment and fusion detection using STAR-Fusion

## Execution
To run the pipeline, execute:
```bash
snakemake --cores <num_cores>
```
Replace `<num_cores>` with the number of available CPU cores.

## Output Files
- **Fusion Results**: `FusionInspector-validate/finspector.fusion_predictions.final`
- **Quality Control Report**: `multiqc_report.html`
- **Log Files**: Stored in `log_dir`

## Troubleshooting
- Ensure `config.yaml` contains correct paths and options.
- Verify `samples.tsv` has the correct format with a `sample` column.
- Check `log_dir` for error messages.
- Ensure STAR-Fusion is installed and properly configured.

## Author
This pipeline was developed for RNA-seq fusion detection using STAR-Fusion and Snakemake.

For inquiries, please contact the developer or refer to the STAR-Fusion documentation.

