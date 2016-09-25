
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



