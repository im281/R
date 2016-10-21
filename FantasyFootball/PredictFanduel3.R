library(data.table)
source('FFfunctions.R')


#Defense (This text file will be different each week)
rd <- '2016RunD.txt'
pd <- '2016passD.txt'
td <- '2016totalD.txt'

#Get latest defensive statistics from text
d <- GetLatestDefense(rd,pd,td,2016)


path <- 'C:/Users/Owner/OneDrive/Source/Repos/R/FantasyFootball/Fanduel/FanDuel-NFL-2016-10-16-16578-players-list.csv'

#Current Fanduel Players 
c <- data.table(read.csv(path))

# remove injured players
c <- c[which(c$Injury.Indicator == "")]
idData <- data.table(read.csv('RotoguruPlayerIds.csv',stringsAsFactors = FALSE))

#Conver the name formats
input <- ConvertFanduelCSV(c,idData,6)
input[,"TeamID"] <- 0

#subset the player tables so it doesn't contain defensive data
input <- input[which(input$Name %like% "Defense" == FALSE)]

#some players are duplicated (Fanduel IDs?)
input <- input[!duplicated(input$Name), ]


p[,"TeamID"] <- 0
d[,"TeamID"] <- 0
players <- AssignTeamIDs(input)
defense <- AssignTeamIDsDefense(d)

setkey(players,TeamID)
setkey(defense,TeamID)

#prediction data
pd <- merge(players,defense,all = TRUE)

#Assign 0 to NAs
pd[is.na(pd)] <- 0


UploadToMLStudio(pd,'W6_SunMon.csv')





