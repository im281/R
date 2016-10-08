library(data.table)

#Training data
#################################################

ParseTrainingData <- function(){
  #Script1 ######################################################################################
  dataset  <- read.table(url("http://azuremlsamples.azureml.net/templatedata/PM_train.txt"))
  
  # generate column names for the data frame
  colnames <- c("id","cycle","setting1","setting2","setting3","s1","s2","s3","s4","s5","s6","s7",
                "s8","s9","s10","s11","s12","s13","s14","s15","s16","s17","s18","s19","s20","s21")
  names(dataset) <- colnames
  
  return (dataset)
}

GenerateTrainingDataLabels <- function(dataset){
  # This module generates the labels for the training data.
  # RUL for regression models, label1 for binary classification models, 
  # label2 for multi-class classification models

  
  # user defined variables to set the windows for classifcation
  w1 <- 30
  w0 <- 15
  
  
  # generate the column RUL (remaining useful life)
  library(plyr)
  
  # get the maximum cycle number for each id
  d1 <- ddply(dataset,~id,summarise,max=max(cycle))
  d2 <- merge(dataset,d1,by=c("id"))
  
  # generate the column RUL based on the values of columns "max" and "cycle"
  d2$RUL <- d2$max - d2$cycle
  
  # exclude column "max" from the data frame
  d2 <- d2[,-which(names(d2) == "max")]
  
  # genearte label1 and label2
  dataset <- d2
  dataset$label1 <- ifelse(d2$RUL <= w1, 1, 0)
  dataset$label2 <- ifelse(d2$RUL <= w0, 2, ifelse(d2$RUL <= w1,1,0))
  
  return (dataset)
}

FeatureEngineerTrainingData <- function(dataset){
  # This module performs feature engineering to add more features in the training data. Three additional features
  # are created for each of the 21 sensors
  # Generated features:
  # a1-a21 - moving avearge of the corresonding sensor measure within the predefined window size w
  # sd1-sd21 - moving standard deviation  of the corresonding sensor measure within the predefined window size w
  # 
  
  # set the required R library
  library(zoo)
  
  ######################################################
  # User input variables
  
  # window size (window_size>=2),  most recent sensor values
  window_size = 5 
  
  ######################################################
  # feature engineering
  
  # find the column index for the last 3 columns: RUL, label1, label2
  col_index1 = ncol(dataset)
  col_index2 = col_index1 - 1
  col_index3 = col_index1 - 2
  
  # exclude comuns id, cycle, setting1,setting2,setting3, and last 3 columns
  # only the 21 sensor columns are kept in the data frame
  n_pre_sensor_columns = 5 # id, cycle, setting1,setting2,setting3
  n_after_sensor_columns = 3 #RUL, label1, label2
  n_col = ncol(dataset)
  
  data=dataset[,-c(1:n_pre_sensor_columns,col_index3,col_index2,col_index1)]
  n_sensor=ncol(data) # 21 sensors
  
  id=unique(dataset[,1])
  n_id=length(id) # 100
  
  # generate column names
  
  a = paste("a",(1:n_sensor),sep="") # average
  sd =paste("sd",(1:n_sensor),sep="") # standard deviation
  
  
  
  # get rolling mean and rolling sd
  rollingmean = c()
  rollingsd = c()
  
  # loop for each unique engine id
  for(i in 1:length(id)){
    
    # get the subset of the data that only contains the sensor columns for the id i
    sub_data = subset(dataset[,(n_pre_sensor_columns+1):(n_col-n_after_sensor_columns)],dataset$id==id[i])
    
    # window size is adjusted if the it is greater than the number of rows in the data
    n_row_subdata = nrow(sub_data)
    w=ifelse(window_size < n_row_subdata,window_size,n_row_subdata)
    
    # get the rolling mean for all sensors
    rollingmean = rbind(rollingmean,rollapply(sub_data,w,mean,align = "right",partial=1))
    
    # get the rolling sd for all sensors
    rollingsd_i = rollapply(sub_data,w,sd,align = "right",partial=1)
    rollingsd_i[is.na(rollingsd_i)]=0
    rollingsd = rbind(rollingsd,rollingsd_i)
    
    
    
  }
  data_a = as.data.frame(rollingmean)
  data_sd = as.data.frame(rollingsd)
  
  names(data_a) = a
  names(data_sd) = sd
  
  
  
  df = cbind(data_a,data_sd)
  
  df2=cbind(dataset[,1:(n_pre_sensor_columns+n_sensor)],df)
  df2$RUL=dataset$RUL
  df2$label1=dataset$label1
  df2$label2=dataset$label2
  
  
  # generate output data
  data.set = df2
  
  return(data.set)
  
}

Normalize <- function(dataset){
  #Exclude label columns
  c <- ncol(dataset) - 3
  #min max Normalization (0-1)
  for(i in 1:c){
    dataset[i] <- normalize(dataset[i])
  }
  return (dataset)
}

NormalizeTestData <- function(trainingD,testD){
  
  #get max and min va
}

RemoveNas <- function(dataset){
  
  # generate the output data
  dataset <- dataset[,colSums(is.na(dataset))<nrow(dataset)]
  
  return (dataset)
}

#Testing data
##################################################
ParseTestData <- function(){
  #Script1 ######################################################################################
  dataset  <- read.table(url("http://azuremlsamples.azureml.net/templatedata/PM_test.txt"))
  
  # generate column names for the data frame
  colnames <- c("id","cycle","setting1","setting2","setting3","s1","s2","s3","s4","s5","s6","s7",
                "s8","s9","s10","s11","s12","s13","s14","s15","s16","s17","s18","s19","s20","s21")
  names(dataset) <- colnames
  
  return (dataset)
}

FeatureEngineerTestData <- function(dataset){
  # This module performs feature engineering to add more features in the training data. Three additional features
  # are created for each of the 21 sensors
  # Generated features:
  # a1-a21 - moving avearge of the corresonding sensor measure within the predefined window size w
  # sd1-sd21 - moving standard deviation  of the corresonding sensor measure within the predefined window size w
  
  
  # set the required R library
  library(zoo)
  
  ############################################
  # User input variables
  
  # window size (window_size>=2),  most recent sensor values
  window_size = 5 
  
  ############################################
  # feature engineering
  
  # exclude comuns id, cycle, setting1,setting2,setting3, and last 3 columns
  # only the 21 sensor columns are kept in the data frame
  n_pre_sensor_columns = 5 # id, cycle, setting1,setting2,setting3
  n_after_sensor_columns = 0 # RUL, label1, label2  ar not in this data
  n_col = ncol(dataset)
  
  data=dataset[,-c(1:n_pre_sensor_columns)]
  n_sensor=ncol(data) # 21 sensors
  
  id=unique(dataset[,1])
  n_id=length(id) # 100
  
  # generate column names
  
  a = paste("a",(1:n_sensor),sep="") # average
  sd =paste("sd",(1:n_sensor),sep="") # standard deviation
  
  
  # get rolling mean and rolling sd
  rollingmean = c()
  rollingsd = c()
  
  # loop for each unique engine id
  for(i in 1:length(id)){
    
    # get the subset of the data that only contains the sensor columns for the id i
    sub_data = subset(dataset[,(n_pre_sensor_columns+1):(n_col-n_after_sensor_columns)],dataset$id==id[i])
    
    # window size is adjusted if the it is greater than the number of rows in the data
    n_row_subdata = nrow(sub_data)
    w=ifelse(window_size < n_row_subdata,window_size,n_row_subdata)
    
    # get the rolling mean for all sensors
    rollingmean = rbind(rollingmean,rollapply(sub_data,w,mean,align = "right",partial=1))
    
    # get the rolling sd for all sensors
    rollingsd_i = rollapply(sub_data,w,sd,align = "right",partial=1)
    rollingsd_i[is.na(rollingsd_i)]=0
    rollingsd = rbind(rollingsd,rollingsd_i)
    
    
  }
  data_a = as.data.frame(rollingmean)
  data_sd = as.data.frame(rollingsd)
  
  names(data_a) = a
  names(data_sd) = sd
  
  
  
  df = cbind(data_a,data_sd)
  
  df2=cbind(dataset[,1:(n_pre_sensor_columns+n_sensor)],df)
  
  # generate output data
  data.set = df2
  
  return(data.set)
 
}

MaxCycleForEachID <- function(dataset){
  # This module aims to keep one record that has the maximum cycle for each id. 
  # Map 1-based optional input ports to variables
  
  # keep only the row with max "cycle"" for each id
  data.set<-merge(aggregate(cycle~id,dataset,function(x) x[which.max(x)]),dataset)
  data.set =data.set[with(data.set, order(id)), ]
  
  return(data.set)
  
}

CombineData <- function(testD,trainingD){
  # This module aims to keep the same set of features as that in the training data
  # Map 1-based optional input ports to variables
  # testing data
  data <- testD # class: data.frame
  # training data
  info <- trainingD # class: data.frame
  
  # training data without the labels
  info= subset(info, select=-c(RUL,label1,label2))
  
  # get the feature names 
  feature_names = names(info)
  
  # only keep the same feature set in the testing data
  data.set = data[feature_names]
  
  return (data.set)
  
}

#Ground Truth data
##################################################
ParseGroundTruthData <- function(){
  #Script1 ######################################################################################
  dataset  <- read.table(url("http://azuremlsamples.azureml.net/templatedata/PM_truth.txt"))
  
  return (dataset)
}

GenerateGroundTruthLabels <- function(dataset){
  # This module aims to generate the column labels 
  # for three types of learning algorithms: RUL is for regression models, 
  # lable1 is for binary classification models, and lable2 is for muiti-class
  # classification models 
  
  names(dataset)="RUL"
  
  # user defined variables to set the windows for classifcation
  w1 <- 30
  w0 <- 15
  
  
  dataset$label1 <- ifelse(dataset$RUL <= w1, 1,0)
  dataset$label2 <- ifelse(dataset$RUL <= w0, 2, ifelse(dataset$RUL<=w1,1,0))
  
  
  data.set <- dataset
  
  return(data.set)
  
}

#Combine all data
##################################################
CombineAllData <- function(d1,d2){
  
  f <- cbind(d1,d2)
  
}

GenerateCOlumnLabels <- function(dataset){
  # This module aims to generate the column labels 
  # for three types of learning algorithms: RUL is for regression models, 
  # lable1 is for binary classification models, and lable2 is for muiti-class
  # classification models 

  names(dataset)="RUL"
  
  # user defined variables to set the windows for classifcation
  w1 <- 30
  w0 <- 15
  
  
  dataset$label1 <- ifelse(dataset$RUL <= w1, 1,0)
  dataset$label2 <- ifelse(dataset$RUL <= w0, 2, ifelse(dataset$RUL<=w1,1,0))
  
  
  data.set <- dataset
  
  return(data.set)
}

#Helper functions
##################################################
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

NormalizeTwoTables <- function(ref,target){
  #leave three labels
  c <- ncol(target)
  #min max Normalization (0-1)
  for(i in 1:c){
    max <- max(ref[i])
    min <- min(ref[i])
    target[i] <- normalize2t(target[i],max,min)
  }
  
  return (target)
}

normalize2t <- function(x,max,min) {
  return ((x - min) / (max - min))
}







  