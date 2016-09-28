#'---
#' title: "Lab 4"
#' date: "September 21, 2016"
#' author: ""
#' output: word_document
#'---
#'
#' All these exercises will require the latest PubH6002 library of functions. If you
#' haven't installed it yet, do so.  You can install it by going to the packages
#' tab and using Install > Install from Package Archive File, then selecting the 
#' file PubH6002_0.23.tar.gz
library(PubH6002) # The version should be 0.23

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
#' (an indicator of high body fat). Get a histogram/boxplot for the variable bmi
hist() 


#'
#' #### Question 2
#' The figure shows a few outliers.  Use the summary() function to figure out
#' how large the largest value is:
summary()  

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 3
#' The distribution of bmi is a bit skewed. Is it skewed to the left or to the right?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 4
#' Would a log transformation possibly help? why? Would an x^2 transformation help? why?

#' Answer: 
#' 
#' 
#' 




#'
#' #### Question 5
#' Let's try a log transformation. We're going to create a new variable. Let's call
#' it lbmi (the name can be anything as long as you remember it!) Check that the
#' new variable appears in your environment.
lbmi = log(bmi)

#' And now let's look at the histogram of this new variable. Does it
#' look less skewed than bmi?
hist() 

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 6
#' Let's also try a square transformation. This time, let's call the variable qbmi
qbmi = bmi^2   # the square of bmi

#' Look at the histogram of qbmi. Is less skewed than bmi?
hist() 

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 7
#' There is a concern that extreme BMI values may be unduly influential on the
#' mean and standard deviation. Produce an influence plot for the mean of bmi
influencePlot(   ,mean)



#'
#' #### Question 8
#' What's the observation number of the most influential value?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 9
#' From the influence plot, by how much does the mean of bmi change when this 
#' observation is dropped? If we consider changes in mean BMI of less than 0.5
#' not worrisome, is this influential observation a major concern?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 10
#' Click on "pima" in your environment (not on the blue arrow!) to open it up. Scroll
#' down to the offending observation: what is the bmi for this observation?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 11
#' Produce an influence plot for the standard deviation of bmi
influencePlot(     ,sd)



#'
#' #### Question 12
#' What's the most influential observation? is it the same one?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 13
#' By how much does the standard deviation change when this observation is
#' dropped? If we only worry about changes of more than +/- 0.2 for the standard
#' deviation, is this observation influential enough to be a problem?

#' Answer: 
#' 
#' 
#' 

 

#'
#' #### Question 14
#' Produce an influence plot for the median
influencePlot(    ,median)

#' Are any observations influential?


#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 15
#' Another important measure of obesity is variable skin which measures 
#' triceps skin fold thickness. Produce an influence plot for the mean 
#' of this variable
influencePlot(skin,mean)

#' Does anything stand out on this plot?

#' Answer: 
#' 
#' 
#' 


#'
#' Part 2: Categorical variables
#' =============================
#' The variable ageGroup contains the age of the participants, grouped into
#' 10 year categories.

#'
#' #### Question 16
#' Use the barplot function to display the frequencies of ageGroup
barplot() 


#'
#' #### Question 17
#' Do you see any problems with the ageGroup variable?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 18
#' Suppose we decide to combine the age groups 51-60, 61-70 and 71+ into a single
#' combined category called 51+, and store the result in a new variable called
#' newAgeGroup. Complete the code below
newAgeGroup = combineLevels(ageGroup, '51-60',   ,  ,label='51+') 

#' Verify that the variable appears in your global environment



#'
#' #### Question 19
#' Get a barplot of the new variable, newAgeGroup. 
barplot() 


#'
#' #### Question 20
#' Redefine newAgeGroup to combine 41-50 and 51+ into a single category called '41+'.
newAgeGroup = combineLevels(newAgeGroup, , ,label='41+') 




#'
#' #### Question 21
#' Get a barplot of the new and improved newAgeGroup. 
barplot() 


#'
#' #### Question 22
#' As a double check, let's look at the summary of the original ageGroup variable,
#' and the summary of the newAgeGroup variable:
summary(ageGroup)
summary() 


#'
#' #### Question 23
#' Instead of combining the age groups from 41 on, suppose we wanted to drop them,
#' and store the result in a new variable called reducedAgeGroup Complete the
#' code below:
reducedAgeGroup = combineLevels(ageGroup, , , , ,label=NA)



#'
#' #### Question 24
#' produce a barplot of the variable reducedAgeGroup
barplot() 


#'
#' #### Question 25
#' as a check use the summary() function to look at the new variable selectedAgeGroups:
summary() 
