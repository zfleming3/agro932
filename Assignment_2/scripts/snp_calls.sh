#!/bin/bash
#SBATCH -D /work/agro932/zfleming3/agro932/Assignment_2/data #Project directory
#SBATCH -o /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/snp_call2.out
#SBATCH -e /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/snp_call2.err
#SBATCH -J snp_call2 #Job name
#SBATCH -t 24:00:00 #Job time limit
#SBATCH --mem=16G # Memory request
#SBATCH --ntasks=1
#SBATCH --mail-user=zfleming3@unl.edu #Email updates
#SBATCH --mail-type=END #email if ends
#SBATCH --mail-type=FAIL #email if fails

module load samtools/1.20 bcftools/1.21

### index the genome assembly
#samtools faidx B73_Ref.fa

### Run `mpileup` to generate VCF format
#ls sorted*bam > bamlist.txt
bcftools mpileup -f B73_Ref.fa -b bamlist.txt | bcftools call -cv -Ob -o snps2.bcf
#samtools mpileup -a -f B73_Ref.fa -b bamlist.txt > pileup.txt
#bcftools call output.bcf -cv -Ob -o snps.bcf

### Extract allele frequency at each position
bcftools query -f '%CHROM %POS %AF1\n' snps2.bcf > frq2.txt
bcftools query -f '%CHROM %POS %REF %ALT [\t%GT]\n' snps2.bcf > geno2.txt
