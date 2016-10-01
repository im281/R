library(data.table)
source('FFfunctions.R')

#fanduel data http://rotoguru1.com/cgi-bin/fyday.pl?week=1&game=fd&scsv=1
#2015 stats
#Training#
#read the player FFP tables######################################################################################
#2016 stats
w1 <- read.csv('Week1.txt', sep = ';',stringsAsFactors = FALSE)
w1$Week <- 1
w2 <- read.csv('Week2.txt', sep = ';',stringsAsFactors = FALSE)
w2$Week <- 2
w3 <- read.csv('Week3.txt', sep = ';',stringsAsFactors = FALSE)
w3$Week <- 3
###################################################################################################################

#Fanduel Players 
#append the tables on the row
p <- data.table(rbind(w1,w2,w3))

#subset the player tables so it doesn't contain defensive data
p <- p[which(p$Name %like% "Defense" == FALSE)]

p[,"TeamID"] <- 0
players <- AssignTeamIDs(p)

#add offensive stats per player to the table for each player

#read the multidimensional defense tables
#NFL stats page http://www.nfl.com/stats/team?seasonId=2015&seasonType=REG&Submit=Go

#Mergin tables######################################################################################################

#2016 run pass and total defense
runD16 <- data.table(read.csv('2016RunD.txt',sep = "\t"))
passD16 <- data.table(read.csv('2016PassD.txt',sep = "\t"))
totalD16 <- data.table(read.csv('2016TotalD.txt',sep ="\t"))
runandpassandtotal2015[,"Year"] <- 2016

#setkey

#merge 2015 stats to one table
runandpass2016 <- merge(runD16,passD16,by="Team")
d <- merge(runandpass2016 ,totalD16,by="Team")


#Offensive player stats
#####################################################################################################################
#2016  offensive stats
#passsing
w1p <- data.table(read.csv('Week1Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w1p$Week <- 1
w2p <- data.table(read.csv('Week2Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w2p$Week <- 2
w3p <- data.table(read.csv('Week3Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w3p$Week <- 3

w1p$Team <- tolower(w1p$Team)
w2p$Team <- tolower(w2p$Team)
w3p$Team <- tolower(w3p$Team)

#rushing
w1ru <- data.table(read.csv('Week1Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w1ru$Week <- 1
w2ru <- data.table(read.csv('Week2Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w2ru$Week <- 2
w3ru <- data.table(read.csv('Week3Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w3ru$Week <- 3

w1ru$Team <- tolower(w1ru$Team)
w2ru$Team <- tolower(w2ru$Team)
w3ru$Team <- tolower(w3ru$Team)

#receiving
w1re <- data.table(read.csv('Week1Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w1re$Week <- 1
w2re <- data.table(read.csv('Week2Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w2re$Week <- 2
w3re <- data.table(read.csv('Week3Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w3re$Week <- 3

w1re$Team <- tolower(w1re$Team)
w2re$Team <- tolower(w2re$Team)
w3re$Team <- tolower(w3re$Team)

#Kicking
w1k <- data.table(read.csv('Week1Kicking.txt',sep = "\t", stringsAsFactors = FALSE))
w1k$Week <- 1
w2k <- data.table(read.csv('Week2Kicking.txt',sep = "\t", stringsAsFactors = FALSE))
w2k$Week <- 2
w3k <- data.table(read.csv('Week3Kicking.txt',sep = "\t", stringsAsFactors = FALSE))
w3k$Week <- 3

w1k$Team <- tolower(w1k$Team)
w2k$Team <- tolower(w2k$Team)
w3k$Team <- tolower(w3k$Team)
####################################################################################################################
w1pf <- FormatNames(w1p)
w2pf <- FormatNames(w2p)
w3pf <- FormatNames(w3p)

w1ruf <- FormatNames(w1ru)
w2ruf <- FormatNames(w2ru)
w3ruf <- FormatNames(w3ru)

w1ref <- FormatNames(w1re)
w2ref <- FormatNames(w2re)
w3ref <- FormatNames(w3re)

w1kf <- FormatNames(w1k)
w2kf <- FormatNames(w2k)
w3kf <- FormatNames(w3k)

setkey(w1pf,Name)
setkey(w2pf,Name)
setkey(w3pf,Name)
setkey(w1ruf,Name)
setkey(w2ruf,Name)
setkey(w3ruf,Name)
setkey(w1ref,Name)
setkey(w2ref,Name)
setkey(w3ref,Name)
setkey(w1kf,Name)
setkey(w2kf,Name)
setkey(w3kf,Name)

passingstats <-rbind(w1pf,w2pf,w3pf)
ps<- FormatStatsTable(passingstats)

rushingstats <-rbind(w1ruf,w2ruf,w3ruf)
rus<- FormatStatsTable(rushingstats)

receivingstats <- rbind(w1ref,w2ref,w3ref)
rec <- FormatStatsTable(receivingstats)


kickingstats <- rbind(w1kf,w2kf,w3kf)
k <- FormatStatsTable(kickingstats)

f <- rbind(ps,rus,rec,k,fill=TRUE)
f[,"TeamID"] <- 0
final <- AssignTeamIDs(f)
d[,"TeamID"] <- 0
d <- AssignTeamIDsDefense(d)

setkey(final,Name,Week)
setkey(players,Name,Week)
finaltable <- merge(final,players,all.x = TRUE,allow.cartesian = TRUE)
names(finaltable)[names(finaltable)=="TeamID.x"] <- "TeamID"
setkey(finaltable,TeamID)
setkey(d,TeamID)

finalfinal <- merge(finaltable,d,all.x = TRUE,allow.cartesian = TRUE)
#Assign 0 to NAs
finalfinal[is.na(finalfinal)] <- 0
write.csv(finalfinal,'W3_TrainingData.csv')
UploadToMLStudio(finalfinal,'W3_TrainingData2.csv')


#Experiment##########################################################################################################
#0) Get d
#2016 run pass and total defense
runD16 <- data.table(read.csv('2016RunD.txt',sep = "\t"))
passD16 <- data.table(read.csv('2016PassD.txt',sep = "\t"))
totalD16 <- data.table(read.csv('2016TotalD.txt',sep ="\t"))
runandpassandtotal2015[,"Year"] <- 2016

#setkey

#merge 2015 stats to one table
runandpass2016 <- merge(runD16,passD16,by="Team")
d <- merge(runandpass2016 ,totalD16,by="Team")
d[,"TeamID"] <- 0
d <- AssignTeamIDsDefense(d)
setkey(d,TeamID)

#1) get offensive stats data which is called final
#2) merge the table with the Fanduel table
#3) merge with defensive stats data which is called

path <- 'C:/Users/Owner/Source/Repos/R/FantasyFootball/Fanduel/FanDuel-NFL-2016-10-02-16452-players-SunMonNight-list.csv'
t <- data.table(read.csv(path,stringsAsFactors = FALSE))
# remove injured players
t <- t[which(t$Injury.Indicator == "")]
idData<- data.table(read.csv('RotoguruPlayerIds.csv',stringsAsFactors = FALSE))

input <- ConvertFanduelCSV(t,idData)
input[,"TeamID"] <- 0
experiment <- AssignTeamIDs(input)
#setkey(experiment,'TeamID')

setkey(final,Name,Week)
setkey(experiment,Name,Week)
finaltableexp <- merge(final,experiment,all.x = TRUE,allow.cartesian = TRUE)
names(finaltableexp)[names(finaltableexp)=="TeamID.x"] <- "TeamID"
setkey(finaltableexp,TeamID)
setkey(d,TeamID)

finalfinalexp <- merge(finaltableexp,d,all.x = TRUE,allow.cartesian = TRUE)

#remove poistions that are NA
finalfinalexp <- finalfinalexp[which(!is.na(finalfinalexp$Pos))]

#Assign 0 to NAs
finalfinalexp[is.na(finalfinalexp)] <- 0
write.csv(finalfinalexp,'W4_SunMon_Exp_BDT.csv')
UploadToMLStudio(finalfinalexp,'W4_SunMon_Exp_BDT.csv')
#####################################################################################################################

#Optimize the lineup##############################################################
#csvFile < 'THE FILE PATH TO CSV FILE WITH EXTENSION'
csvFile <- 'W4_SunMon_BDT_P.csv'
data <- data.table(read.csv(csvFile))
names(data)[names(data)=="TeamID.x"] <- "TeamID"
result <- OptimizeFBLineupDFPredicted(data)

#using boeasted decision trees
result <- OptimizeFBLineup(data)

##TESTS############################################################################################################


####################################################################################################################
setkey(passrushreceive,TeamID)
setkey(defenses,TeamID)

final <- merge(passrushreceive,defenses,all.x = TRUE,allow.cartesian = TRUE)

setkey(players,TeamID)
t <- merge(players,defenses,all.x = TRUE,allow.cartesian = TRUE)


####################################################################################################################
x <- strsplit(w1p$Name," ")
y <- strsplit(x[[1]]," " )
View(y)
w1p$Name <- paste0(y[2],', ',y[1])

test <- FormatNames(w1p)


setkey(w1p,Name)
setkey(p,Name)

result1 <- merge(p,test, all.x = TRUE, allow.cartesian = TRUE)
#rename a single column
names(result1)[names(result1)=="Team.x"] <- "Team"

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




