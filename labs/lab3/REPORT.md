# Lab 3 report

Guillermo Carrasco

## RNA-seq

#### Q1:    Easy question: which file did you choose?

I chose rnaseq.inflTiss9P.fastq

#### Q2: What does the TopHat `-o` option mean?

Specifies the directory where to store the program output.

#### Q3: What would be the command line to convert the resulting BAM file into a BAM file?

`samtools view -h accepted_hits.bam > accepted_hits.sam`

#### Q4: Use the junctions.bed file to get the top scoring region, what is the score and on which chromosome is this junction?

[Here](http://genome.ucsc.edu/FAQ/FAQformat.html#format1) it is the specification
of the BED format. Column 5 is the score, so use the Unix `sort` command to sort
by column 5

```bash
(master)guilc@m14:~/repos_and_codes/bio_data_analysis/labs/lab3/data/tophat_output (master)$ sort -k 5 -n -r junctions.bed | head
chr17   39658968        39659284        JUNC00003210    361     -       39658968        39659284        255,0,0 2       96,96   0,220
chr17   39658750        39659035        JUNC00003207    320     -       39658750        39659035        255,0,0 2       96,97   0,188
chr17   39657517        39658035        JUNC00003199    312     -       39657517        39658035        255,0,0 2       97,65   0,453
chr17   39657966        39658722        JUNC00003204    262     -       39657966        39658722        255,0,0 2       30,97   0,659
chr12   52884650        52884959        JUNC00002150    247     -       52884650        52884959        255,0,0 2       87,64   0,245
chr17   39659257        39659633        JUNC00003213    244     -       39659257        39659633        255,0,0 2       93,95   0,281
chr12   52883760        52884443        JUNC00002139    220     -       52883760        52884443        255,0,0 2       92,91   0,592
chr17   39659603        39659981        JUNC00003216    214     -       39659603        39659981        255,0,0 2       92,87   0,291
chr17   39659893        39661402        JUNC00003218    185     -       39659893        39661402        255,0,0 2       84,95   0,1414
chr12   52881642        52881891        JUNC00002129    173     -       52881642        52881891        255,0,0 2       97,39   0,210
```

Top scoring region is 361 and it is in chromosome 17.

#### Q5: What does the score mean?

The score is used to represent read depth. The greyer, the deeper.

#### Q6: Use Google (or any other search engine) to to find out more about RefSeq. What is it? Why are the RefSeq genes suitable to use as annotation files?

A comprehensive, integrated, non-redundant, well-annotated set of reference sequences including genomic, transcript, and protein. RNA-seq reads are first aligned to RefSeq genes, and only the reads that do not map completely to these genes are algined with the reference genome.

#### Q7: What is the column 3 in GTF format?

The column 3 is _feature_.

#### Q8: What is the name of the format whose 8 first columns are identical with GTF?

GFF (General Feature Format)

#### Q9: What would the sbatch line look like if you want to run TopHat with the GTF gene annotation downloded?

```bash
tophat -o data/tophat_output --solexa1.3-quals -G data/Humman_annotation.gtf /proj/g2014007/INBOX/BB2490_Lab3/hg19 data/rnaseq.inflTiss9P.fastq
```
