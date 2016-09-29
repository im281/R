#Functions
###########################################################################
GetFeatureDistribution <- function(dt,w){
  
  table <- data.table(
    Features = numeric()
  )
  start <- 0
  end <- w
  while(end < 15){
    
    c <- nrow(dt[which(dt$Start >= start & dt$Start < end),])
    
    tmptable <- data.table(
      Features = c
    )
    table <- rbind(table,tmptable)
    start <- start + w
    end <- start + w
  }
  
  return (table)
}
##########################################################################
