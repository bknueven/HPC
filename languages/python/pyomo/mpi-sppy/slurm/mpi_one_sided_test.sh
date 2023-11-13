#!/bin/bash
#SBATCH --nodes=2               # Number of nodes
#SBATCH --ntasks=2              # Request 2 CPU cores
#SBATCH --time=00:01:00         # Job should run for up to 1 minute
#SBATCH --account=aiuserapps    # Where to charge NREL Hours
#SBATCH --ntasks-per-node=1     # Put a task on each node
#SBATCH --mail-user=Bernard.Knueven@nrel.gov  # If you want email notifications
#SBATCH --mail-type=BEGIN,END,FAIL		 # When you want email notifications
#SBATCH --output=mpisppy_test.%j.out  # %j will be replaced with the job ID

module load anaconda3
conda activate mpi-sppy # activate your conda environment

export MPICH_ASYNC_PROGRESS=1     # enable communication threads

cd /projects/aiuserapps/bknueven/software/mpi-sppy      # the location of mpi-sppy

srun python -u -m mpi4py mpi_one_sided_test.py
