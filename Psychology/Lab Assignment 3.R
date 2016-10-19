# Lab Assignment #3
# Student Name: KEY	
# 
# Instructions: Complete the tasks outlined in this document. 
# You should upload your completed assignment online as a .pdf, 
# along with your R file.
# 
# Problem 1 : Cool Problems
# 
# 1A. Load the dataset “2cool4school.csv” into R. 
# These data are from Berkeley and Stanford students 
# who answered questions about their love for coffee, 
# and were then rated on how cool they were by an unbiased observer. 
library(data.table)
dt <- data.table(read.csv('2cool4school.csv',stringsAsFactors = FALSE))


# 1A. Data Cleaning (again)
# Last time, we did some data cleaning: (A) converted variable SEX 
# to be a factor variable with three levels (1 = female; 2 = male; 3 = other), 
# (B) changed the names of the levels of the factor variable SCH so Cal = 
# Public and Stanf = Private, and (C) created a scale score for the variable 
# coolness called coolness2. Copy and paste your code from the last lab to repeat 
# these three steps (look at the key for the lab assignment if you want to make 
# sure you are cleaning the data correctly). Use the write.csv() function to save 
# this cleaned data object as “2cool4school_clean.csv” so you don’t have to repeat 
#   these steps again.

#lets see what the variables are
str(dt)

dt$SEX <- as.factor(dt$SEX)







