#'---
#' title: "Lab 1"
#' author: "Your name here"
#' output: word_document
#'---
#'
#' Accessing PubH6002 functions
#' ----------------------------
#' Let's load the PubH6002 package so we can access its functions. Don't forget
#' to run this command!

library(PubH6002)
#'
#' First set
#' ---------
#' The next few questions are based on a survey of the clerical employees of a
#' large financial organization asking about employee satisfaction with their
#' supervisors.  Specifically, the following were measured (high value in a value
#' indicates a favorable response, low an unfavorable on)
#' 
#' | Variable     | Meaning                                 |
#' |--------------|-----------------------------------------|
#' | complaints   | Handles employee complaints well        |
#' | privileges   | Does not allow special privileges       |
#' | learning     | Gives opportunity to learn new things   |
#' | raises       | Gives raises based on performance       |
#' | critical     | Not too critical of poor performances   |
#' | advance      | Rate of advancing to better jobs        |
#' | rating       | Overall rating of supervisor            |
#'
#' The scores were averaged by department so each row in the data represents
#' one department.
#' 

#'
#' #### Question 1
#' We start by reading the data from the file 'attitude.csv', and
#' place it in an R object called attitude. In the code below, add
#' the name of the csv file (hint: you can use the tab key)
attitude = read.csv('')

#' While we're at it, let's "use" the dataset so we can access its variables
use(attitude)


#'
#' #### Question 2
#' how many observations (departments) are there in the dataset?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 3
#' Produce a summary of all the variables in the attitude dataset
summary()


#'
#' #### Question 4
#' Produce a summary of the learning variable by itself
summary()


#'
#' #### Question 5
#' Plot supervisor rating (variable rating) as a function of handling of complaints
#' (variable complaints)
plot( ~ )

#' Are higher complaints scores associated with higher ratings, 
#' or lower ratings?

#' Answer: 
#' 
#' 
#' 


#'
#' Second set
#' ----------
#' The problems here are based on measures of fertility  and socio-economic
#' indicators for each of 47 French-speaking provinces in Switzerland around
#' 1888. The variables in the dataset are as follows:
#' 
#' | Variable         | Meaning                                        |
#' |------------------|------------------------------------------------|
#' | fertility	      | the standardized fertility measure             |
#' | agriculture	    | % of males involved in agriculture             |
#' | examination	    | % draftees receiving highest mark on army exam |
#' | education	      | % education beyond primary school for draftees |
#' | catholic	        | % catholic (as opposed to protestant)          | 
#' | infantMortality	| live births who live less than 1 year          |


#'
#' #### Question 6
#' We start by reading the data from the file 'swiss.csv', and
#' place it in an R object called swiss. In the code below, add
#' the name of the csv file (hint: you can use the tab key)
attitude = swiss('')

#' How many records are there?

#' Answer: 
#' 
#' 
#' 


#' Let's make the variables in the swiss dataset accessible
use(swiss)


#'
#' #### Question 7
#' Get a summary of the swiss dataset.
summary()

#' What's the median fertility rate?

#' Answer: 
#' 
#' 
#' 



#'
#' #### Question 8
#' plot fertility rate (variable fertility) against % education beyond primary school 
#' for draftees (variable education)
plot( ~ )
#'  Is the relationship between fertility and examination an increasing one 
#' (fertility increases with increasing examination scores) or a decreasing one 
#' (fertility descreases with increasing examination scores)?

#' Answer: 
#' 
#' 
#' 


#'
#' Third set
#' ----------
#' This is practice with errors. Each of the subproblems below produces an
#' error. The comment before each statement explains what the statement should
#' do. In each problem fix the error so the statement does what it's supposed to
#' do.  All problems use the swiss dataset.


#'
#' #### Question 9
#' get a summary of education

summary(Education)


#'
#' #### Question 10
#' Produce a histogram of the education variable

Hist(education)


#'
#' #### Question 11
#' Plot infant mortality against education

plot(mortality ~ education)


#'
#' #### Question 12
#' Plot all the variables in the swiss dataset

plot('swiss')

#' When you finish
#' ===============
#' Try File > Compile Notebook ...
#' 
#' Make sure all your R statements work without errors or the notebook won't
#' work!
