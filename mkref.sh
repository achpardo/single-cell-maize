#!/bin/bash
#SBATCH --job-name=mkref
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mem=64G
#SBATCH -o mkref.out

hostname
date

module load cellranger/9.0.1

GENDIR=/home/FCAM/apardo/single-cell-maize/B73_V5
cd ${GENDIR}
GNAME=Zmays_B73_V5
FASTA=${GENDIR}/Zm-B73-REFERENCE-NAM-5.0.fa
GTF=${GENDIR}/Zm_B73_V5.filtered.gtf

cellranger mkref --genome=${GNAME} --fasta=${FASTA} --genes=${GTF}
