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


