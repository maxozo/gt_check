#/bin/bash
$name=$3
singularity exec -B /lustre /software/hgi/containers/yascp/yascp.cog.sanger.ac.uk-public-singularity_images-wtsihgi-nf_yascp_htstools-1.1.sif \
 bcftools gtcheck --no-HWE-prob -g \
 $1 $2 \
  > ${name}_gt_assign_out.tsv

singularity exec -B /lustre /software/hgi/containers/yascp/yascp.cog.sanger.ac.uk-public-singularity_images-wtsihgi-nf_genotype_match-1.0.sif \ 
  gtcheck_assign.py ${name}_gt_assign ${name}_gt_assign_out.tsv