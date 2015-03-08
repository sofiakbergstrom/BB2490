#!/bin/bash
# This is the template sbatch script for Lab3 at BB2490 spring 2015

# Run the script like this:
# sbatch <OPTIONS> sbatch_template.sh
# Where the OPTIONS are all of:
# -A g2015009 -t 2:00:00 -p node -n 8 --res=g2015009_06 -o my_job_name.out
#
# You may change the job name (-o my_job_name.out) to anything you like.

# Any line that starts with '# ' (dash followed by space) is a comment and will not be executed

# First add the modules needed for the program(s) your're about to run:
# bioinfo-tools
# bwa/0.5.9
# samtools
# BEDTools
# python
# tophat/1.2.0  (we need to specify the tophat version since the default version at Uppmax is obsolete)
# bowtie
# htseq

# cd to the directory where the data is (of course, use your own user name):
cd /home/guilc/repos_and_codes/bio_data_analysis/labs/lab3

# Then list the commands that you would like to run.
# If you'd like to add more jobs, enter them on the following lines.

## PART A: RNA-SEQ
# To help you out, the first command of the RNA-seq part is provided (don't forget to uncomment):
tophat -o data/tophat_output --solexa1.3-quals /proj/g2014007/INBOX/BB2490_Lab3/hg19 data/rnaseq.inflTiss9P.fastq


## PART B: ChIP-SEQ
# NOTE: we use Galaxy for this part of the computer exercise. See lab instructions.
# (In case MACS had been installed, the following line would have started the peak calling:)
# macs -t Sp1_sample.bed --name NAME_OF_OUTPUT --pvalue=1e-6
