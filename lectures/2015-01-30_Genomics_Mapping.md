# 2015-01-30 Genomics: Mapping

## Lecture notes

Prepare for the quiz: Trapnell and Salzberg: How to map billions of short reads 
onto genomes.

If you're mapping paired reads and it turns out that they're too close in the mapping
(say 50bp while insert size is 700bp), probably you're missing some information in the
contig. Same the other way around, but you have too much information.

If you're an albino, you're missing a piece of DNA in some gene...

Structural variations between really small (1) to really big (1000s) of nucleotides
are easy to detect, in between is harder. The harder seems to be indels on 10s of
nucleotides. 

SAM/BAM files have become the de-facto format for all aligners.

Bowtie2 gives significantly better results for scaffolding than BWA.

## Paper notes

### Feature-by-feature evaluating de-novo assembly 

_Notes and/or questions from the paper_

_Definition_: Sensitivity and specificity are statistical measures of the performance of a binary 
classification test, also known in statistics as classification function. 
**Sensitivity** (also called the true positive rate, or the recall rate in some fields) 
measures the proportion of actual positives which are correctly identified as such 
(e.g., the percentage of sick people who are correctly identified as having the 
condition), and is complementary to the false negative rate. **Specificity**
(sometimes called the true negative rate) measures the proportion of negatives 
which are correctly identified as such (e.g., the percentage of healthy people who
are correctly identified as not having the condition), and is complementary to the false positive rate.

- A still unexplored area is the relationship (i.e statistical independence) among
different features. Note that FRC simply counts the features within each contig but
it cannot account for correlations among different features. 

- Sequence assembly problem can thus be seen as a (supervised) machine learning problem,
whose goal is to select the best subset of features distinguishing better assemblers
from marginal ones. 

- SNP are usually good indicators of collapse or miss-assembled regions. 

_Presentation:_

Evaluating assemblers with simulated data may bring to misleading results, as the 
differences with real data are visible. 

Coverage here is not the same than when sequencing!! It means the percentage of 
genome sequenced!

**Q:** If we evaluate _all_ assemblers with simulated data, shouldn't that be fair enough
for the evaluation? Basically they have not fidelity to the biology. 


### Genome assembly reborn: Recent computational challenges

They are going to assemble a small sequence on the blackboard!

They have the sequence: ACGATCCTCGACCGT

- Split it in k-mers of length 5, with a sliding window of 2 (instead of one), 
and hen they form 4-mers with each one of the 5-mers.

- Then for each 4-mer, create 3-mers **without repeats** (these will be the vertexes of
the graph)

**Q:** What is the point of steps 1 and 2? **A:** well, to form the 4-mers... have in
mind that the sequence is not known at the beginning

- They connect the 3-mers to create the 4-mers:

1 -- TCGA --> 2 -- CGAT --> 3 .... so they form a graph of 2-overlapping 3-mers

**Q:** What determines the length of the K-mers, and how does that influence in the
result? **A:** Approximate 25 for bacterial and 30 for eukariotyk, I guess it is a
balance between quality and precision and quality.

Problems: If you have a sequencing error, the whole graph screws up (or the error 
grows exponentially). There are modules in genome assemblers that treat with these
errors, bubble-poppers? Though is very difficult to determine if it is a real read
error or a biologically significant feature. Specially tricky in plan genomes: highly
eukariotik.