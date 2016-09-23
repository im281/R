library(data.table)


#2015 stats
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

#2016 stats
w18 <- read.csv('Week1.txt', sep = ';',stringsAsFactors = FALSE)
w19 <- read.csv('Week2.txt', sep = ';',stringsAsFactors = FALSE)


#append the tables on teh row
p <- data.table(rbind(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19))

#subset the player tables so it doesn't contain defensive data
p <- p[which(p$Name %like% "Defense" == FALSE)]

#read the multidimensional defense table
d <- data.table(read.csv('FF.csv',stringsAsFactors = FALSE))

#add team ID column names (to cbind using column IDs)
p[,"TeamID"] <- 0
d[,"TeamID"] <- 0

finalD[,"TeamID"] <- 0

players <- AssignTeamIDs(p)
defenses <- AssignTeamIDsDefense(finalD)

setkey(players,'TeamID')
setkey(defenses,'TeamID')


#join the tables on Team ID. Player and the opposing team
matrix1 = merge(players,defenses, by='TeamID')

runD15 <- data.table(read.csv('2015RunD.txt',sep = "\t"))
passD15 <- data.table(read.csv('2015PassD.txt',sep = "\t"))
totalD15 <- data.table(read.csv('2015TotalD.txt',sep ="\t"))

runD16 <- data.table(read.csv('2016RunD.txt',sep = "\t"))
passD16 <- data.table(read.csv('2016PassD.txt',sep = "\t"))
totalD16 <- data.table(read.csv('2016TotalD.txt',sep ="\t"))

runandpass <- merge(runD16,passD16,by="Team")
runandpassandtotal <- merge(runandpass ,totalD16,by="Team")

finalD <- rbind(D2015,runandpassandtotal,fill=TRUE)


test <- merge(runD15,D2015,by= 'Team')

D2015[,"Year"] <- 2015
runandpassandtotal[,"Year"] <- 2016


test <- data.table(read.csv('possiblefinal.csv'))
test1 <- test[which(test$Name == 'Wilson, Russell')]

#Functions#####################################################
AssignTeamIDs <- function(t){
  #add team ID column names (to cbind using column IDs)

  for(i in 1:nrow(t)){
    if(t[i]$Team == 'Arizona Cardinals' || t[i]$Oppt == 'ari'){
      t[i]$TeamID <- 1
      }
    if(t[i]$Team == 'Atlanta Falcons' || t[i]$Oppt == 'atl'){
      t[i]$TeamID <- 2
    }
    if(t[i]$Team == 'Baltimore Ravens' || t[i]$Oppt== 'bal'){
      t[i]$TeamID <- 3
    }
    if(t[i]$Team == 'Buffalo Bills' || t[i]$Oppt == 'buf'){
      t[i]$TeamID <- 4
    }
    if(t[i]$Team == 'Carolina Panthers' || t[i]$Oppt == 'car'){
      t[i]$TeamID <- 5
    }
    if(t[i]$Team == 'Chicago Bears' || t[i]$Oppt == 'chi'){
      t[i]$TeamID <- 6
    }
    if(t[i]$Team == 'Cincinnati Bengals' || t[i]$Oppt == 'cin'){
      t[i]$TeamID <- 7
    }
    if(t[i]$Team == 'Clevland Browns' || t[i]$Oppt == 'cle'){
      t[i]$TeamID <- 8
    }
    if(t[i]$Team == 'Dallas Cowboys' || t[i]$Oppt == 'dal'){
      t[i]$TeamID <- 9
    }
    if(t[i]$Team == 'Denver Broncos' || t[i]$Oppt == 'den'){
      t[i]$TeamID <- 10
    }
    if(t[i]$Team == 'Detroit Lions' || t[i]$Oppt == 'det'){
      t[i]$TeamID <- 11
    }
    if(t[i]$Team == 'Green Bay Packers' || t[i]$Oppt == 'gnb'){
      t[i]$TeamID <- 12
    }
    if(t[i]$Team == 'Houston Texans' || t[i]$Oppt == 'hou'){
      t[i]$TeamID <- 13
    }
    ###TODO
    if(t[i]$Team == 'Indianapolis Colts' || t[i]$Oppt == 'ind'){
      t[i]$TeamID <- 14
    }
    if(t[i]$Team == 'Jacksonville Jaguars' || t[i]$Oppt == 'jac'){
      t[i]$TeamID <- 15
    }
    if(t[i]$Team == 'Kansas City Chiefs' || t[i]$Oppt == 'kan'){
      t[i]$TeamID <- 16
    }

    # thre rest
    if(t[i]$Team == 'Los Angeles Rams' || t[i]$Oppt == 'lar'){
      t[i]$TeamID <- 17
    }
    if(t[i]$Team == 'Miami Dolphins' || t[i]$Oppt == 'mia'){
      t[i]$TeamID <- 18
    }
    if(t[i]$Team == 'Minnesota Vikings' || t[i]$Oppt== 'min'){
      t[i]$TeamID <- 19
    }
    if(t[i]$Team == 'New England Patriots' || t[i]$Oppt == 'nwe'){
      t[i]$TeamID <- 20
    }
    if(t[i]$Team == 'New Orleans Saints' || t[i]$Oppt == 'nor'){
      t[i]$TeamID <- 21
    }
    if(t[i]$Team == 'New York Giants' || t[i]$Oppt == 'nyg'){
      t[i]$TeamID <- 22
    }
    if(t[i]$Team == 'New York Jets' || t[i]$Oppt == 'nyj'){
      t[i]$TeamID <- 23
    }
    if(t[i]$Team == 'Oakland Raiders' || t[i]$Oppt == 'oak'){
      t[i]$TeamID <- 24
    }
    ###
    if(t[i]$Team == 'Philadelphia Eagles' || t[i]$Oppt == 'phi'){
      t[i]$TeamID <- 25
    }
    if(t[i]$Team == 'Pittsburgh Steelers' || t[i]$Oppt == 'pit'){
      t[i]$TeamID <- 26
    }
    if(t[i]$Team == 'San Diego Chargers' || t[i]$Oppt == 'sdg'){
      t[i]$TeamID <- 27
    }
    if(t[i]$Team == 'San Francisco 49ers' || t[i]$Oppt == 'sfo'){
      t[i]$TeamID <- 28
    }
    if(t[i]$Team == 'Seattle Seahawks' || t[i]$Oppt == 'sea'){
      t[i]$TeamID <- 29
    }
    ###TODO
    if(t[i]$Team == 'Tampa Bay Buccaneers' || t[i]$Oppt == 'tam'){
      t[i]$TeamID <- 30
    }
    if(t[i]$Team == 'Tennessee Titans' || t[i]$Oppt == 'ten'){
      t[i]$TeamID <- 31
    }
    if(t[i]$Team == 'Washington Redskins' || t[i]$Oppt == 'was'){
      t[i]$TeamID <- 32
    }
  }
  return (t)
}

AssignTeamIDsDefense <- function(t){
  #add team ID column names (to cbind using column IDs)
  
  for(i in 1:nrow(t)){
    if(t[i]$Team == 'Arizona Cardinals'){
      t[i]$TeamID <- 1
    }
    if(t[i]$Team == 'Atlanta Falcons'){
      t[i]$TeamID <- 2
    }
    if(t[i]$Team == 'Baltimore Ravens'){
      t[i]$TeamID <- 3
    }
    if(t[i]$Team == 'Buffalo Bills'){
      t[i]$TeamID <- 4
    }
    if(t[i]$Team == 'Carolina Panthers'){
      t[i]$TeamID <- 5
    }
    if(t[i]$Team == 'Chicago Bears'){
      t[i]$TeamID <- 6
    }
    if(t[i]$Team == 'Cincinnati Bengals'){
      t[i]$TeamID <- 7
    }
    if(t[i]$Team == 'Clevland Browns'){
      t[i]$TeamID <- 8
    }
    if(t[i]$Team == 'Dallas Cowboys'){
      t[i]$TeamID <- 9
    }
    if(t[i]$Team == 'Denver Broncos'){
      t[i]$TeamID <- 10
    }
    if(t[i]$Team == 'Detroit Lions'){
      t[i]$TeamID <- 11
    }
    if(t[i]$Team == 'Green Bay Packers'){
      t[i]$TeamID <- 12
    }
    if(t[i]$Team == 'Houston Texans'){
      t[i]$TeamID <- 13
    }
    ###TODO
    if(t[i]$Team == 'Indianapolis Colts'){
      t[i]$TeamID <- 14
    }
    if(t[i]$Team == 'Jacksonville Jaguars'){
      t[i]$TeamID <- 15
    }
    if(t[i]$Team == 'Kansas City Chiefs'){
      t[i]$TeamID <- 16
    }
    
    if(t[i]$Team == 'Los Angeles Rams'){
      t[i]$TeamID <- 17
    }
    if(t[i]$Team == 'Miami Dolphins'){
      t[i]$TeamID <- 18
    }
    if(t[i]$Team == 'Minnesota Vikings'){
      t[i]$TeamID <- 19
    }
    if(t[i]$Team == 'New England Patriots'){
      t[i]$TeamID <- 20
    }
    if(t[i]$Team == 'New Orleans Saints'){
      t[i]$TeamID <- 21
    }
    if(t[i]$Team == 'New York Giants'){
      t[i]$TeamID <- 22
    }
    if(t[i]$Team == 'New York Jets'){
      t[i]$TeamID <- 23
    }
    if(t[i]$Team == 'Oakland Raiders'){
      t[i]$TeamID <- 24
    }
    ###
    if(t[i]$Team == 'Philadelphia Eagles'){
      t[i]$TeamID <- 25
    }
    if(t[i]$Team == 'Pittsburgh Steelers'){
      t[i]$TeamID <- 26
    }
    if(t[i]$Team == 'San Diego Chargers'){
      t[i]$TeamID <- 27
    }
    if(t[i]$Team == 'San Francisco 49ers'){
      t[i]$TeamID <- 28
    }
    if(t[i]$Team == 'Seattle Seahawks'){
      t[i]$TeamID <- 29
    }
    ###TODO
    if(t[i]$Team == 'Tampa Bay Buccaneers'){
      t[i]$TeamID <- 30
    }
    if(t[i]$Team == 'Tennessee Titans'){
      t[i]$TeamID <- 31
    }
    if(t[i]$Team == 'Washington Redskins'){
      t[i]$TeamID <- 32
    }
  }
  return (t)
}










