def align_inputs(wildcards):

    fastq_path = path.join(fastq_dir, "{sample}{{pair}}.fastq.gz".format(
        sample = wildcards.sample))
    pairs = ["_1", "_2"] if is_paired else [""]
    return expand(fastq_path, pair=pairs)


rule star_fusion:
    input:
        fq = align_inputs
    output:
        path.join(fusion_dir, '{sample}', 'FusionInspector-validate/finspector.fusion_predictions.final')
    params:
        reflib = config['star_fusion']['reflib'],
        out_dir = path.join(fusion_dir, '{sample}'),
        options = format_options(config['star_align']['options'])
    conda:
        path.join(pipe_path, 'envs/star_fusion.yaml')
    threads:
        config['star_fusion']['threads']
    log:
        path.join(log_dir, 'star_fusion', '{sample}.log')
    run:
        if config["options"]["paired"]:
        	shell('STAR-Fusion {params.options} --left_fq {input.fq[0]} --right_fq {input.fq[1]} '
        		  '--genome_lib_dir {params.reflib} '
        		  '--CPU {params.threads} --output_dir {params.out_dir} 2> {log}')
        else:
        	shell('STAR-Fusion {params.options} --left_fq {input.fq} '
        		  '--genome_lib_dir {params.reflib} '
        		  '--CPU {params.threads} --output_dir {params.out_dir} 2> {log}')
