library(data.table)
source('FFfunctions.R')
source('FootballOptimizer.R')

#fanduel data http://rotoguru1.com/cgi-bin/fyday.pl?week=1&game=fd&scsv=1
#2015 stats
#Training#
#read the player FFP tables######################################################################################
w1 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week1.txt', sep = ';',stringsAsFactors = FALSE)
w2 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week2.txt', sep = ';',stringsAsFactors = FALSE)
w3 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week3.txt', sep = ';',stringsAsFactors = FALSE)
w4 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week4.txt', sep = ';',stringsAsFactors = FALSE)
w5 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week5.txt', sep = ';',stringsAsFactors = FALSE)
w6 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week6.txt', sep = ';',stringsAsFactors = FALSE)

w7 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week7.txt', sep = ';',stringsAsFactors = FALSE)
w8 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week8.txt', sep = ';',stringsAsFactors = FALSE)
w9 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week9.txt', sep = ';',stringsAsFactors = FALSE)
w10 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week10.txt', sep = ';',stringsAsFactors = FALSE)
w11 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week11.txt', sep = ';',stringsAsFactors = FALSE)
w12 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week12.txt', sep = ';',stringsAsFactors = FALSE)

w13 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week13.txt', sep = ';',stringsAsFactors = FALSE)
w14 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week14.txt', sep = ';',stringsAsFactors = FALSE)
w15 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week15.txt', sep = ';',stringsAsFactors = FALSE)
w16 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week16.txt', sep = ';',stringsAsFactors = FALSE)
w17 <- read.csv('C:/Users/Owner/Source/Repos/R/FantasyFootball/2015/Week17.txt', sep = ';',stringsAsFactors = FALSE)
###################################################################################################################

#2016 stats########################################################################################################
w18 <- read.csv('Week1.txt', sep = ';',stringsAsFactors = FALSE)
w19 <- read.csv('Week2.txt', sep = ';',stringsAsFactors = FALSE)
w20 <- read.csv('Week3.txt', sep = ';',stringsAsFactors = FALSE)
###################################################################################################################

#append the tables on the row
p <- data.table(rbind(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20))

#subset the player tables so it doesn't contain defensive data
p <- p[which(p$Name %like% "Defense" == FALSE)]

#add offensive stats per player to the table for each player

#read the multidimensional defense tables
#NFL stats page http://www.nfl.com/stats/team?seasonId=2015&seasonType=REG&Submit=Go

#Mergin tables######################################################################################################

#2015 run pass and total defense
runD15 <- data.table(read.csv('2015RunD.txt',sep = "\t"))
passD15 <- data.table(read.csv('2015PassD.txt',sep = "\t"))
totalD15 <- data.table(read.csv('2015TotalD.txt',sep ="\t"))

#merge 2015 stats to one table
runandpass2015 <- merge(runD15,passD15,by="Team")
runandpassandtotal2015 <- merge(runandpass2015 ,totalD15,by="Team")
runandpassandtotal2015[,"Year"] <- 2015

#2016 run pass and total defense
runD16 <- data.table(read.csv('2016RunD.txt',sep = "\t"))
passD16 <- data.table(read.csv('2016PassD.txt',sep = "\t"))
totalD16 <- data.table(read.csv('2016TotalD.txt',sep ="\t"))
runandpassandtotal2015[,"Year"] <- 2016

#merge 2015 stats to one table
runandpass2016 <- merge(runD16,passD16,by="Team")
runandpassandtotal2016 <- merge(runandpass2016 ,totalD16,by="Team")

#row bind
finalD <- rbind(runandpassandtotal2015,runandpassandtotal2016,fill=TRUE)
d <- finalD
#####################################################################################################################


#add team ID column names (to cbind using column IDs)
p[,"TeamID"] <- 0
d[,"TeamID"] <- 0

players <- AssignTeamIDs(p)
defenses <- AssignTeamIDsDefense(d)

#Offensive player stats
#####################################################################################################################
#2016  offensive stats
#passsing
w1p <- data.table(read.csv('Week1Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w1p$Team <- tolower(w1p$Team)

#rushing
w1ru <- data.table(read.csv('Week1Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w1ru$Team <- tolower(w1ru$Team)

#receiving
w1re <- data.table(read.csv('Week1Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w1re$Team <- tolower(w1re$Team)

#Kicking
w1k <- data.table(read.csv('Week1Kicking.txt',sep = "\t", stringsAsFactors = FALSE))
w1k$Team <- tolower(w1k$Team)

#sacs###############################################################################################################
#assign team IDs since they are defensice players
w1s <- data.table(read.csv('Week1Sacs.txt',sep = "\t", stringsAsFactors = FALSE))
w1s$Team <- tolower(w1s$Team)
w1s[,"TeamID"] <- 0
#Need to assign Team as Oppt for function to be consistent
names(w1s)[names(w1s)=="Team"] <- "Oppt"
newp <- AssignTeamIDs(w1s)
names(newp)[names(newp)=="Oppt"] <- "Team"
View(newp)

w2s <- data.table(read.csv('Week2Sacs.txt',sep = "\t", stringsAsFactors = FALSE))
w2s$Team <- tolower(w2s$Team)
w2s[,"TeamID"] <- 0
#Need to assign Team as Oppt for function to be consistent
names(w2s)[names(w2s)=="Team"] <- "Oppt"
newp1 <- AssignTeamIDs(w2s)
names(newp1)[names(newp1)=="Oppt"] <- "Team"
View(newp1)

w3s <- data.table(read.csv('Week3Sacs.txt',sep = "\t", stringsAsFactors = FALSE))
w3s$Team <- tolower(w3s$Team)
w3s[,"TeamID"] <- 0
#Need to assign Team as Oppt for function to be consistent
names(w3s)[names(w3s)=="Team"] <- "Oppt"
newp2 <- AssignTeamIDs(w3s)
names(newp2)[names(newp2)=="Oppt"] <- "Team"
View(newp2)


defensivePlayers <- rbind(newp,newp1,newp2)
#############################################################################################



setkey(defensivePlayers,TeamID)
setkey(defenses,TeamID)

alldefense <- merge(defensivePlayers,defenses,all.x = TRUE,allow.cartesian = TRUE)


#join the tables on Team ID. Player and the opposing team
matrix = merge(players,alldefense, by='TeamID',allow.cartesian = TRUE)
write.csv(matrix,'ffd6.csv')
UploadToMLStudio(myexp,'ffd6.csv')




