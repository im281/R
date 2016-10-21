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
#library(data.table)
cool <- read.csv('2cool4school.csv')


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

#view some of the records
head(cool)

#number of rows 
nrow(cool)

#summary of sex variable
summary(cool$SEX)

#create a copy of SEX
cool$sex <- cool$SEX

#as factor
cool$sex <- as.factor(cool$SEX)

#levels
levels(cool$sex)

#summary
summary(cool$sex)

#summary
summary(cool$SCH)

cool$SchoolF <- cool$SCH

levels(cool$SchoolF)

levels(cool$SchoolF) <- c('public','private')

#summary
summary(cool$SchoolF)

#describe using psych package
library(psych)
describe(cool)


cool.df <- with(cool,#with() adds the data set to all the following objects (its a shortcut)
                data.frame(cool1, 6-cool2r, cool3, cool4, (6-cool5r), cool6, (6-cool7r), cool8))

cool$coolness2 <- rowMeans(cool.df)

head(cbind(cool$coolness,cool$coolness2))

alpha(cool.df)

max(scale(cool$AGE))

min(scale(cool$AGE))

(cool$AGE[1234] - mean(cool$AGE))/sd(cool$AGE)

scale(cool$AGE)[1234]

#construct linear model
mod1F <- lm(formula = coolness ~SchoolF, data = cool)

#summary of model
summary(mod1F)

#objects
objects(mod1F)

#estimate for cal students
mod1F$coefficients[1]

#estimate for Stanford students
mod1F$coefficients[1] + mod1F$coefficients[2]

confint(mod1F)[1,]

confint(mod1F)[2,]

confint(mod1F)[1,] + confint(mod1F)[2,]

actual <- mod1F$model$coolness

predicted <- mod1F$fitted.values

error <- mod1F$residuals

#R^2 by hand
SSmod <- sum(error^2) #error in the model
SStotal <- sum((actual - mean(actual))^2) #errors in the baseline model
(SStotal - SSmod)/SStotal

#F-test by hand
dfmod <- length(coef(mod1F)) - 1
dfres <- mod1F$df.residual
F <- ((SStotal - SSmod)/dfmod)/(SSmod/dfres)
F # same thing as model output!

#subset data
C <- cool[cool$SCH == "Cal",]
s <- cool[cool$SCH == "Stanf",]

head(C)

head(s)

t.test(s$coolness,C$coolness) #same as model output

#removing NA values
mS <- mean(s$coolness,na.rm = T)
mC <- mean(C$coolness,na.rm = T)

varS <- var(s$coolness,na.rm = T)
varC <- var(C$coolness,na.rm = T)

nC <- sum(!is.na(C$coolness))
nS <- sum(!is.na(s$coolness))

dfC <- nC - 1
dfS <- nS - 1

sPool <- (dfC*varC + dfS*varS)/(dfC + dfS)
sePool <- sqrt((sPool/nC)+(sPool/nS))
meanDiff <- mS - mC
t <- meanDiff/sePool
t