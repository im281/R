# Compare MPG distributions for cars with 
# 4,6, or 8 cylinders
# library(sm)
# attach(mtcars)
# 
# # create value labels 
# cyl.f <- factor(cyl, levels= c(4,6,8),
#                 labels = c("4 cylinder", "6 cylinder", "8 cylinder")) 
# 
# # plot densities 
# sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
# title(main="MPG Distribution by Car Cylinders")
# 
# # add legend via mouse click
# colfill<-c(2:(2+length(levels(cyl.f)))) 
# legend(locator(1), levels(cyl.f), fill=colfill)


q4 <- read.table("~/AcquireX/Q4Intensities.txt", quote="\"", comment.char="")
q3 <- read.table("~/AcquireX/Q3Intensities.txt", quote="\"", comment.char="")
q2 <- read.table("~/AcquireX/Q2Intensities.txt", quote="\"", comment.char="")
q1 <- read.table("~/AcquireX/Q1Intensities.txt", quote="\"", comment.char="")

logq4 <-log10(q4$V1)
logq3 <-log10(q3$V1)
logq2 <-log10(q2$V1)
logq1 <-log10(q1$V1)

boxplot(logq4,logq3,logq2,logq1, col = c("blue","green","white","red"),
        ylab = "Log Precursor Intensities", names = c("Q4","Q3","Q2","Q1"))

vioplot(logq4,logq3,logq2,logq1, names = c("Q4","Q3","Q2","Q1")
        , col = c("blue","green","white","red"))




d <- read.csv('D:/Data/AutoDetect/Analysis.csv')

t <- data.table(read.csv('D:/Data/AutoDetect/InclusionList.csv'))

e <- data.table(read.csv('D:/Data/AutoDetect/ExclusionList.csv'))



data <- XML2R("http://www.fantasyfootballnerd.com/service/player/xml/test/13/")
xml.url <- "http://www.fantasyfootballnerd.com/service/player/xml/test/13/"
data <- xmlTreeParse(xml.url)
data <- xmlToList(xml.url)
