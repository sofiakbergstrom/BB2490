# Project Diary
## 2015-03-10
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
	if 'Simon' in name:
		project = 'A.Simon'
	elif 'Dixelius' in name:
		project = 'C.Dixelius'
	elif 'Lundeberg' in name:
		project = 'J.Lundeberg'
	elif 'Street' in name:
		project = 'N.Street'
	elif 'Larsson' in name:
		project = 'O.Larsson'
	elif 'Pettersson' in name:
		project = 'U.Pettersson'
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

## 2015-03-09
Seminar 3: poster presentation. The main things to remember is to not add too much text, to have a clear structure and don't make the background to messy. It can be nice to add headers to the graphs that we add that describes the conclusion drawn from the picture rather that just have regular headers. The different parts of the poster should easily be found and specially the aim. 

We looked at the results from the projects that are done. We found a file that had each samples length count, we can use this to create the heatmap. These are located in six different folders, one for each project. Example for Simon's data:

```
/proj/b2013064/nobackup/BB2490_KTH_miRNA_project/data/A.Simon_14_01/lengths
```

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







