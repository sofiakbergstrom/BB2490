#!/bin/bash

#SBATCH -p core -n 8
#SBATCH -t 05:00:00
#SBATCH -A g2015009
#SBATCH --mail-user guillermo.carrasco@scilifelab.se
#SBATCH --mail-type ALL

module load bioinfo-tools
module load htseq
module load pysam

PROJECT_HOME="/home/guilc/repos_and_codes/bio_data_analysis/project"
DATA_DIR="/proj/a2012043/nobackup/guilc/bio_data_analysis_data"
RESULTS_DIR=${PROJECT_HOME}/results/$(date +%Y-%m-%d)

# Fetch all the fastq files, analyze per sample
sample=$1
project=$2
unset filelist
for files in `ls $DATA_DIR/${project}/*${sample}_1.fastq.gz`
do
    filelist+=($files$space)
done

# BOWTIE reference genome
ref="/pica/data/uppnex/reference/biodata/genomes/Hsapiens/GRCh37/bowtie/GRCh37"
# Human annotation file
gtf="/pica/data/uppnex/reference/biodata/genomes/Hsapiens/GRCh37/annotation/Homo_sapiens.GRCh37.73.gtf"
miRBase="$PROJECT_HOME/src/miRNA_processing"
output=${RESULTS_DIR}/${project}/${sample}_out
python $PROJECT_HOME/src/miRNA_processing/pipeline.py -r ${ref} -g ${gtf} -m ${miRBase} -o ${output} -n 8 -k -f ${filelist[@]}
