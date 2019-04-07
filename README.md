# snakemake_STAR-Fusion

You should fit the input name to the format of this pipeline. If the name of your input file does not fit to this pipeline,
you can change it by using 'rename' function.

rename 's/\<pattern\>/\<replacement\>/' *.fastq.gz

ex) S1_R1_001.fastq.gz --> S1_R1.fastq.gz
rename 's/_001//' *.gz
