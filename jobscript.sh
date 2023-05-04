#!/bin/bash --login
#$ -cwd                   # Run job from directory where submitted

# If running on a GPU, add:
#$ -l v100=2

#$ -pe smp.pe 8          # Number of cores on a single compute node. GPU jobs can
                         # use up to 8 cores per GPU.

# We now recommend loading the modulefile in the jobscript
module load apps/binapps/pytorch/1.0.1-36-gpu
# $NSLOTS is automatically set to the number of cores requested on the pe line.
# Inform some of the python libraries how many cores we can use.
export OMP_NUM_THREADS=$NSLOTS

python main.py