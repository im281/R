
UploadToMLStudio <- function(dt,name){
  
  library(AzureML)
  id <- '8dbb390855c44346b02db40767f19b60'
  auth <- 'b46d1a5bbfe143a794ddcdf2e4811d2a'
  api_endpoint <- 'https://studioapi.azureml.net'
  ws <- workspace(id, auth)
  
  # Upload the R airquality data.frame to the workspace.
  upload.dataset(dt, ws, name)
  
  # Example datasets (airquality should be among them now)
  head(datasets(ws))
  
}

ParsePredictionResults <- function(l){
 
  m <- data.table(data.frame(matrix(0, ncol = 71, nrow = 0)))
  colnames(m) <- l$Results$`FP Predictions`$value$ColumnNames
  values <- l$Results$`FP Predictions`$value$Values
  
  dt <- data.table(values[[1]])
  dt <- t(dt)
  
  return (dt)

  }

  




