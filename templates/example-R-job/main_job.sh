#!/bin/bash 
#SBATCH -p general ## Partition
#SBATCH -q public  ## QOS
#SBATCH -c 1       ## Number of Cores
#SBATCH --time=5   ## 5 minutes of compute
#SBATCH --job-name=ood-example-R
#SBATCH --output=slurm.%j.out  ## job /dev/stdout record (%j expands -> jobid)
#SBATCH --error=slurm.%j.err   ## job /dev/stderr record 
#SBATCH --mail-type=ALL        ## notify <asurite>@asu.edu for any job state change
#SBATCH --export=NONE          ## keep environment clean

echo "WHERE I AM FROM: $SLURM_SUBMIT_DIR"
echo "WHERE AM I NOW: $(pwd)"
echo "Hello World" > output_file
echo "Created output file with 'Hello World'"

echo "Loading R"
module load r-4.2.1-gcc-11.2.0
echo "Running example R script"
R --no-save --quiet <  hello.r
