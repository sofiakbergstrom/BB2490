# 2015-01-21 - Genome Assembly

__By Lars Arvestad__

Genome assembly has been a lot about engineering in the last years. It is basically
impossible to cover all things in this course. We will be given an overview of it in this course.

Assembly of genes are not the topic of this course. From easier to more complicated: Bacterial
genome (circular) --> Eukariotic genome (size?, haploid/diploid/polyploid?...) --> Metagenomics. We
will more work in Eukaryotic genomes.

Genome assembly is not only for _de novo_, but also for fixing **bad** assembly. Structural
Variant Analysis --> Find out insertions and deletions.

Shotgun sequences --> We pick up only the ends or the reads, and try to solve the
puzzle (slides)
   |
   ___ BAC-to-BAC technique was used by the people that assembled the first human Genome.

Whole Genome Shotgun is a better technique (was used for the first time by Celera company
to make competence to the public Genome project), but it requires way more computational
power. 

Slide 7 --> Hybrid assembly: It was not until a year ago that we started to have "good" software
to combine both long and short reads from PacBio and Illumina. Merging assemblies
works "ridiculously" well :-)

Slide 8 --> People is really happy seeing contigs of 50K nucleotides in Eukaryotic orgs. Tends to
be 10K

On the Greedy assembly, one of the mistakes is because large overlaps occur _by chance_.

Layout stage --> Graphs problem! Try to find Hamiltonian path. 

Slide 14 --> Pair-ends, mate-pairs... 

Slide 17 --> De Bruijin Graph, representation of the target Genome. Each vertice
represents a substring of the targe Genone. [wiki description](Read http://en.wikipedia.org/wiki/De_Bruijn_graph).
The first Brujin Graph (when we do not know the target Genome) is generated from sequence
fragments (check the slide). From that, you can infere the target genome. 

_Genomve Coverage_ - How many times is a position sequenced, **on average**? (Number or reads * their lengths)/size of the Genome.
Lander Waterman model for determining how good coverage we do need. Given C=1, what is P(X>0) = 1 - Pr(X=0) = ... approx 63% (known constant!).
Problem: It assumes uniform distribution.

Quality --> N50, slide 23. Has several issues, depending on the contig size. Bad
assemblies could have high N50s. 
.
Problem: It assumes uniform distribution.

_Quality_

N50, slide 23. Has several issues, depending on the contig size. Bad
assemblies could have high N50s. Paper about N50, From the "Assemblathon 2"... Brandam et al.


Student presentations for next lecture (check out slides for the papers). Papers in KTH social.
