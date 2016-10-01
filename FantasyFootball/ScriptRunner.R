library(data.table)
source('FFfunctions.R')

#Defense (This text file will be different each week)
rd <- '2016RunD.txt'
pd <- '2016passD.txt'
td <- '2016totalD.txt'

#Get latest defensive statistics from text
d <- GetLatestDefense(rd,pd,td,2016)

#Upload the players, offensive stats and defensive stats
#Train the model
UploadTrainingData(d,'test.csv')

#Upload data for prediction
UploadFanduelLineup(path,'test.csv')
