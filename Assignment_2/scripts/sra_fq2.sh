#!/bin/bash 
#SBATCH -D /work/agro932/zfleming3/agro932/Assignment_1/data/SRA #Project directory
#SBATCH -o /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/sra_fq.out
#SBATCH -e /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/sra_fq.err
#SBATCH -J sra_fq #Job name
#SBATCH -t 17:00:00 #Job time limit
#SBATCH --mem=16G # Memory request
#SBATCH --cpus-per-task=8
#SBATCH --mail-user=zfleming3@unl.edu #Email updates
#SBATCH --mail-type=END #email if ends
#SBATCH --mail-type=FAIL #email if fails

module load SRAtoolkit/2.11

# Process SRA files using fasterq-dump with compression
for sra in SRR11301594 #SRR11301638 SRR11301641 SRR11301741 SRR11301817 SRR11301903 SRR11301911 SRR11301912 SRR11302080 SRR11302096
do
    fasterq-dump --split-3 --threads 8 ${sra}.sra && gzip ${sra}_*.fastq
done

#### AAR 
##Completed correctly
##Time 11:48:42
##Nodes:1
##Cores per node:8
##Memory:102.96Mb
##File#:10
#### Actions taken: Change the headder to be more efficient.  
