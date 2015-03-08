## B1

####Q1: Use the Unix commands wc and expr to determine how many reads there are in this file.

The command used is 

```
(master)guilc@milou-b:~/repos_and_codes/bio_data_analysis/labs/lab2 (master)$ wc -l data/ERR001014.filt.fastq
5363280 data/ERR001014.filt.fastq
```

But it is a _fastq_ file, which implies 4 lines per read, so *there are 5363280/4 = 1340820
reads in the file*

<hr />

Human genome index in /proj/g2015009/BB2490/LAB2/all_chr.hg19.fa

Command ran for exercise B2: `sbatch -A g2015009 -t 2:00:00 -p node -n 8 --res=g2015009_02 -o exercise_B2.out exercise_B2.sh`
## B3

####Q2. What sequencing technology was used to sequence these reads?

The Illumina platform was used for sequencing. 

####Q3. The data set ERR001013 is from a human individual. Can you find the sex of this individual? (Hint: click on the link on the row starting with “Sample:”).

Clicking on "Individual record in dbSNP", we can see that it is a female. 

####Q4. What organization created SRA?

The Sequence Read Archive (SRA) was created and engineered at the National Center 
for Biotechnology Information (NCBI, www.ncbi.nlm.nih.gov), National Library of Medicine, 
National Institutes of Health, Department of Health and Human Services. NCBI is located 
on the National Institutes of Health campus in Bethesda MD, USA.

####Q5. What is the difference between the Sequence Read Archive and the Trace Archive?

SRA stores raw data (and now also alignment information) from _next-generation_ sequencing technologies, 
while Trace Archive serves as the repository of sequencing data from gel/capillary platforms.

## B4

The index file for samtools is located here /proj/g2015009/BB2490/LAB2/all_chr.hg19.fa.fai

####Q6. How many reads do you have within this region of chr 22?

We can know that by executing the following two commands:

```
$> samtools view data/ERR001014.filt.bwa_aln.default.sorted.bam 'chr22_hg19:18000000-18080000' > data/chr22_part.ERR001014.filt.bwa_aln.default.sam

$> wc -l data/chr22_part.ERR001014.filt.bwa_aln.default.sam
24 data/chr22_part.ERR001014.filt.bwa_aln.default.sam
```

So there are 24 reads within region 18000000-18080000 of chromosome 22

####Q7. Look at the SAM format definition (from the lecture notes or the SAMtools paper or on the Internet). How many of the reads within this region of chr 22 have a mapping quality above 30? How many have a mapping quality of 0 ? (A bwa mapping quality of 0 means the mapping is ambiguous, ie. the read matches to more than one place on the genome).

With this bit of Python code we can isolate the qualities and then summarize them:

```python
import csv

with open('data/chr22_part.ERR001014.filt.bwa_aln.default.sam', 'rb') as f:
	r = csv.reader(f, delimiter='\t')
	qualities = []
	for read in r:
		qualities.append(read[4])

print len(filter(lambda x: int(x) > 30, qualities))
print len(filter(lambda x: int(x) == 0, qualities))
```

There are 16 reads with quality over 30 and 7 reads with quality equal to 0.

## B5

[Info about tview](http://samtools.sourceforge.net/tview.shtml)

####Q8. Try tview for a few minutes. (Use ‘?’ to get help inside tview). What do you think about this alignment viewer?

After playing for a while with the viewer you get quite comfortable with it. The controls
are quite intuitive, and if you forget how to use it, you can always check the help '?'.

Obviously a GUI (Graphical User Interface) instead of a CLI (Command Line Interface)
would be more suitable for all kind of users, and easier to understand and see. The advantage
of being a CLI is that is very light, allowing to browse easily large alignments. Also,
it can be used over the network without any problem, as we are actually using it
in this lab.

####Q9. What are the 3 required fields (i.e., columns) of a .bed file?
 
The three required fields for the .bed format are:

1. **chrom** - The name of the chromosome (e.g. chr3, chrY, chr2_random) or scaffold (e.g. scaffold10671).
2. **chromStart** - The starting position of the feature in the chromosome or scaffold. The first base in a chromosome is numbered 0.
3. **chromEnd** - The ending position of the feature in the chromosome or scaffold. The chromEnd base is not included in the display of the feature. For example, the first 100 bases of a chromosome are defined as chromStart=0, chromEnd=100, and span the bases numbered 0-99.


Command used to convert chr22 region to a bed file:

```bash
 bamToBed -i data/ERR001014.filt.bwa_aln.default.sorted.bam | awk '/^chr22_hg19/{if ($2>=1818000000 && $2<=18080000) print "chr22", substr($0, 11)}' > data/chr22_part.ERR001014.filt.bwa_aln.default.sorted.bed
 ```

#### Q10. Are your reads mostly within exons or within introns of the refseq gene CECR2 in this region? (Hint: exons are thicker lines than introns).

Most of the reads seem to be within exons.

#### Q11. Take a screenshot of the UCSC Genome Browser window with your submitted track visible. Include the screenshot in your report.

Link to picture here