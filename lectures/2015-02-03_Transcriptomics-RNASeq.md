# 2015-02-03 Transcriptomics - RNA-Seq

_Presentation by sofia Bergström and Matilda Berkell_

(The two paper about sequence alignment)

"Old" algorithms are not suitable for long reads (more than 100bp?), BWA-MEM and bowtie2
are suitable for long reads. 

**BWA**
Algorithm in two parts

1. Aligning a single query sequence

2. Pared-end mapping

70 to a coumple of megabases suitable

**Bowtie2**

"Accelerated dynamic programming"?

- Chimeric reads --> Combined reads from different reads of the Genome. 
- BWA is very space efficient thanks to Barrow-Wheeler transform.


### Lecture by Olof Emanuelson

Wrong about the papers: There is no need to normalize RNA-Seq data. They thought that
you could handle the data very naively and still get nice results, but it is not the
case nowadays. 

(printed slides)

The historical point of Gene Expression studies is to compare two samples (disease vs healthy)

DNA --> RNA is called transcription

What makes a cancer cell be a cancer cell is a different gene expression, actually.

RNA-Seq is the current state of the art and is replacing Chip-Seq, however Chip-Seq is
still used.

Gene: In the whole DNA string you've "islands" that are the genes. In bacterial genomes
the genes are packed one after the other. Eukaryotic organisms instead there are parts
of the genome that we don't know what they are. 

Exons, thick lines, eventually translated to proteins. TSS == Transcription start site.

An intron is any nucleotide sequence within a gene that is removed by RNA splicing 
while the final mature RNA product of a gene is being generated. The term intron 
refers to both the DNA sequence within a gene and the corresponding sequence in RNA transcripts.

One gene can produce many possible transcripts. 

It is important to understand how genes interact with each other, rather than studying
a single gene at a time. 

If instead of having a reference genome you have a reference transcriptome, you can
map the RNA reads to the transcripome using the regular mapping tools. Otherwise you
can use TopHat or other tool prepared for mapping against spliced parts. 