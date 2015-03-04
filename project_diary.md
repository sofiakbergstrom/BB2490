# Project Diary
## 2015-02-04
Uppmax is down. 
We participated at a workshop at Scilife about miRNA. 
We decides to do a heat map over length distribution. 

I started to try to understand how to create a heat map.
I used some available Basketball statistics, located in the following link: http://datasets.flowingdata.com/ppg2008.csv
test <- read.csv("http://datasets.flowingdata.com/ppg2008.csv", sep = ",")
# To sort the data. I sorted a column called PTS, but you can sort any column.
test <- test[order(test$PTS),]
# To name each row according to one of the columns (the column "name" in this case)
row.names(test) <-data$Name
# To get rid of the column that stores the names (since we called the row according to the name, I wont need that anymore)
test <- test[,2:20]
#To change the data into a matrix format
test_matrix <- data.matrix(test)
# Create the heatmap!
nba_heatmap <-heatmap(nba_matrix, Rowv = NA, Colv = NA, col = heat.colors(256), scale = "column", margins=c(5,10))

The next step is to do this on our data. 


## 2015-03-03
Seminar 2

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

## 2015-02-25
Read two articles:
* Next Generation sequencing of miRNAs – Strategies, Resources and Methods
* Transcriptome and genome sequencing uncovers functional variation in humans

Our meeting was canceled since Guillermo was ill. 

I saw a couple of videos on youtube about miRNA just to get a better understanding of why they are important to invetigate and to get a better understanding of how they are generated. I also saw some videos describing the similarities and differences between miRNA and siRNA (which both regulate gene expression). 

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







