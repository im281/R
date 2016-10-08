#'---
#' title: "Lecture 5"
#' date: "September 28, 2016"
#' author: ""
#' output: word_document
#'---
library(PubH6002)

aq = read.csv('airquality.csv')
use(aq)

# New variable: Hot
summary(Hot)

# boxplots by group
boxplot(Ozone ~ Hot)

# Adding notches
boxplot(Ozone ~ Hot, notch=TRUE)

# testing for differences: using the t test
t.test(Ozone ~ Hot)

# using a permutation test
permutation.test(Ozone ~ Hot)

# getting a plot too
permutation.test(Ozone ~ Hot, plot=TRUE)

# permutation tests on other statistics
permutation.test(Ozone ~ Hot, statistic=sd, plot=TRUE)

# permutation tests on other statistics
permutation.test(Ozone ~ Hot, statistic=IQR, plot=TRUE)
