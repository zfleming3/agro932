#!/bin/bash
#SBATCH -D /work/agro932/zfleming3/agro932/Assignment_2/scripts #Project directory
#SBATCH -o /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/fst.out
#SBATCH -e /work/agro932/zfleming3/agro932/Assignment_2/cache/err_out/fst.err
#SBATCH -J fst #Job name
#SBATCH -t 04:00:00 #Job time limit
#SBATCH --mem=16G # Memory request
#SBATCH --ntasks=1
#SBATCH --mail-user=zfleming3@unl.edu #Email updates
#SBATCH --mail-type=END #email if ends
#SBATCH --mail-type=FAIL #email if fails

#Load R
module load R/4.3

#Run the R script
Rscript fst.R
