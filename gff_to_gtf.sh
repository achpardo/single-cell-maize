#!/bin/bash
#SBATCH --job-name=gffread
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mem=32G

module load gffread/0.12.8

GFF=/home/FCAM/apardo/single-cell-maize/B73_V5/Zm-B73-REFERENCE-NAM-5.0_Zm00001eb.1.gff3
OUTFILE=/home/FCAM/apardo/single-cell-maize/B73_V5/Zm-B73-REFERENCE-NAM-5.0_Zm00001eb.1.gtf

gffread ${GFF} -T -o ${OUTFILE}
