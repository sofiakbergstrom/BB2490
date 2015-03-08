## L2: Genome assembly reborn: Recent computational challenges

**Sequencing and NGS**

- Shotgun sequencing: Break the genome in small fragments and sequence them individually.
- Many short reads makes it very difficult to align, because the may fall in different places in the genome.
- High coverage is needed to ensure that all the bases in the genome are sequenced in some of the reads.
- Coverage is the ratio between the size of the set of reads and the real size of the genome, i.e 3X coverage means that the total size of the reads is three times the size of the genome.
- Sanger sequencing: Long reads (1-2 kpb), NGS sequencing parallell sequencing of fragments, lots of short reads. All NGS platform produce information about the read quality.
- De-novo sequencing for totally new genomes, NGS platforms for re-sequencing (makes it much more easy having the reference genome)

**Overlap computation**

- Read overlap computation requires in the worst case, the square of the number of reads provided to the assembler, because each read has to be compared with all other reads. 
