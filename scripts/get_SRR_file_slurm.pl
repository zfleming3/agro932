open(E,">run.txt");
open(T,"SRR_Acc_List.txt")||die "Can't open your file!";
while(<T>)
{
	chomp;
		$out="Download_$_\.slurm";
			open(R,">$out");
		$l="prefetch $_ -O SRA";
	print R 
"#!/bin/sh
#SBATCH --job-name=$_
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=40:00:00
#SBATCH --mem=10G
#SBATCH --error=$_\.err
#SBATCH --output=$_\.out
#SBATCH --licenses=common
module load SRAtoolkit/2.10
$l";
print E "sbatch $out\n";	
	}
	
