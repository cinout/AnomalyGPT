#!/bin/bash

###SBATCH --partition=gpu-a100

#SBATCH --partition=feit-gpu-a100
#SBATCH --qos=feit

###SBATCH --partition=deeplearn
###SBATCH --qos=gpgpudeeplearn
###SBATCH --constraint=dlg4|dlg5

#SBATCH --job-name="test"
#SBATCH --account=punim1623
#SBATCH --time=0-02:00:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1

### "ntasks-per-node" should have same value as "res=gpu:"

#SBATCH --mem=120G

module purge

eval "$(conda shell.bash hook)"
conda activate anogpt

# FIXME: update test options
python test_mvtec.py \
    --anomalygpt_ckpt_path "./ckpt/train_mvtec/pytorch_model.pt" \
    --k_shot 1 \
    --round 3 \
    # --few_shot \

##Log this job's resource usage stats###
my-job-stats -a -n -s
##