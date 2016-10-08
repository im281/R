source('PMFunctions.R')

#R specific processing
# We need to use the same transformation on the test data
#therefore we need to rbind the test and training data 
#to do normalization then parse to two sets of tables
# traind <- ParseTrainingData()
# t <- ParseTestData()
# traind$Data <- 'training'
# t$Data <- 'test'
# 
# traind <- FeatureEngineerTrainingData(traind)
# t <- FeatureEngineerTestData(t)
# 
# temp <- rbind(traind,t)


#Training data###################################
traind <- ParseTrainingData()
traind <- GenerateTrainingDataLabels(traind)
traind <- FeatureEngineerTrainingData(traind)
traind <- traind[,-which(names(traind) == "id")]

traind <-Normalize(traind)
traind[is.na(traind)] <- 0
traind <- RemoveNas(traind)
#################################################
#Test data
t <- ParseTestData()
t <- FeatureEngineerTestData(t)
t <- MaxCycleForEachID(t)
t <- t[,-which(names(t) == "id")]

#need max and min values from the traiD for each column

t <- Normalize(t)
t[is.na(t)] <- 0
t <- RemoveNas(t)

#Combine
#################################################
f <- CombineData(t,d)

#Add column
#################################################
g <- ParseGroundTruthData()
g <- GenerateCOlumnLabels(g)

final <- cbind(f,g)

#################################################