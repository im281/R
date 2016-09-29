library(data.table)
library(psych)
source('AcquireXFunctions.R')
#Read Inclusion list generated from Xtopia at 5e4 threshold
dt <- data.table(read.csv('InclusionList.txt',sep = '\t'))

#Number of total features in this 15 min acquisition
nrow(dt)

#Order the table based on retention time
dt <- dt[order(dt$Start),] 

#Summary stats
describe(dt)

#More summary stats
summary(dt)

#Plot the features as a fucntion of quartiles and bins
par(mfrow=c(2,2))

t <- GetFeatureDistribution(dt,.3)
barplot(t$Features,ylab = 'Total #Features',xlab = 'RT', col = 'blue')

test <- dt[which(dt$Intensity > 9.677e5)]
t <- GetFeatureDistribution(test,.3)
barplot(t$Features,ylab = 'Q4 Features',xlab = 'RT', col = 'red')

test <- dt[which(dt$Intensity < 9.677e5 & dt$Intensity > median(dt$Intensity))]
t <- GetFeatureDistribution(test,.3)
barplot(t$Features,ylab = 'Q3 Features',xlab = 'RT', col = 'green')

test <- dt[which(dt$Intensity < 1.611e5)]
t <- GetFeatureDistribution(test,.3)
barplot(t$Features,ylab = 'Q1 Features',xlab = 'RT', col = 'purple')


