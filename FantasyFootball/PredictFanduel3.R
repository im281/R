library(data.table)
source('FFfunctions.R')


#Defense (This text file will be different each week)
rd <- '2016RunD.txt'
pd <- '2016passD.txt'
td <- '2016totalD.txt'

#Get latest defensive statistics from text
d <- GetLatestDefense(rd,pd,td,2016)


path <- 'C:/Users/Owner/OneDrive/Source/Repos/R/FantasyFootball/Fanduel/FanDuel-NFL-2016-10-16-16565-players-list.csv'

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


UploadToMLStudio(pd,'W6_Main.csv')



#W6_Thurs_Mon_P



#csvFile < 'THE FILE PATH TO CSV FILE WITH EXTENSION'
csvFile <- 'W6_Main_P.csv'
d <- data.table(read.csv(csvFile))
names(d)[names(d)=="TeamID.x"] <- "TeamID"
#using boeasted decision trees
result <- OptimizeFBLineup(d)

f <- data.table(read.csv('W6_Main_P.csv'))

final <- f[2:nrow(f),]
num.players = length(final$GID)
final <- final[which(final$Pos != 0),]

# objective:
obj <- final$Scored.Labels
# the vars are represented as booleans
var.types <- rep("B", num.players)
# the constraints
matrix <- rbind(
  as.numeric(final$Pos == "QB"), # num QB
  as.numeric(final$Pos == "RB"), # num RB
  as.numeric(final$Pos == "WR"), # num WR
  as.numeric(final$Pos == "TE"), # num TE
  as.numeric(final$Pos == "K"),  # num K
  #as.numeric(final$Position == "D"),  # num DE
  final$FD.salary
)                       # total cost
direction <- c("==",
               "==",
               "==",
               "==",
               "==",
               #"==",
               "<=")
rhs <- c(1, # Quartbacks
         2, # RB Min
         3, # WR Min
         1, # TE Min
         1, # K Max
         #1, # Defense
         55000)                # By default, you get 60K to spend, so leave this number alone. but save 5k for a defense

sol <-
  Rglpk_solve_LP(
    obj = obj, mat = matrix, dir = direction, rhs = rhs,
    types = var.types, max = TRUE
  )

opt <- data.table(unlist(sol[2])) 
d <- data.table(cbind(opt,final))
l <- d[d$V1 != 0]
View(l)

print(packageVersion("data.table"))

str(final)


test <- c(2,54,6,7,7)


