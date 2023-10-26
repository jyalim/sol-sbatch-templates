#!/bin/bash
#SBATCH -p general         # request general resources
#SBATCH -q debug           # request debug access
#SBATCH -t 15              # request 15 minutes of wall time
#SBATCH -N 2-2             # request min-max number (2) of nodes
#SBATCH -n 2               # request 2 tasks
#SBATCH -c 1               # request 1 core per task (2 total)
#SBATCH -o slurm.%j.%N.out # save all output to local file #(%j=jobid,%N=hostname)
#SBATCH --export=NONE      # ensure job will run in clean environment

echo NODELIST: $SLURM_NODELIST
echo TASKS-PER-NODE: $SLURM_TASKS_PER_NODE
echo CORES-PER-TASK: ${SLURM_CPUS_PER_TASK:-1}

module load mpich/4.1.2
echo "Running linux program \`hostname\` on each compute node"
mpirun -launcher slurm "hostname"
echo "Running networking benchmark \`osu_bibw\` between alloc. nodes"
module load microOSU/mpich/4.1.2
mpirun -launcher slurm "$(type -p osu_bibw)"
echo "Compiling a simple test C program"
mpicc hello_c.c -o hello
echo "Executing simple test C program"
mpirun -launcher slurm "./hello"
