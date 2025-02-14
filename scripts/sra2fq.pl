open(E,">run.txt");
open(T,"sra.txt")||die "Can't open your file!";
$i=1;
while(<T>)
{
		chomp;
		$out="$_"."\.slurm";
	open(R,">$out");
print R 
"#!/bin/sh
#SBATCH --job-name=sra2fq_$_
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=20:00:00
#SBATCH --mem=20G
#SBATCH --error=$_\.err
#SBATCH --output=$_\.out
#SBATCH --licenses=common
#SBATCH --partition=jclarke
module load SRAtoolkit
fastq-dump  --split-3 --gzip $_
";
	
	$i++;
print E "sbatch $out\n";	
	}