#!/bin/bash
#SBATCH --partition=general
#SBATCH --qos=public
#SBATCH --job-name=ood-example-job
#SBATCH --time=1
#SBATCH --output=slurm.%j.out  ## job /dev/stdout record (%j expands -> jobid)
#SBATCH --error=slurm.%j.err   ## job /dev/stderr record 
#SBATCH --export=NONE          ## keep environment clean
#SBATCH --mail-type=ALL        ## notify for any job state change
#SBATCH --mail-user=%u@asu.edu ## notify email (%u expands -> username)

echo "Hello World" > output_file

echo "Created output file with 'Hello World'"
