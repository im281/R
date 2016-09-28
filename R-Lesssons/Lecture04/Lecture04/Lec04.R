#'---
#' title: "Lecture 4"
#' date: "September 21, 2016"
#' author: ""
#' output: word_document
#'---
#' Loading library
#' ===============
library(PubH6002) # version should be 0.23


#' Loading data from the HERS study
hers = read.csv('hersSample.csv')
use(hers)

#' Correcting skew
#' ===============
#' BMI
#' ---
hist(BMI)

#' In one step
hist( log(BMI) )

#' In two steps, creating a new variable
modBMI = log(BMI)
hist(modBMI)

#' Triglycerides
#' -------------
hist(TG)

hist( log(TG) )

hist( sqrt(TG) )

#' Influence diagnostics
#' =====================
hist(LDL)
summary(LDL)

influencePlot(LDL,mean)
influencePlot(LDL,sd)


#' Combining Levels
#' ================
barplot(TGCat)

barplot(TG1Cat)

summary(TG1Cat)

newTG1Cat = combineLevels(TG1Cat,
                          '200-499 (High)','500+ (Very high)',
                          label = '200+ (High)')
summary(newTG1Cat)
barplot(newTG1Cat)

#' Dropping levels
#' ===============
otherTG1Cat = combineLevels(TG1Cat,
                          '500+ (Very high)',
                          label = NA)
summary(otherTG1Cat)
barplot(otherTG1Cat)
