library(data.table)
source('FFfunctions.R')

#Defense (This text file will be different each week)
rd <- '2016RunD.txt'
pd <- '2016passD.txt'
td <- '2016totalD.txt'

#Get latest defensive statistics from text
d <- GetLatestDefense(rd,pd,td,2016)

path <- 'C:/Users/Owner/Source/Repos/R/FantasyFootball/Fanduel/FanDuel-NFL-2016-10-03-16453-players-list.csv'
name <- 'W5_Mon_Thurs_Exp.csv'

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
###################################################################################################################

#Fanduel Players 
#append the tables on the row
p <- data.table(rbind(w1,w2,w3,w4))

#subset the player tables so it doesn't contain defensive data
p <- p[which(p$Name %like% "Defense" == FALSE)]

p[,"TeamID"] <- 0
players <- AssignTeamIDs(p)

#2016  offensive stats
#passsing
w1p <- data.table(read.csv('Week1Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w1p$Week <- 1
w2p <- data.table(read.csv('Week2Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w2p$Week <- 2
w3p <- data.table(read.csv('Week3Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w3p$Week <- 3
w4p <- data.table(read.csv('Week4Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w4p$Week <- 4

w1p$Team <- tolower(w1p$Team)
w2p$Team <- tolower(w2p$Team)
w3p$Team <- tolower(w3p$Team)
w4p$Team <- tolower(w4p$Team)

#rushing
w1ru <- data.table(read.csv('Week1Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w1ru$Week <- 1
w2ru <- data.table(read.csv('Week2Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w2ru$Week <- 2
w3ru <- data.table(read.csv('Week3Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w3ru$Week <- 3
w4ru <- data.table(read.csv('Week4Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w4ru$Week <- 4

w1ru$Team <- tolower(w1ru$Team)
w2ru$Team <- tolower(w2ru$Team)
w3ru$Team <- tolower(w3ru$Team)
w4ru$Team <- tolower(w4ru$Team)

#receiving
w1re <- data.table(read.csv('Week1Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w1re$Week <- 1
w2re <- data.table(read.csv('Week2Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w2re$Week <- 2
w3re <- data.table(read.csv('Week3Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w3re$Week <- 3
w4re <- data.table(read.csv('Week4Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w4re$Week <- 4

w1re$Team <- tolower(w1re$Team)
w2re$Team <- tolower(w2re$Team)
w3re$Team <- tolower(w3re$Team)
w4re$Team <- tolower(w4re$Team)

#Kicking
w1k <- data.table(read.csv('Week1Kicking.txt',sep = "\t", stringsAsFactors = FALSE))
w1k$Week <- 1
w2k <- data.table(read.csv('Week2Kicking.txt',sep = "\t", stringsAsFactors = FALSE))
w2k$Week <- 2
w3k <- data.table(read.csv('Week3Kicking.txt',sep = "\t", stringsAsFactors = FALSE))
w3k$Week <- 3
w4k <- data.table(read.csv('Week4Kicking.txt',sep = "\t", stringsAsFactors = FALSE))
w4k$Week <- 4

w1k$Team <- tolower(w1k$Team)
w2k$Team <- tolower(w2k$Team)
w3k$Team <- tolower(w3k$Team)
w3k$Team <- tolower(w3k$Team)
####################################################################################################################
w1pf <- FormatNames(w1p)
w2pf <- FormatNames(w2p)
w3pf <- FormatNames(w3p)
w4pf <- FormatNames(w4p)

w1ruf <- FormatNames(w1ru)
w2ruf <- FormatNames(w2ru)
w3ruf <- FormatNames(w3ru)
w4ruf <- FormatNames(w4ru)

w1ref <- FormatNames(w1re)
w2ref <- FormatNames(w2re)
w3ref <- FormatNames(w3re)
w4ref <- FormatNames(w4re)

w1kf <- FormatNames(w1k)
w2kf <- FormatNames(w2k)
w3kf <- FormatNames(w3k)
w4kf <- FormatNames(w4k)

setkey(w1pf,Name)
setkey(w2pf,Name)
setkey(w3pf,Name)
setkey(w4pf,Name)
setkey(w1ruf,Name)
setkey(w2ruf,Name)
setkey(w3ruf,Name)
setkey(w4ruf,Name)
setkey(w1ref,Name)
setkey(w2ref,Name)
setkey(w3ref,Name)
setkey(w4ref,Name)
setkey(w1kf,Name)
setkey(w2kf,Name)
setkey(w3kf,Name)
setkey(w4kf,Name)

passingstats <-rbind(w1pf,w2pf,w3pf,w4pf)
ps<- FormatStatsTable(passingstats)
names(ps)[names(ps)=="Att"] <- "PlayerPassingAttempts"
names(ps)[names(ps)=="Comp"] <- "PlayerCompletions"
names(ps)[names(ps)=="Yds"] <- "PlayerPassingYds"
names(ps)[names(ps)=="TD"] <- "PlayerPassingTDs"
names(ps)[names(ps)=="Int"] <- "PlayerInterceptions"
names(ps)[names(ps)=="Sck"] <- "PlayerSacked"
names(ps)[names(ps)=="Fum"] <- "PlayerFumbles"
names(ps)[names(ps)=="Rate"] <- "PlayerPassRating"


rushingstats <-rbind(w1ruf,w2ruf,w3ruf,w4ruf)
rus<- FormatStatsTable(rushingstats)
names(rus)[names(rus)=="Att"] <- "PlayerRushingAttempts"
names(rus)[names(rus)=="Yds"] <- "PlayerRushingYds"
names(rus)[names(rus)=="TD"] <- "PlayerRushingTDs"
names(rus)[names(rus)=="Fum"] <- "PlayerFumbles"

receivingstats <- rbind(w1ref,w2ref,w3ref,w4ref)
rec <- FormatStatsTable(receivingstats)
names(rec)[names(rec)=="Rec"] <- "PlayerReceptions"
names(rec)[names(rec)=="Yds"] <- "PlayerReceivingYds"
names(rec)[names(rec)=="TD"] <- "PlayerReceivingTDs"
names(rec)[names(rec)=="Fum"] <- "PlayerFumbles"

kickingstats <- rbind(w1kf,w2kf,w3kf,w4kf)
k <- FormatStatsTable(kickingstats)
names(k)[names(k)=="Rec"] <- "PlayerReceptions"
names(k)[names(k)=="Yds"] <- "PlayerReceivingYds"
names(k)[names(k)=="TD"] <- "PlayerReceivingTDs"
names(k)[names(k)=="Fum"] <- "PlayerFumbles"

f <- rbind(ps,rus,rec,k,fill=TRUE)
f[,"TeamID"] <- 0
finalData <- AssignTeamIDs(f)

# stats <- final
# #Upload data for prediction
UploadFanduelLineup(path,finalData,d,name)
