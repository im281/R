library(jsonlite)
library(data.table)


ComputeMassError <- function(theoreticalMass,experimentalMass){
  return (((experimentalMass - theoreticalMass) / theoreticalMass) * 1e6);
}

#convert raw file to json
system("C:/R/Jupyter/filereader/Thermo.RawFileExtractor.Console.exe  -d C:/R/Jupyter/data -o 2")
json <- "C:/R/Jupyter/data/StandardsID4thQuartile.json.json"

#target files
targets <- "C:/R/Jupyter/libtargets.csv"

#read json data
scans <- data.table(fromJSON(json))
targets <- data.table(read.csv(targets))

#set as numeric data
targets$X.M.H.. <- as.numeric(targets$X.M.H..)
targets$RT..min. <- as.numeric(targets$RT..min.)


Process <- function(scans,targets){
  
  #create result table
  resTable <- data.table(
    Compound = character(),
    Mz = numeric(),
    RT = numeric(),
    ScanNumber = numeric())
  
  for(i in 1:nrow(targets)){
    
    for(j in 1:nrow(scans)){

      err = ComputeMassError(targets[i]$X.M.H..,scans[j]$PrecursorMz)
      
      # if the error is < 10 ppm then add to the list
      if(abs(err) < 5){
       
        t <- data.table(
          Compound =as.character(targets[i]$metabolite),
          Mz = scans[j]$PrecursorMz,
          RT = scans[j]$RetentionTime,
          ScanNumber =as.numeric(scans[j]$ScanNumber))
        
        if(nrow(resTable) == 0){
          resTable = t
          break
        }
        else{
          resTable <- rbind(resTable,t)
          break
        }
      }
    }
  }
  return (resTable)
}
  

