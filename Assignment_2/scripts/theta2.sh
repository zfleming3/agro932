#!/bin/bash
#SBATCH -D /work/agro932/zfleming3/agro932/Assignment_1/data/SRA #Project directory
#SBATCH -o /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/theta2.out
#SBATCH -e /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/theta2.err
#SBATCH -J theta2 #Job name
#SBATCH -t 24:00:00 #Job time limit
#SBATCH --mem=16G # Memory request
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=8
#SBATCH --mail-user=zfleming3@unl.edu #Email updates
#SBATCH --mail-type=END #email if ends
#SBATCH --mail-type=FAIL #email if fails

module load bwa/0.7 samtools/1.20

#move the zipped files to the new directory
##mv *.gz /work/agro932/zfleming3/agro932/Assignment_2/data/

#move to the new directory and unzip all files
cd /work/agro932/zfleming3/agro932/Assignment_2/data/

##for file in *.fastq.gz; do
##    gunzip "$file"
##done

#index reference
##bwa index B73_Ref.fa

# allignment
##SRR11301594 SRR11301638 SRR11301641 SRR11301741
##for i in SRR11301817 SRR11301903 SRR11301911 SRR11301912 SRR11302080 SRR11302096; do bwa mem -t 8 B73_Ref.fa ${i}_1.fastq ${i}_2.fastq | samtools view -bSh - > ${i}.bam; done
# sort
for i in SRR11301817 SRR11301903 SRR11301911 SRR11301912 SRR11302080 SRR11302096; do samtools sort ${i}.bam -o sorted_${i}.bam; done
##for i in SRR11301638; do samtools sort -@ 8 l${i}.bam -o sorted_${i}.bam; done
# index them
for i in sorted*.bam; do samtools index ${i}; done
