from os import path

import numpy as np
import pandas as pd


################################################################################
# Globals                                                                      #
################################################################################

samples = (pd.read_csv(config['samples'], sep='\t')
             .set_index('sample', drop=False))
is_paired = config["options"]["paired"]


# default path for analysis
data_path = config["path"]["default"]
pipe_path = config["path"]["pipeline"]

# directory for output files
fastq_dir = path.join(data_path, 'raw')
bam_dir = path.join(data_path, 'bam')
star_fusion_dir = path.join(data_path, 'star_fusion')
fusion_inspector_dir = path.join(data_path, 'fusion_inspector')

qc_dir = path.join(data_path, 'qc')
log_dir = path.join(data_path, 'log')

rsem_dir = path.join(data_path, 'rsem')
feature_counts_dir = path.join(data_path, 'fcounts')


################################################################################
# Functions                                                                    #
################################################################################

def get_samples():
    return set(samples['sample'])


def format_options(options):
    return ' '.join(options or [])

################################################################################
# Rules                                                                        #
################################################################################
rule all:
     input:
         expand(path.join(rsem_dir, '{sample}.genes.results'), sample = get_samples())


include: path.join(pipe_path, 'rules/qc.smk')
include: path.join(pipe_path, 'rules/star_fusion.smk')






