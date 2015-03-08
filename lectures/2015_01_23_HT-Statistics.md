# 2015-01-23 Statistics For High-Throughput experiments

_Notes taken from the video-lecture https://www.youtube.com/watch?v=0Q8sIk92KbE_

Quality metrics change a lot with HT experiments, due to the large number of observations 
we do in this kind of experiments. Thousands or millions of reads makes the likelihood
of "features" to be significant higher. 

Experiments aim at describing traits or a set of traits from a population. We do 
that by sampling the population, which can lead to sampling errors. Also measurement
errors. 

What we want are procedures that help us determine differences between the main
of the features within the healthy and disease population. 

Hypotheses testing: Null hypothesis (no difference between means) vs alternative hypotheses.
We usually __assume__ that the null hypothesis is correct. Then, when the probability that a difference
between two samples become small enough, we reject the null hypothesis. For that 
the p-value is used. The p-value is the probability that two observations are different
under the assumption of null hypotheses. If the p-value is too small (usually 0.01 or 0.05),
we reject the null hypotheses. 

Use t-student for calculating p-value 

Analysis of variants (ANOVA) for more than 2 populations/features 

It does make a big difference if we compare one thing at a time or many things at
a time: multiple hypothesis correction. 

Bonferroni correction are extremely conservative, False Discovery Rates (FDR) are 
a better way for control the FDR. FDR is the expectation value of fraction of tests
below threshold x that are generated under the null hypothesis. So a 2/10 of the features
accepting H0 under a threshold of 10, means a 20% of FDR. The threshold is selected...
don't know how.

Q: How do you select the threshold for the p-value list on the list of features distributed under
the null and alternative hypothesis?

p-values are uniformly distributed under the null hypothesis!

To calculate the optimap Pi zero, the do it with multiple lambdas, then fit a third
degree polynomial. 

q-value:

FDR from explicit null models 

Posterior error probability or local FDR: probability that an identification scoring
t is incorrect. When we are interested in assessing the quality of a particular read-out


# 2015-01-28 Questions about the paper by students

This part of the course is usually considered the most cumbersome part of the course. 

__On one slide ... , there is a ^ over FDR and pi. What does the ^ mean?__

It is the statisticians way of expressing an estimate

_NOTE_: It is way easier to assume that H0 is true, as your treat all the features in the same 
way, all have the same frequency.

__What does it mean to say a feature is generated under null/alternative hypothesis? Is it the same as saying an observed outcome is more likely under null/alternative hypothesis?__
The feature is generated under the assumption that H0 is true, and __it is not__ the same
than saying an observed outcome is more likely under null/alternative hypothesis.

__How usual/unusual is it to be able to create an ... null model for the test you run? What aspect of the test would make it possible to do?__
For quantification is quite straightforward: You basically want to assume that there
is no difference betweem populations. 

__How can we ensure that we will get a well calibrated high throughput experiment?__
We basically can't...

__How do we choose between Anova and t test when we have only two population?__
ANOVA lets you work with more than 2 populations, and it is more flexible, but they're
basically the same. 

__It wasn't very clear to me the difference between Bonferroni correction and FDR, is it the strictness of Boferroni corrections only?__
Basically yes, and it is way faster and easier to calculate, so you may want it if you
need speed.	


__NOTE:__: p-value is good to estimate a single statistic, but if you want to condense
all the information of all the reads in your experiment, then you need FDR. Think about the
example of the lottery. The probability of winning the lottery is about 1/1M if you buy a 
single ticket, but if a guy buys half a million tickets, he/she has about 50% of
winning the lottery (even if the individual probability is still 1/1M)
