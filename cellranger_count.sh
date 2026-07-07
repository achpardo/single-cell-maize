#!/bin/bash
#SBATCH --job-name=cellranger
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mem=96G
#SBATCH --ntasks=8
#SBATCH --array=0-11
#SBATCH -o cr_%a.out

hostname
date
module load cellranger/9.0.1

BASEDIR=/scratch/apardo/single-cell-maize/raw_data
IDLIST=($(</home/FCAM/apardo/single-cell-maize/IDs.txt))
ID=${IDLIST[${SLURM_ARRAY_TASK_ID}]}
REF=/home/FCAM/apardo/single-cell-maize/B73_V5/Zmays_B73_V5

cd /scratch/apardo/single-cell-maize
cellranger count --id=${ID} --transcriptome=${REF} --fastqs=${BASEDIR} --sample=${ID} --create-bam=true --localcores=10 --localmem=96
