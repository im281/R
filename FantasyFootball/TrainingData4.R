library(data.table)
source('FFfunctions.R')


#Defense (This text file will be different each week)
rd <- '2016RunD.txt'
pd <- '2016passD.txt'
td <- '2016totalD.txt'

#Get latest defensive statistics from text
d <- GetLatestDefense(rd,pd,td,2016)

##fanduel data http://rotoguru1.com/cgi-bin/fyday.pl?week=1&game=fd&scsv=1
#read the player FFP tables######################################################################################
#2016 stats
w1 <- read.csv('Week1.txt', sep = ';',stringsAsFactors = FALSE)
w1$Week <- 1
w2 <- read.csv('Week2.txt', sep = ';',stringsAsFactors = FALSE)
w2$Week <- 2
w3 <- read.csv('Week3.txt', sep = ';',stringsAsFactors = FALSE)
w3$Week <- 3
w4 <- read.csv('Week4.txt', sep = ';',stringsAsFactors = FALSE)
w4$Week <- 4
w5 <- read.csv('Week5.txt', sep = ';',stringsAsFactors = FALSE)
w5$Week <- 5
w6 <- read.csv('Week6.txt', sep = ';',stringsAsFactors = FALSE)
w6$Week <- 6
###################################################################################################################

#Fanduel Players 
#append the tables on the row
p <- data.table(rbind(w1,w2,w3,w4,w5,w6))

#subset the player tables so it doesn't contain defensive data
#p <- p[which(p$Name %like% "Defense" == FALSE)]
p <- p[which(p$Pos != "Def")]

p$Injury.Indicator <- " "

UploadToMLStudio(p,'W6_td1.csv')

