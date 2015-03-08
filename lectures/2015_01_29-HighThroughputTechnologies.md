# High-Throughput Technologies

This is a student-driven lecture. Every student has to prepare a short (5 min) presentation
of each one of the following technologies:

* DNA sequencing

	* Sanger sequencing
	* "Illumina sequencing" (originally from Solexa)
	* PacBio RS II from Pacific Biosciencies

* Transcriptomics

	* Affymetrix microarrays
	* RNA-seq

* Proteomics

	* Shotgun proteomics
	* Selected reaction monitoring


During the lecture, the teachers will ask random students to present one of the technologies.

## What to present?
You should explain, roughly, how the technologies work and what the data characteristics are: 
how much data is generated? What kind of errors and how many are typically made? Finally, 
you should conclude your presentation by mentioning a scientific article based on data from 
the presented technology.

## Sequencing technologies descriptions

### DNA sequencing

#### Sanger sequencing

http://www.wellcome.ac.uk/Education-resources/Education-and-learning/Resources/Animation/WTDV026689.htm

Sanger sequencing was the first method for sequencing DNA with its first inception in 1977.
it was the most widely used sequencing method for approximately 25 years. More recently, 
Sanger sequencing has been supplanted by "Next-Gen" sequencing methods, especially for large-scale, 
automated genome analyses. However, the Sanger method remains in wide use, primarily for 
smaller-scale projects and for obtaining especially long contiguous DNA sequence reads (>500 nucleotides).

How it works (roughly):

The classical chain-termination method requires a single-stranded DNA template, 
a DNA primer, a DNA polymerase, normal deoxynucleosidetriphosphates (dNTPs), and 
modified di-deoxynucleotidetriphosphates (ddNTPs), the latter of which terminate DNA strand elongation.

1. Target DNA is heated to get a single-stranded DNA chain.
2. The DNA strand is divided into four separate sequencing reactions, containing 
all four of the standard deoxynucleotides (dATP, dGTP, dCTP and dTTP) and the DNA polymerase.
To each reaction is added only one of the four dideoxynucleotides (ddATP, ddGTP, ddCTP, or ddTTP),
while three other nucleotides are ordinary ones. These dideoxynucleotides are used to
stop the DNA strand elongation
3. As the dideoxynucleotides are introduced randomly, you get fragments of different
sizes. At the end of the process, all the samples are merged to determine the DNA
sequence (drawing here).
4. Merging the resulting fragments on the 4 reactions gives you the complete DNA
sequence.

It is fast and relatively simple.

Common challenges of DNA sequencing with the Sanger method include poor quality 
in the first 15-40 bases of the sequence due to primer binding and deteriorating 
quality of sequencing traces after 700-900 bases.

Also, in cases where DNA fragments are cloned before sequencing, the resulting sequence 
may contain parts of the cloning vector.

Average read length=500-800 bases: 6X coverage
This sequencing method takes over a year to sequence one gigabase...

**Citations**

Where they describe the method: _Sanger, Frederick, Steven Nicklen, and Alan R. Coulson. "DNA sequencing with chain-terminating inhibitors." Proceedings of the National Academy of Sciences 74.12 (1977): 5463-5467._

Characterization of Neanderthal genomics data: _Noonan, James P., et al. "Sequencing and analysis of Neanderthal genomic DNA." science 314.5802 (2006): 1113-1118._

#### Illumina sequencing

http://www.wellcome.ac.uk/Education-resources/Education-and-learning/Resources/Animation/WTX056051.htm

Also called High-Throughput or massively parallel sequencing, the Illumina method
works as follows:

1. Target DNA is broken into small fragments to which special adaptors (known small 
DNA sequences) are added in both ends.
2. These fragments are bound to a slide with primers attached, where the fragments can bind. 
3. Amplification: DNA fragments bend over and find a complementary primer on the 
surface. 
4. From the primer in the surface, a complementary DNA strand is created. The strands
are split apart, and the replication process is repeated to create more copies. This forms
dense clusters of DNA in each channel of the slide. 
5. One type of the strand is discarded to make sequencing more efficient. 
6. Sequencing primers polymerase and nucleotides are the added to the mix. As bases
are added, a laser is used to read them and determine the sequence of the fragment. The
computer works out the sequence from many clusters. 

Main problems are short read length (120 - 250 bp), which makes it unsuitable for
unknown organisms (de-novo sequencing). However it is faster and cheaper. 

The new X-Ten machines can produce approximately 1.9TB in 3 days, and the HiSeq 2500
around 1TB in 6 days with the latest chemistry.

**Citations**

Nystedt, Björn, et al. "The Norway spruce genome sequence and conifer genome evolution." Nature 497.7451 (2013): 579-584.

### PacBio RS II from Pacific Biosciencies

http://files.pacb.com/pdf/PacBio_RS_II_Brochure.pdf

PacBio RS II is one of the sequencers from Pacific Biosciences that uses the SMRT
technology for sequencing DNA. It works as follows:

The DNA sequencing is done on a chip that contains many ZMWs. Inside each ZMW, a 
single active DNA polymerase with a single molecule of single stranded DNA template 
is immobilized to the bottom through which light can penetrate and create a visualization 
chamber that allows monitoring of the activity of the DNA polymerase at a single molecule level. 
The signal from a phospho-linked nucleotide incorporated by the DNA polymerase is 
detected as the DNA synthesis proceeds which results in the DNA sequencing in real time.

For each of the nucleotide bases, there are four corresponding fluorescent dye molecules 
that enable the detector to identify the base being incorporated by the DNA polymerase 
as it performs the DNA synthesis. The fluorescent dye molecule is attached to the phosphate 
chain of the nucleotide. When the nucleotide is incorporated by the DNA polymerase, the 
fluorescent dye is cleaved off with the phosphate chain as a part of a natural DNA 
synthesis process during which a phosphodiester bond is created to elongate the DNA chain. 
The cleaved fluorescent dye molecule then diffuses out of the detection volume so 
that the fluorescent signal is no longer detected.

"PacBio RS II" uses all 150,000 ZMW holes concurrently, doubling the throughput 
per experiment, achieving a throughput of 350 megabases per SMRT Cell though a Human,
de novo data set (not sure about the time...)



### Transcriptomics

#### Affymetrix microarrays

[About microarrays in general](https://www.youtube.com/watch?v=pWk_zBpKt_w)

A DNA microarray is basically a grid of features (single-stranded already known genes)
that allows for the detection of thousands of genes simultaneously given a sample.

Basically when putting the sample in the array, DNA molecules try to hybridize with the
complementary single stranded genes in the microarray. For each hybiridization, a 
fluorescent color is shown in the corresponding grid in the microarray. 

They are very cheap, and an inconvenient is that you rely on already sequenced information.

Affymetrix is focused on oligonucleotide microarrays. These microarrays are used 
to determine which genes exist in a sample by detecting specific pieces of mRNA. 
A single chip can be used to analyze thousands of genes in one assay. Chips can be used only once.


Affymetrix microarrays probes have a fixed length of 25bases, whereas with other
technologies the length can vary and be as long as you want. 

#### RNA-seq

The transcriptome of a cell is dynamic; it continually changes. The recent developments
of next-generation sequencing (NGS) allow for increased base coverage of a DNA sequence, 
as well as higher sample throughput. This facilitates sequencing of the RNA transcripts 
in a cell, providing the ability to look at alternative gene spliced transcripts, 
post-transcriptional modifications, gene fusion, mutations/SNPs and changes in gene expression.

RNA sequencing is similar to illumina or next-gen sequencing, but instead of sequencing static genomes
what is sequenced are the cell transcripts. RNA-seq is used to measure gene expression for example,
one big difference with the microarray technology is that thanks to the deep sequencing
it allows for a more detailed information. Also, as it does not rely in previous 
information, it allows for the discovery of novel transcripts. 

**citations**
RNA-Seq: a revolutionary tool for transcriptomics.
Wang Z1, Gerstein M, Snyder M.


### Proteomics

#### Shotgun proteomics
Shotgun proteomics refers to the use of bottom-up proteomics techniques in identifying
proteins in complex mixtures using a combination of high performance liquid chromatography 
combined with mass spectrometry. The name is derived from shotgun sequencing 
of DNA which is itself named after the rapidly expanding, quasi-random firing pattern of a shotgun. 
The most common method of shotgun proteomics starts with the proteins in the mixture being digested 
and the resulting peptides are separated by liquid chromatography. Tandem mass spectrometry 
is then used to identify the peptides.

**citations**
McDonald, W. Hayes, and John R. Yates. "Shotgun proteomics and biomarker discovery." Disease markers 18.2 (2002): 99-105.

#### Selected reaction monitoring

http://www.nature.com/nmeth/journal/v9/n6/full/nmeth.2015.html