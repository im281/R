#'---
#' title: "Lab 5"
#' date: "September 28, 2016"
#' author: ""
#' output: word_document
#'---
#'
#' All these exercises will require the latest PubH6002 library of functions. If you
#' haven't installed it yet, do so.  You can install it by going to the packages
#' tab and using Install > Install from Package Archive File, then selecting the 
#' file PubH6002_0.24.tar.gz
library(PubH6002) # The version should be 0.24

#' If you want the notebook to compile despite errors, remove the # 
#' from the beginning of the next line:
#allowErrorsInNotebook()

#'
#' Part 1: Numerical variables
#' ===========================
#' This exercise uses the Pima.te dataset from the MASS package. The dataset
#' includes measurement on a population of women of Pima Indian heritage living 
#' near Phoenix, Arizona. The women were tested for diabetes according to 
#' World Health Organization criteria.  The variables in this dataset are:
#' 
#' | Variable     | Meaning                                 |
#' |--------------|-----------------------------------------|
#' | npreg        | number of pregnancies.                  |
#' | glu          | plasma glucose concentration            |
#' | bp           | diastolic blood pressure (mm Hg)        |
#' | skin         | triceps skin fold thickness (mm)        |
#' | bmi          | body mass index                         |
#' | ped          | diabetes pedigree function              |
#' | age          | age in years                            |
#' | ageGroup     | age group in decades                    |
#' | type         | Yes or No: diabetic by WHO criteria     |
#' 
#' The data are in a file called pima.csv. We start by reading it in:
pima = read.csv('pima.csv')

#' Next, we "use" the pima dataset so we can easily use the
#' variables inside it
use(pima)


#'
#' #### Question 1
#' One of the important variables in this dataset is bmi, the body mass index 
#' (an indicator of high body fat). Here we are interested in comparing the BMIs
#' of diabebtics (type=Yes) to those of non-diabetics (type=No). Use the boxplot() 
#' function to create boxplots of variable bmi by variable type
boxplot(bmi ~ )


#'
#' #### Question 2
#' Do diabetics (type=Yes) have a higher or lower BMI in the sample?
#' 

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 3
#' Looking at the boxplots, do they seem about symmetric around the median or skewed?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 4
#' We are interested in whether BMI values differ between diabetics and non-diabetics in
#' the population, not just in the sample. Add notches to the boxplots to visually
#' assess this
boxplot( , notch=TRUE)



#'
#' #### Question 5
#' Do the notches overlap? What do you conclude about the difference in median
#' BMIs in the population?
#' 

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 6
#' If the notches did overlap, what could you conclude about the medians of BMI
#' in the population?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 7
#' We are interested in formally testing whether the diabetics and non-diabetics
#' have different mean BMIs in the population. Perform a t test for a difference in
#' means.
t.test( ~ )


#'
#' #### Question 8
#' From the output, what are the mean BMIs in the diabetic and non-diabetic 
#' groups in the sample? Is this consistent with the conclusions about medians
#' from the boxplots?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 9
#' From the output, what is the p-value? is it less than 0.05? Do you conclude 
#' that such a difference in means is (usual|unusual) if the populations means
#' of BMI are the same?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 10
#' Perform a permutation test instead of a t-test. 
permutation.test( ~ )



#'
#' #### Question 11
#' From the output, what are the mean BMIs for diabetics and non-diabetics in the sample
#' (same as above, hopefully)?
#' What's the difference between them? 

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 12
#' If there is no difference in mean BMI between diabetics and non-diabetics in
#' the population, how likely are we to see the sort of difference we're seeing in 
#' the sample? Do you conclude that this sort of difference in the sample is
#' (usual|unusual) if the population BMIs are the same?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 13
#' Repeat the permutation test above, but use plot=TRUE to display the permutation differences
#' and the observed difference in the sample. Does the sample value look unusual compared
#' to the typical values one expects to see if there are no differences in mean BMI in the
#' population?
permutation.test( ~ , plot=TRUE)

#' Answer: 
#' 
#' 
#' 




#'
#' #### Question 14
#' The previous tests looked at the means.  Since the distribution of BMI is
#' maybe a little skewed in each group, it would be interesting to compare
#' medians. Use a permutation test to compare the population medians.
#' 
permutation.test( ~ , statistic=median)


#'
#' #### Question 15
#' What are the sample medians in diabetics and non-diabetics? What's the
#' difference between the two medians? If the population medians are the same,
#' what is the probability of seeing a difference this extreme in the sample? If
#' the population medians are the same, would this be a usual|unusual sample
#' difference?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 16
#' One question of interest to the investigators is whether diabetes affects the variability
#' of BMI's, not just their values. One way to test this is to look at whether the standard
#' deviation of BMI is about the same in among diabetics and non-diabetics. Use a permutation test
#' to compare standard deviations between diabetics and non-diabetics
permutation.test(, statistic=sd)


#'
#' #### Question 17
#' What are the sample standard deviations in diabetics and non-diabetics?
#' What's the difference between these two sd? If the population standard deviations are
#' the same, what is the probability of seeing a difference this extreme in the
#' sample? Is the sample difference unusual?
#' 

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 18
#' Add plot=TRUE to the permutation test to visually assess how "typical" the
#' sample difference in standard deviations is. Compared to the sort of
#' differences you'd expect to see if diabetics and non-diabetics have the same
#' standard deviation for BMI in the population, does the sample difference look
#' unusual? Do the conclusions of the previous question seem reasonable?
permutation.test(, statistic=sd, plot=TRUE)

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 19
#' We now look at blood pressure. Produce notched boxplots for blood pressure
#' (variable bp) as a function of diabetes (variable type)
boxplot(, notch=TRUE)


#'
#' #### Question 20
#' Do the notches seem to overlap, or are they clearly non-overlapping? What do you conclude
#' about the difference in blood pressures in the population?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 21
#' Do a permutation test comparing mean blood pressures
permutation.test( ~ , plot=TRUE)


#'
#' #### Question 22
#' What are the mean blood pressures in the sample? What the difference between these means?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 23
#' If diabetics and non-diabetics have the same mean blood pressure in the population, what
#' is the probability of seeing a difference of -4.6406 or more in the sample? Is the sample
#' difference unusual?

#' Answer: 
#' 
#' 
#' 

