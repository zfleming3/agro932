#!/bin/bash 
#SBATCH -D ~/work/agro932/zfleming3/agro932/Assignment_2 #Project directory
#SBATCH -o /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/sra_fq.out
#SBATCH -e ~/work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/sra_fq.err
#SBATCH -J sra_fq #Job name
#SBATCH -t 24:00:00 #Job time limit
#SBATCH --mail-user=zfleming3@unl.edu #Email updates
#SBATCH --mail-type=END #email if ends
#SBATCH --mail-type=FAIL #email if fails

cd /work/agro932/zfleming3/agro932/Assignment_1/data/SRA #location of SRA files.

module load SRAtoolkit/2.11

fastq-dump --split-3 SRR11301594.sra
fastq-dump --split-3 SRR11301638.sra
fastq-dump --split-3 SRR11301641.sra
fastq-dump --split-3 SRR11301741.sra
fastq-dump --split-3 SRR11301817.sra
fastq-dump --split-3 SRR11301903.sra
fastq-dump --split-3 SRR11301911.sra
fastq-dump --split-3 SRR11301912.sra
fastq-dump --split-3 SRR11302080.sra
fastq-dump --split-3 SRR11302096.sra
