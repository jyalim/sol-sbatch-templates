#!/bin/bash 
#SBATCH -p general  ## Partition
#SBATCH -q public   ## QOS
#SBATCH -N 1        ## Number of Nodes
#SBATCH -c 1        ## Number of Cores
#SBATCH --time=5    ## 5 minutes of compute
#SBATCH --job-name=ood-example-matlab-job
#SBATCH --mem-per-cpu=1G     
#SBATCH --output=slurm.%j.out  ## job /dev/stdout record (%j expands -> jobid)
#SBATCH --error=slurm.%j.err   ## job /dev/stderr record 
#SBATCH --mail-type=ALL        ## notify <asurite>@asu.edu for any job state change
#SBATCH --export=NONE          ## keep environment clean

echo "WHERE I AM FROM: $SLURM_SUBMIT_DIR"
echo "WHERE AM I NOW: $(pwd)"
echo "Hello World" > output_file
echo "Created output file with 'Hello World'"

echo "Loading MATLAB 2022a"
module load matlab/2022a
echo "Running example MATLAB script"
matlab -nosplash -nodesktop < hello.m
