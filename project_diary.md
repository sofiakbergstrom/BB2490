# Project Diary
## 2015-03-18
Today we will finish the poster! =D

We want to have a barplot of one samples length distribution side by side with heatmap in order to make it clear what the heatmap really represents. I made one in R over the length that was removed (just to learn how to do it). When Guillermo have created the files with the remaining sequnce length, I will use that instead.
```
l <- read.csv('make_barplot.txt')
count <- l$Count
png('length_dist.png')
barplot(count, xlab = 'Length', ylab = 'Count', main = 'Length Distribution', col = 'lightblue'. names.arg = c(3:51))
dev.off()
```
![Length Distribution](https://raw.githubusercontent.com/sofiakbergstrom/BB2490/master/Images/Length_distribution.png)

## 2015-03-17
Uppmax is down since their main computer room's switch broke. That is a problem. 
We have decided to use cutadapt and fastQC for all project (like our previosly plan we had in the beginning of the project). We want to do this in order to see the length distribution and number of trimmed reads with out removing any data. Fortunately, Uppmax started to work again so we could do this. 

The output after cutadapt looks like this:
```
cutadapt version 1.5
Command line parameters: -f fastq -a TGGAATTCTCGGGTGCCAAGG -q 10 --match-read-wildcards -O 3 -m 18 -o /scratch/47530/miRNAtmp_62NDp7/MERGED_P962_101_ATCACG_L001_R1_001_trimmed.fq /scratch/47530/miRNAtmp_62NDp7/MERGED_P962_101_ATCACG_L001_R1_001.fastq
Maximum error rate: 10.00%
   No. of adapters: 1
   Processed reads:     18911354
   Processed bases:    964479054 bp (964.5 Mbp)
     Trimmed reads:      2013503 (10.6%)
   Quality-trimmed:      3302489 bp (3.3 Mbp) (0.34% of total)
     Trimmed bases:     46118756 bp (46.1 Mbp) (4.78% of total)
   Too short reads:       321000 (1.7% of processed reads)
    Too long reads:            0 (0.0% of processed reads)
        Total time:    306.74 s
     Time per read:      0.016 ms

=== Adapter 1 ===

Adapter 'TGGAATTCTCGGGTGCCAAGG', length 21, was trimmed 2013503 times.

No. of allowed errors:
0-9 bp: 0; 10-19 bp: 1; 20-21 bp: 2

Overview of removed sequences
length    count    expect    max.err    error counts
3    44502    295489.9    0    44502
4    34837    73872.5    0    34837
5    83042    18468.1    0    83042
6    39927    4617.0    0    39927
7    60776    1154.3    0    60776
8    62437    288.6    0    62437
9    59197    72.1    0    58992 205
10    96271    18.0    1    93788 2483
11    65293    4.5    1    64036 1257
12    46121    1.1    1    44984 1137
13    30409    0.3    1    29609 800
14    27116    0.1    1    26647 469
15    67770    0.0    1    66668 1102
16    42372    0.0    1    41469 903
17    43587    0.0    1    42428 1159
18    25449    0.0    1    24609 811 29
19    38346    0.0    1    36980 1328 38
20    35312    0.0    2    33593 1255 464
21    29634    0.0    2    28160 1149 325
22    28959    0.0    2    27525 1086 348
23    23504    0.0    2    22116 979 409
24    21952    0.0    2    20652 886 414
25    18489    0.0    2    17392 790 307
26    21235    0.0    2    19985 834 416
27    49785    0.0    2    47348 1957 480
28    93541    0.0    2    89249 3409 883
29    288311    0.0    2    275332 10270 2709
30    106926    0.0    2    102582 3568 776
31    70897    0.0    2    67926 2459 512
32    23833    0.0    2    22872 783 178
33    19395    0.0    2    18623 581 191
34    18476    0.0    2    17657 552 267
35    17718    0.0    2    17004 585 129
36    17850    0.0    2    17079 641 130
37    17336    0.0    2    16582 619 135
38    15495    0.0    2    14703 582 210
39    14141    0.0    2    13512 492 137
40    14581    0.0    2    13824 622 135
41    12524    0.0    2    11781 644 99
42    10737    0.0    2    10031 542 164
43    13263    0.0    2    12772 399 92
44    11209    0.0    2    10641 475 93
45    6419    0.0    2    6090 255 74
46    2691    0.0    2    2511 130 50
47    864    0.0    2    750 71 43
48    670    0.0    2    536 84 50
49    1054    0.0    2    739 172 143
50    744    0.0    2    562 128 54
51    138506    0.0    2    120276 16363 1867

Analysis complete for MERGED_P962_101_ATCACG_L001_R1_001_trimmed.fq
```
We get the number of trimmed reads  *Trimmed reads:      2013503 (10.6%)*
And the overview is over trimmed sequnces. In the first row 3 bases was removed in 44502 reads, which menas that we need to take the whole read length minus 3 in order to get the remaining length of the read. 

Guillermo will create a file for each sample that contains the length in column 1 and the count in column 2. These files will be organized according to different projects, i.e. one folder per project that contains one file per sample. I will then make a csv file from all that and send it to Yim that will try to fix the color and so on on the heatmap. 

Me and Guillermo had a meeting with Phil and discussed the project. We discussed the heatmaps color range and why it is more convienient to use a color gradient instead of use three distinct colors that corresponded to colorbreaks that we determine by our selves. You don't want to alter the heatmap in a way that makes it looks better than the actual result. It is a bit fishy. 

I looked through the contamination results from Marc's pipieline. The reads are mapped against sponges, nematodes, insects, lophotrochozoa, echinoderms, fish, bird/ reptiles, rodents and primates.  
```
Project 1: had reptile/bird and rodents in all 21 samples.
Project 2: non of the 22 samples matched anything.
Project 3: had primates in all 56 samples.
Project 4: had insects in 7/123 samples. The other didn't match anything.
Project 5: had primates in all 62 samples.
Project 6: has primates in all 8 samples.
```

So I assume that Project 3,5,6 had samples from human, and we know that the Project 1 project consists of samples from some reptile so those results also make sense.

I don't know why the samples corresponding to Project 2,4 projects look like that though. I want to know what kind of miRNA did they used. It would be nice to know in order to interpret the result that non or few of their reads mapped.

## 2015-03-16
We have decided to focus on the heatmap and the contamination part. We want the heatmaps color to be a gradient from white to red where red indicates more reads. 

Marc's pipeline is filtering the reads and removes all read that are longer than 36 bases. One of our aims is to try to get a hunch of how bad the libary prep was for the six projects (we know thay they was bad), which means that we want to know how many reads we had that was really long. In the libary prep is adapters ligated to the ends of each fragment and a size selection performed. If the size selection didn't worked properly, too long fragments will still be present. When the fragments are sequenced, the once that are too long will not be read completely. This means that the adapters wont be included in the read. When we then are trimming the reads, when we are removing the adapters, we will get a number of reads that haven't been trimmed (since they doesn't have any adapter to remove) and that number can be compared to the number of trimmed reads. This will be a indication of how suffcient the libary prep was.    

## 2015-03-14
The jobs wont start on Uppmax until moday. We can change the time allocation but then we risk that the job is killed before it finishes. Guillermo send some jobs anyway with shorter allocation time and they will soon start!! =D START_TIME 2015-03-15T02:57:00
This mean that we should have everything tomorrow. 

We think however that the read count for the length distribution that we already have is correct. 
I tryed to run the script I wrote that merges all the length distributions from all samples of all projects into one csv file. First I did it on Uppmax, it started off well and did it in a successful way for some of the projects but when it came to the project called Lundeberg it stopped and said "Permission denied". Don't know why. 

Guillermo sent both Yim and me a .tar with all the length counts instead, and when I tryed the scipt locally it worked. This mean that we have a csv file with every read count between 18 and 36 bp for all 113 samples from the 6 projects. I sent it to Yim and Guillermo. It has some strange numbers however, many 0 and 1 in Lundebergs project. Guillermo said that it was a comment for this project "Some samples have low RIN value and we wonder if they should be treated with RiboZero prior to library prep". I will look into what that means tomorrow.  

## 2015-03-13
Guillermo has looked at the results and he also thinks they look weird. There are lots of errors in the log and the accual summary reports haven't been generated. Guillermo will recreate the steps without doing the whole analysis again. Where waiting for uppmax to start to job...

It seems like the qulity control step with fastx_quality_stats and fastq_quality_boxplot_graph.sh creates a boxplor with quality score vs read position. 

## 2015-03-12
Guillermo has made a summary over which steps and tools the pipeline uses. 
The quality control step uses two binaries called fastx_quality_stats and fastq_quality_boxplot_graph.sh. We need to understand what those are. 

I found this info (http://hannonlab.cshl.edu/fastx_toolkit/commandline.html): 
FASTX Statistics

	$ fastx_quality_stats -h
	usage: fastx_quality_stats [-h] [-i INFILE] [-o OUTFILE]

	version 0.0.6 (C) 2008 by Assaf Gordon (gordon@cshl.edu)
	   [-h] = This helpful help screen.
	   [-i INFILE]  = FASTA/Q input file. default is STDIN.
	                  If FASTA file is given, only nucleotides
			  distribution is calculated (there's no quality info).
	   [-o OUTFILE] = TEXT output file. default is STDOUT.

	The output TEXT file will have the following fields (one row per column):
		column	= column number (1 to 36 for a 36-cycles read solexa file)
		count   = number of bases found in this column.
		min     = Lowest quality score value found in this column.
		max     = Highest quality score value found in this column.
		sum     = Sum of quality score values for this column.
		mean    = Mean quality score value for this column.
		Q1	= 1st quartile quality score.
		med	= Median quality score.
		Q3	= 3rd quartile quality score.
		IQR	= Inter-Quartile range (Q3-Q1).
		lW	= 'Left-Whisker' value (for boxplotting).
		rW	= 'Right-Whisker' value (for boxplotting).
		A_Count	= Count of 'A' nucleotides found in this column.
		C_Count	= Count of 'C' nucleotides found in this column.
		G_Count	= Count of 'G' nucleotides found in this column.
		T_Count	= Count of 'T' nucleotides found in this column.
		N_Count = Count of 'N' nucleotides found in this column.
		max-count = max. number of bases (in all cycles)

FASTQ Quality Chart

	$ fastq_quality_boxplot_graph.sh -h
	Solexa-Quality BoxPlot plotter
	Generates a solexa quality score box-plot graph 

	Usage: /usr/local/bin/fastq_quality_boxplot_graph.sh [-i INPUT.TXT] [-t TITLE] [-p] [-o OUTPUT]

	  [-p]           - Generate PostScript (.PS) file. Default is PNG image.
	  [-i INPUT.TXT] - Input file. Should be the output of "solexa_quality_statistics" program.
	  [-o OUTPUT]    - Output file name. default is STDOUT.
	  [-t TITLE]     - Title (usually the solexa file name) - will be plotted on the graph.

## 2015-03-11
Trying to look into the data that the pipeline has generated in order to get some ideas of what we have. All projects are however not finished yet. 


## 2015-03-10
Yim will not be in Sweden until the project should be finished, and you can't connect to Uppmax from abroad. This means that we have to come up with some solution of how she can access the data.  

I created a python script that converts all the 113 lng-files with length distribution into one single csv-file that can be used when creating a heatmap. 
```
#! /usr/bin/env python

#Function 1: This function reads the files one by one and sends them to function 2. 
def read_input_files(argv):
	argv = argv[1:len(argv)-1]
	count = 0
	for element in argv:
		if count < (len(argv)):
			name = argv[count]
			lng_file = open(argv[count])
			function3 = get_sample_name(lng_file, name)
			lng_file.close()
		count += 1

#Function 2: This function gets the right sample name and then sends the info to function 3
def get_sample_name(lng_file, name):
	sample = name[len(name)-7:len(name)-4]
	if 'Project1' in name:
		project = 'Project1'
	elif 'Project2' in name:
		project = 'Project2'
	elif 'Project3' in name:
		project = 'Project3'
	elif 'Project4' in name:
		project = 'Project4'
	elif 'Project5' in name:
		project = 'Project5'
	elif 'Project6' in name:
		project = 'Project6'
	else:
		print 'Something is wrong'
	function3 = convert_file(lng_file, project, sample)

#Function3: This function selects the read count and write them to an output in the right format
def convert_file(lng_file, project, sample):
	output_file.write(project +':' +sample)
	for line in lng_file:
		k = line.split()
		if len(k) == 2:
			read_count = k[1]
			output_file.write(',' + read_count)
	output_file.write('\n')

# MAIN
print 
print
print

from sys import argv

#Info about what you should write in the command line
if argv[1] == 'h':
	print 'To start the program you should write' + '\n' + './Convert_files /path/to/files/*.lng <name_on_the_output_file>'

#Starts the process
else:
	output_file_name = argv[len(argv)-1]
	output_file= open(output_file_name, 'w+')

	#create the header for the csv-file
	output_file.write('Sample,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36' + '\n')
	start = read_input_files(argv)

	output_file.close()
	print "A file called %s.fa is generated in this directory." % output_file_name

```

Of our six projects are two projects are still running, the rest are done. We are waiting for those to finish. The err-files for the finished projects look however a bit strange. I have asked Guillermo about his opinion. The out-files are also empty which seems odd.  

## 2015-03-09
Seminar 3: poster presentation. The main things to remember is to not add too much text, to have a clear structure and don't make the background to messy. It can be nice to add headers to the graphs that we add that describes the conclusion drawn from the picture rather that just have regular headers. The different parts of the poster should easily be found and specially the aim. 

We looked at the results from the projects that are done. We found a file that had each samples length count, we can use this to create the heatmap. These are located in six different folders, one for each project. 

This length counts are not located in a long fastaQC-file as the files we looked at yesterday. This might make the script that should convert the data from all 113 samples into the right format easier. 

Me and Yim was suppose to look at the data that has been created and try to figure out what we want to do with it to be able to analyse it. But we couldn't connect to Uppmax. 

I made a first draft on the poster according to the things I think is important (Clear, "airy", easy to follow).





## 2015-03-09
Guillermo teached me how to add pictures to the diary. I will add some that I wanted to upload last week.
I can't connect to csc where my txt-file is located with the data for project 2. I will try again later today. 
The connection started to work and I have copied the files I needed. But now I can't connect to Uppmax...  
I read the article for seminar 3 about poster presentation and looked at some scientific poster examples. I think we should have text boxes in one color and a thinner box in another color behinde those with the subtitles Method, Results, Conclusion and so on. I also think we should have a special box that are easily seen with our research question.    

I tryed to write a script that will convert the data from all the different fastaQC-files and make them into a format that R can read. But I had some problems with the extraction of the right data from the files. I need to figure out a way to do that. 

3/6 projects are now finished in Uppmax. 
If I write *jobinfo -u guilc* I can see the onces that are still running. 

Yim succeded to fix the heat map for project 1 yesterday, yay! I can't load gplot (which is needed for some of the heatmap tutorials) since I have an older version of R. That was the reason to why I couln't get heatmap.2() to work. But now, on Yim's heatmap, the colors depend on every column which mean that we can see that there are more reads of some lengths. 

## 2015-03-08
I managed to access our folder in Uppmax today, I do not know why it didn't work the other day. 
I'll continue trying to figure out how to change the heatmaps and how to convert the data from the fastaqc_data.txt files fast into the right format. Guillermo has started Marc's pipeline and I looked at the files, but the analysis of the six projects are not finished. 

## 2015-03-06
Our goal today is to create heatmaps on our data. Me and Yim tryed to do this on Project 1 and Project 2. We used the length distribution that was located in fastaqc_data.txt file that was created for each sample when doing the FastaQC part. We extracted the length distribution and put in a file and created a heat map for each project. 

First we wanted to do all samples in the same heat map, but the different projects didn't range between the same length. Project 1 ranges between a length of 18 to 101, and prpject 2 ranges from 18-51. An other difference is that project 1 takes steps of two length at a time, they used 18-19, 20-21, 22-23 an so on. And project 2 have different length distribution number for each length. 
We converted the values into two fiels (called P1len.txt and P2len.txt for project 1 and 2 respectivelly), where each row corresponded to different samples and each value were separated by ",". 
I worked on Project 2, and Yim worked on project 1.
I used the following commands:
```
test <- read.csv("P2len.txt", sep = ",")
row.names(test) <-test$Sample
test <- test[,2:35]
#We wanted to change the columns names (they were all the format X18, X19 and so on). 
colnames(test) <- c(18:51)
test_matrix <- data.matrix(test)

#To create the heatmap. I added a title called Length Distribution and x-label and y-label. 
test_heatmap <-heatmap(test_matrix, Rowv = NA, Colv = NA, col = heat.colors(256), scale = "column", margins=c(5,10), main = "Length Distribution", xlab = "Length Distribution", ylab = "Sample")
```
I also wanted to add a dendrogram to the rows, but it seems like I need to use heatmap.2() and I can't figure out how to install that package. It shouldn't be that hard but I just isn't working. 
If I get it to work, the last command should be: 
test_heatmap <-heatmap.2(test_matrix, Rowv = NA, Colv = NA, col = heat.colors(256), scale = "column", margins=c(5,10), main = "Length Distribution", dendrogram = "rows")

We tryed to fix the layout of the plots by changing the margins and so on. 

There were however some things in the two heatmaps that we didn't understand. The color for a sample didn't become brighter where they corresponded to a high count. We realized that the color described each column distribution. If a sample has a higher count than the other samples at a length of 18, that would be indicated by a brighter color. But if the samples count on the length 22 was much higher, but the difference between that sample and the other samples was smaller, the color would not be that bright. We don't want each column to have a color distribution relative to that particular length, we want the whole heatmap to have the same color for the same count. We need to figure out how to do that. 

Uppmax is up and Phil has given us access to the application project b2013064. Guillermo has created a directory */proj/b2013064/nobackup/BB2490_KTH_miRNA_project* where all our data and Marc Friedländer's pipeline SMARTAR are located. Neither me nor Yim can however access that folder at the moment. The final dataset that we will analyze consists of six projects with 113 samples in total.

## 2015-02-04
Uppmax is down. 
We participated at a workshop at Scilife about miRNA. 
We decided to work with Marc Friedländers pipeline instead of the first pipeline that we was supposed to use. 
This new pipeline is however written in perl which non of us have any experience with. It should however not be that hard to modify it so that we can use it. 

We decides to do a heat map over length distribution that we have for the two projects. 

I started to try to understand how to create a heat map.
I used some available Basketball statistics, located in the following link: http://datasets.flowingdata.com/ppg2008.csv

```
test <- read.csv("http://datasets.flowingdata.com/ppg2008.csv", sep = ",")

#To sort the data. I sorted a column called PTS, but you can sort any column.
test <- test[order(test$PTS),]

#To name each row according to one of the columns (the column "name" in this case)
row.names(test) <-test$Name

#To get rid of the column that stores the names (since we called the row according to the name, I wont need that anymore)
test <- test[,2:20]

#To change the data into a matrix format
test_matrix <- data.matrix(test)

#Create the heatmap!
test_heatmap <-heatmap(test_matrix, Rowv = NA, Colv = NA, col = heat.colors(256), scale = "column", margins=c(5,10))
```
The next step is to do this on our data. 

I also showed Yim how she could create a heat map, and how to use R. 

## 2015-03-03
Seminar 2. 
Yim's flight was delayed so I and Guillermo did the presentation on out own. I presented the parts that Yim was supposed to present. 

## 2015-03-02
Me and Guillermo created the presenation for seminar2. 
One recommendation for the other project will be to use Trello and one problem that we have had are the limited space available at our home directories at Uppmax. 

## 2015-02-26
We has a project meeting were we decided to use trello.com as our project platform were we could discuss problems, add things that we should do and so on. Guillermo had tested FASTQC and showed us the results. The average length was around 50, but this is probably due to the fact that the adapters hadn't been removed. 

Some questions that came up during the meeting:
* How do you use and interpretate the GC content? (Which should be used as a quality check)
* What should we be aligning against in the mapping part? 
* Are Bowtie2 the best choice? 
* How and why do we use insert length as a quality check? 

Me and Yim signed the NDA form which means that we are allowed access to the data. 
I copied the data to my home directory in Uppmax. 

We also decided to use GitHub. Guillermo has created a project directory and I can add it by using the following commands:
```
git remote add guillermo https://github.com/guillermo-carrasco/bio_data_analysis.git

git pull guillermo master 
```
## 2015-02-25
Read two articles:
* Next Generation sequencing of miRNAs – Strategies, Resources and Methods
* Transcriptome and genome sequencing uncovers functional variation in humans

Our meeting was canceled since Guillermo was ill. 

I saw a couple of videos on youtube about miRNA just to get a better understanding of why they are important to investigate and to get a better understanding of how they are generated. I also saw some videos describing the similarities and differences between miRNA and siRNA (which both regulate gene expression). 

## 2015-02-24
Read two articles: 
* Reproducibility of high-throughput mRNA and small RNA sequencing across laboratories 
  which investigated the sources to technical and interlaboratory differences in order to get a better understanding of them. 
* Functional shifts in insect microRNA evolution
  
## 2015-02-23
I read the things it have written and learnt about miRNA in earlier courses and quickly read the four articles that we should read until wednesday. 

## 2015-02-20
Seminarium 1 with short presentations. 
We decided to meet next Wednesday at 17.00 and Thursday, the same time. 

We decided to read four articles:
  Next Generation Sequencing of miRNAs – Strategies, Resources and Methods
  Functional shifts in insect microRNA evolution
  Reproducibility of high-throughput mRNA and small RNA sequencing across laboratories.
  Transcriptome and genome sequencing uncovers functional variation in humans.

## 2015-02-19
Project start. I will work with Guillermo Carrasco and Yim Wing Chow. 
Guillermo sent us an email with info about the project. 







