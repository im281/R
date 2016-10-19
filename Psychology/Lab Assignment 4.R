
#read csv file int variable cool
cool <- read.csv('2cool4school.csv')

#change variable SEX to factor and save it as same name
cool$SEX <- as.factor(cool$SEX)

#Show a summary of the SEX variable
summary(cool$SEX)

#no change in variable
head(cool$SCH)

#change the level names of the SCH variable to 'public' and 'private'
cool$SCH <- c('public', 'private')

#change the variables
head(cool$SCH)

head(cool)


