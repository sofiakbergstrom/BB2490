#!/bin/bash

# This is the template sbatch script for Lab2 at BB2490 spring 2015

# Run the script like this:
# sbatch <OPTIONS> sbatch_template.sh
# Where the OPTIONS are all of:
# –A g2015009 –t 2:00:00 –p node –n 8 --res=g2015009_02 –o my_job_name.out
# (you may change the job name "my_job_name.out" to anything you like).

# Any line that starts with '# ' (dash followed by space) is a comment and will not be executed

# Don't forget to add the appropriate modules! See THE MODULE SYSTEM section in the instructions.
module add bioinfo-tools
module add bwa/0.5.9
# samtools
# BEDTools


# cd to the directory where the data is (of course, use your own user name):
cd /home/guilc/repos_and_codes/bio_data_analysis/labs/lab2

# Then list the commands that you would like to run. 
# If you'd like to add more jobs, enter them on the following lines. 
# To help you out, the first command of today's lab is provided:
bwa aln /proj/g2015009/BB2490/LAB2/all_chr.hg19.fa data/ERR001014.filt.fastq > data/ERR001014.filt.bwa_aln.default.sai
