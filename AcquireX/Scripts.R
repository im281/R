#ax <- as.numeric(f$Log.Ax)
# f$Log.Ax
# d <- data.table(read.csv('test.csv'))
# 
# 
# boxplot(d$Log.DDA,d$Log.Ax,names = c('DDA','AX'),
#         ylab ="Log Precursor Intensity", 
#         col = c("red","blue"))
# 
# t.test(d$Log.Ax,d$Log.DDA)
# 
# 
# 
# library(sm)
# sm.density.compare(d$Log.Ax,d$Log.DDA)
# 
# ax <- d$Log.Ax[!is.na(d$Log.Ax)]
# dda <- d$Log.DDA[!is.na(d$Log.DDA)]
# 
# # plot densities 
# sm.density.compare(ax,dda)
# 
# 
# 
# hist(ax)
# hist(dda)
# hist(dda,ax)
# 
# 
# 
# hist(ax,col="red",xlim=c(4,10),main = "test",breaks = 50) 
# par(new = TRUE)
# hist(dda,col="blue",xlim=c(4,10),main = "test",breaks = 50) 
# lines(dda)
# 
# str(d)
# 
# plot(density(dda),col="red",xlim=c(0,10),main = "Acquirex vs DDA",xlab = "ratio") 
# lines(density(ax),col = "blue")
# 




ComparePeakLists <- function(theo,exp){
  for(i in 1:nrow(theo)){
    tmass = theo[i]$MZ
    trt = (theo[i]$Start - theo[i]$End/2)
    for(j in 1:nrow(exp)){
      emass = exp[i]$MZ
      trt = (exp[i]$Start - exp[i]$End/2) 
    }
    
  }
}

ComputeMassError <- function(theoreticalMass,experimentalMass){
  
  return (((experimentalMass - theoreticalMass) / theoreticalMass) * 1e6);
  
}









