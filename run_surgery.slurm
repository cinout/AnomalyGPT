#!/bin/bash

#SBATCH --partition=sapphire

#SBATCH --job-name="surgery"
#SBATCH --account=punim1623
#SBATCH --time=0-01:10:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G

### SBATCH --mail-user=haitianh@student.unimelb.edu.au
### SBATCH --mail-type=BEGIN

module purge

eval "$(conda shell.bash hook)"
conda activate anogpt

python -m fastchat.model.apply_delta \
  --base ./pretrained_ckpt/vicuna_ckpt/llama_weights/ \
  --target ./pretrained_ckpt/vicuna_ckpt/7b_v0/ \
  --delta ./pretrained_ckpt/vicuna_ckpt/delta_vicuna_weights/ \

##Log this job's resource usage stats###
my-job-stats -a -n -s
##