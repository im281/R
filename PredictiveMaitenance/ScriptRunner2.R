#Training data###################################
traind <- ParseTrainingData()#CSV files are also saved to local working directory
traind <- GenerateTrainingDataLabels(traind)
traind <- FeatureEngineerTrainingData(traind)
traind <- traind[,-which(names(traind) == "id")]

#Test data#######################################
t <- ParseTestData()
t <- FeatureEngineerTestData(t)
t <- MaxCycleForEachID(t)
t <- t[,-which(names(t) == "id")]


#normalize both tables against the training data set
t <- NormalizeTwoTables(traind,t)
traind <- Normalize(traind)

traind[is.na(traind)] <- 0
traind <- RemoveNas(traind)

t[is.na(t)] <- 0
t <- RemoveNas(t)

#Combine
#################################################
f <- CombineData(t,traind)

#Add column with ground truth data
#################################################
g <- ParseGroundTruthData()
g <- GenerateCOlumnLabels(g)

#Combine#########################################
final <- cbind(f,g)
#################################################



traind <- data.table(read.csv('traind.csv'))
traind$X <- NULL
t <- data.table(read.csv('t.csv'))
t$X <- NULL
g <- data.table(read.csv('g.csv'))
g$X <- NULL
