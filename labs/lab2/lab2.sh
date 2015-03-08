#!/bin/bash

# Required modules
module add bioinfo-tools
module add bwa/0.5.9
module add samtools


# cd to the directory where the data is:
cd /home/guilc/repos_and_codes/bio_data_analysis/labs/lab2

# Run BWA alignment
#bwa aln /proj/g2015009/BB2490/LAB2/all_chr.hg19.fa data/ERR001014.filt.fastq > data/ERR001014.filt.bwa_aln.default.sai

# Convert to human-readable sam format
#bwa samse /proj/g2015009/BB2490/LAB2/all_chr.hg19.fa data/ERR001014.filt.bwa_aln.default.sai data/ERR001014.filt.fastq > data/ERR001014.filt.bwa_aln.default.sam

# Convert to BAM file
samtools import /proj/g2015009/BB2490/LAB2/all_chr.hg19.fa.fai data/ERR001014.filt.bwa_aln.default.sam data/ERR001014.filt.bwa_aln.default.bam

# Sort the BAM file, in order to browse the alignment
samtools sort data/ERR001014.filt.bwa_aln.default.bam data/ERR001014.filt.bwa_aln.default.sorted

# Index BAM file to enable fast random access
samtools index data/ERR001014.filt.bwa_aln.default.sorted.bam
