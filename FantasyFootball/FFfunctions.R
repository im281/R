library(data.table)


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
    if(t[i]$Team == 'Green Bay Packers' || t[i]$Oppt == 'gnb' || t[i]$Oppt == 'gb'){
      t[i]$TeamID <- 12
    }
    if(t[i]$Team == 'Houston Texans' || t[i]$Oppt == 'hou'){
      t[i]$TeamID <- 13
    }
    ###TODO
     if(t[i]$Team == 'Indianapolis Colts' || t[i]$Oppt == 'ind'){
       t[i]$TeamID <- 14
    }
    if(t[i]$Team == 'Jacksonville Jaguars' || t[i]$Oppt == 'jac' || t[i]$Oppt == 'jax' ){
      t[i]$TeamID <- 15
    }
    if(t[i]$Team == 'Kansas City Chiefs' || t[i]$Oppt == 'kan' || t[i]$Oppt == 'kc'){
      t[i]$TeamID <- 16
    }
    
    # thre rest
    if(t[i]$Team == 'Los Angeles Rams' || t[i]$Oppt == 'lar' || t[i]$Oppt == 'la'){
      t[i]$TeamID <- 17
    }
    if(t[i]$Team == 'Miami Dolphins' || t[i]$Oppt == 'mia'){
      t[i]$TeamID <- 18
    }
    if(t[i]$Team == 'Minnesota Vikings' || t[i]$Oppt== 'min'){
      t[i]$TeamID <- 19
    }
    if(t[i]$Team == 'New England Patriots' || t[i]$Oppt == 'nwe' || t[i]$Oppt == 'ne'){
      t[i]$TeamID <- 20
    }
    if(t[i]$Team == 'New Orleans Saints' || t[i]$Oppt == 'nor' || t[i]$Oppt == 'no'){
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
    if(t[i]$Team == 'San Diego Chargers' || t[i]$Oppt == 'sdg' || t[i]$Oppt == 'sd'){
      t[i]$TeamID <- 27
    }
    if(t[i]$Team == 'San Francisco 49ers' || t[i]$Oppt == 'sfo' || t[i]$Oppt == 'sf'){
      t[i]$TeamID <- 28
    }
    if(t[i]$Team == 'Seattle Seahawks' || t[i]$Oppt == 'sea'){
      t[i]$TeamID <- 29
    }
    ###TODO
    if(t[i]$Team == 'Tampa Bay Buccaneers' || t[i]$Oppt == 'tam' || t[i]$Oppt == 'tb'){
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
    if(t[i]$Team == 'Cleveland Browns'){
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
    
    if(t[i]$Team == 'Los Angeles Rams' || t[i]$Team == 'St. Louis Rams'){
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

ConvertFanduelCSV <- function(t,id){
  
  
  tmpDataTable <- data.table(
    Week = integer(),
    Year = integer(),
    GID = integer(),
    Name = character(),  
    Pos = character(),
    Team = character(),
    h.a = character(),
    Oppt = character(),
    FD.points = numeric(),
    FD.salary = integer())
  
  for(i in 1:nrow(t)){
    
    n <- paste0(t[i]$Last.Name,', ',t[i]$First.Name)
    key <- id[which(id$Name == n)]$ID
    
    if(length(key) > 0){
      tmpDataTable <- rbind(tmpDataTable,data.table(
        Week = 3,
        Year = 2016,
        Name = n,
        GID = key,
        Pos = t[i]$Position,
        Team = t[i]$Team,
        h.a = 't',
        Oppt = tolower(t[i]$Opponent),
        FD.points = tolower(t[i]$FPPG),
        FD.salary = tolower(t[i]$Salary)
      ))
    }
  
  }
  
  return (tmpDataTable)
  
}

RunOptimizer <- function(x){
  library(Rglpk)
  library(data.table)
  
  final <- x
  num.players = length(final$GID)
  final <- final[which(final$Pos != 0)]
  
  
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
  return (l)
}

RunOptimizer1 <- function(x){
  library(Rglpk)
  library(data.table)
  
  final <- x
  final <- final[which(final$Pos != 0)]
  num.players = length(final$GID)
  
  #final <- d[which(d$Injury.Indicator != 'O'),]
  
  
  #final <- read.csv('FanDuel-NFL-2016-09-19-16371-players-list.csv')
  
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
    as.numeric(final$Pos == "PK"),  # num K
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
  return (l)
}

RunDFOptimizer <- function(x){
  library(Rglpk)
  library(data.table)

  x1 <- x[which(x$Pos != 0)]
  num.players = length(x1$GID)
  
  #final <- d[which(d$Injury.Indicator != 'O'),]
  
  
  #final <- read.csv('FanDuel-NFL-2016-09-19-16371-players-list.csv')
  
  # objective:
  obj <- x1$Scored.Label.Mean
  # the vars are represented as booleans
  var.types <- rep("B", num.players)
  # the constraints
  matrix <- rbind(
    as.numeric(x1$Pos == "QB"), # num QB
    as.numeric(x1$Pos == "RB"), # num RB
    as.numeric(x1$Pos == "WR"), # num WR
    as.numeric(x1$Pos == "TE"), # num TE
    as.numeric(x1$Pos == "K"),  # num K
    #as.numeric(final$Position == "D"),  # num DE
    x1$FD.salary
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
           55100)                # By default, you get 60K to spend, so leave this number alone. but save 5k for a defense
  
  sol <-
    Rglpk_solve_LP(
      obj = obj, mat = matrix, dir = direction, rhs = rhs,
      types = var.types, max = TRUE
    )
  
  opt <- data.table(unlist(sol[2]))
  
  d <- data.table(cbind(opt,x1))
  
  l <- d[d$V1 != 0]
  View(l)
  return (l)
}

OptimizeFBLineup <- function(dt){
  RunOptimizer(dt[!is.na(data$Rk)])
}

OptimizeFBLineup1 <- function(dt){
  RunOptimizer1(dt[!is.na(data$Rk)])
}

OptimizeFBLineupDFPredicted <- function(dt){
  RunDFOptimizer(dt[!is.na(data$Rk)])
}

FormatNames <- function(statstable) {
  for(i in 1:nrow(statstable)){
    x <- strsplit(statstable[i]$Name, " ")
    y <- strsplit(x[[1]], " ")
    statstable[i]$Name <- paste0(y[2], ', ', y[1])
  }
  test = 0
  return(statstable)
 
}

FormatStatsTable <-function(statstable){
  statstable$Oppt <- ""
  for(i in 1:nrow(statstable)){
    x <- strsplit(statstable[i]$Opp, ' ')
    y <-  tolower(strsplit(x[[1]]," " ))
    statstable[i]$Oppt <- y[2]
  }
  test = 0
  return(statstable)
}

###############################################################

AssignTeamIDs1 <- function(t){
  #add team ID column names (to cbind using column IDs)
  
  temp1 <- t[which(t$Oppt == 'ari')]
  temp1$TeamID <- 1
  temp2 <- t[which(t$Oppt == 'atl')]
  temp2$TeamID <- 2
  temp3 <- t[which(t$Oppt == 'bal')]
  temp3$TeamID <- 3
  temp4 <- t[which(t$Oppt == 'buf')]
  temp4$TeamID <- 4
  temp5 <- t[which(t$Oppt == 'car')]
  temp5$TeamID <- 5
  temp6 <- t[which(t$Oppt == 'chi')]
  temp6$TeamID <- 6
  temp7 <- t[which(t$Oppt == 'cin')]
  temp7$TeamID <- 7
  temp8 <- t[which(t$Oppt == 'cle')]
  temp8$TeamID <- 8
  
  
  temp9 <- t[which(t$Oppt == 'dal')]
  temp9$TeamID <- 9
  temp10 <- t[which(t$Oppt == 'den')]
  temp10$TeamID <- 10
  temp11 <- t[which(t$Oppt == 'gnb' || t$Oppt == 'gb')]
  temp11$TeamID <- 11
  temp12 <- t[which(t$Oppt == 'hou')]
  temp12$TeamID <- 12
  temp13 <- t[which(t$Oppt == 'ind')]
  temp13$TeamID <- 13
  temp14 <- t[which(t$Oppt == 'jac' || t$Oppt == 'jax')]
  temp14$TeamID <- 14
  temp15 <- t[which(t$Oppt == 'kan' || t$Oppt == 'kc')]
  temp15$TeamID <- 15
  temp16 <- t[which(t$Oppt == 'lar' || t$Oppt == 'la')]
  temp16$TeamID <- 16
  
  temp17 <- t[which(t$Oppt == 'mia')]
  temp17$TeamID <- 17
  temp18 <- t[which(t$Oppt == 'min')]
  temp18$TeamID <- 18
  temp19 <- t[which(t$Oppt == 'gnb' || t$Oppt == 'gb')]
  temp19$TeamID <- 19
  temp20 <- t[which(t$Oppt == 'nwe' || t$Oppt == 'ne')]
  temp20$TeamID <- 20
  temp21 <- t[which( t$Oppt == 'nor' || t$Oppt == 'no')]
  temp21$TeamID <- 21
  temp22 <- t[which(t$Oppt == 'nyg')]
  temp22$TeamID <- 22
  temp23 <- t[which(t[i]$Oppt == 'nyj')]
  temp23$TeamID <- 23
  temp24 <- t[which(t[i]$Oppt == 'oak')]
  temp24$TeamID <- 24
  
  
  temp25 <- t[which(t$Oppt == 'phi')]
  temp25$TeamID <- 25
  temp26 <- t[which(t$Oppt == 'pit')]
  temp26$TeamID <- 26
  temp27 <- t[which(t$Oppt == 'sdg' || t$Oppt == 'sd')]
  temp27$TeamID <- 27
  temp28 <- t[which(t$Oppt == 'sfo' || t$Oppt == 'sf')]
  temp28$TeamID <- 28
  temp29 <- t[which(t$Oppt == 'sea')]
  temp29$TeamID <- 29
  temp30 <- t[which(t$Oppt == 'tam' || t$Oppt == 'tb')]
  temp30$TeamID <- 30
  temp31 <- t[which(t$Oppt == 'ten')]
  temp31$TeamID <- 31
  temp32 <- t[which(t$Oppt == 'was')]
  temp32$TeamID <- 32
  
  
  t <- rbind(temp1,temp2,temp3,temp4,temp5,temp6,temp7,
             temp8,temp9,temp10,temp11,temp12,temp13,temp14,
             temp15,temp16,temp17,temp18,temp19,temp20,temp21,
             temp22,temp23,temp24,temp25,temp26,temp27,temp28,
             temp29,temp30,temp31,temp32)

  
  return (t)
}
###############################################################

UploadFanduelLineup <- function(t,final,d,name){
  path <- t
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
  write.csv(finalfinalexp,name)
  UploadToMLStudio(finalfinalexp,name)
  
}

GetLatestDefense <- function(runD,passD,totalD,year){
  #2016 run pass and total defense
  runD16 <- data.table(read.csv(runD,sep = "\t"))
  #Rushing  column has longests run with a T (for touchdown)
  levels(runD16$Lng) <- sub("T", "", levels(runD16$Lng))
  passD16 <- data.table(read.csv(passD,sep = "\t"))
  #passing column has longests run with a T (for touchdown)
  levels(passD16$Lng) <- sub("T", "", levels(passD16$Lng))
  totalD16 <- data.table(read.csv(totalD,sep ="\t"))
  runandpassandtotal2015[,"Year"] <- year
  
  runD16 <- GetRushD(runD16)
  passD16 <- GetPassD(passD16)
  

  
  
  #merge 2015 stats to one table
  runandpass2016 <- merge(runD16,passD16,by="Team")
  d <- merge(runandpass2016 ,totalD16,by="Team")
  d[,"TeamID"] <- 0
  d <- AssignTeamIDsDefense(d)
  setkey(d,TeamID)
  
  #some clean up
  d$PassingYdsAllowed <- as.numeric(d$PassingYdsAllowed)
  d$ToP.G <- as.numeric(d$ToP.G)
  d$LongestPassAllowed <- as.numeric(d$LongestPassAllowed)
  d$LongestRunAllowed <- as.numeric(d$LongestRunAllowed)
  d$Team <- as.numeric(d$Team)
  
  return (d)
}

UploadTrainingData <- function(d,name){
  
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
  names(ps)[names(ps)=="Att"] <- "PlayerPassingAttempts"
  names(ps)[names(ps)=="Comp"] <- "PlayerCompletions"
  names(ps)[names(ps)=="Yds"] <- "PlayerPassingYds"
  names(ps)[names(ps)=="TD"] <- "PlayerPassingTDs"
  names(ps)[names(ps)=="Int"] <- "PlayerInterceptions"
  names(ps)[names(ps)=="Sck"] <- "PlayerSacked"
  names(ps)[names(ps)=="Fum"] <- "PlayerFumbles"
  names(ps)[names(ps)=="Rate"] <- "PlayerPassRating"
  
  
  rushingstats <-rbind(w1ruf,w2ruf,w3ruf)
  rus<- FormatStatsTable(rushingstats)
  names(rus)[names(rus)=="Att"] <- "PlayerRushingAttempts"
  names(rus)[names(rus)=="Yds"] <- "PlayerRushingYds"
  names(rus)[names(rus)=="TD"] <- "PlayerRushingTDs"
  names(rus)[names(rus)=="Fum"] <- "PlayerFumbles"
  
  receivingstats <- rbind(w1ref,w2ref,w3ref)
  rec <- FormatStatsTable(receivingstats)
  names(rec)[names(rec)=="Rec"] <- "PlayerReceptions"
  names(rec)[names(rec)=="Yds"] <- "PlayerReceivingYds"
  names(rec)[names(rec)=="TD"] <- "PlayerReceivingTDs"
  names(rec)[names(rec)=="Fum"] <- "PlayerFumbles"
  
  kickingstats <- rbind(w1kf,w2kf,w3kf)
  k <- FormatStatsTable(kickingstats)
  names(k)[names(k)=="Rec"] <- "PlayerReceptions"
  names(k)[names(k)=="Yds"] <- "PlayerReceivingYds"
  names(k)[names(k)=="TD"] <- "PlayerReceivingTDs"
  names(k)[names(k)=="Fum"] <- "PlayerFumbles"
  
  f <- rbind(ps,rus,rec,k,fill=TRUE)
  f[,"TeamID"] <- 0
  final <- AssignTeamIDs(f)

  setkey(final,Name,Week)
  setkey(players,Name,Week)
  finaltable <- merge(final,players,all.x = TRUE,allow.cartesian = TRUE)
  names(finaltable)[names(finaltable)=="TeamID.x"] <- "TeamID"
  setkey(finaltable,TeamID)
  setkey(d,TeamID)
  
  finalfinal <- merge(finaltable,d,all.x = TRUE,allow.cartesian = TRUE)
  #Assign 0 to NAs
  finalfinal[is.na(finalfinal)] <- 0
  write.csv(finalfinal,name)
  UploadToMLStudio(finalfinal,name)
  
  
}

GetRushD <- function(rd){

  names(rd)[names(rd)=="Rk"] <- "RushDefenseRank"
  names(rd)[names(rd)=="Pts.G"] <- "RusingPointsperGameGAllowed"
  names(rd)[names(rd)=="TotPts"] <- "TotalRushingPointsAllowed"
  names(rd)[names(rd)=="Att"] <- "TotalRushAttemptsAgainst"
  names(rd)[names(rd)=="Att.G"] <- "RushAttemptsAgainstPerGame"
  names(rd)[names(rd)=="Yds"] <- "RushYdsAllowed"
  names(rd)[names(rd)=="Avg"] <- "AverageYardsPerCarryAllowed"
  names(rd)[names(rd)=="Yds.G"] <- "RushingYardsPerGameAllowed"
  names(rd)[names(rd)=="TD"] <- "RushingTDAllowed"
  names(rd)[names(rd)=="Lng"] <- "LongestRunAllowed"
  names(rd)[names(rd)=="Avg"] <- "AverageYardsPerCarryAllowed"
  names(rd)[names(rd)=="X20."] <- "20yardsRunOrLongerAllowed"
  names(rd)[names(rd)=="X40."] <- "40yardsRunOrLongerAllowed"
  names(rd)[names(rd)=="FUM"] <- "FumblesCaused"
  names(rd)[names(rd)=="X1st"] <- "FirstDownsAllowed"
  names(rd)[names(rd)=="X1st."] <- "FirstDownPercentageAllowed"
  names(rd)[names(rd)=="G"] <- "RushingGamesPlayed"
  
  return (rd)
}

GetPassD <- function(pd){

  names(pd)[names(pd)=="Rk"] <- "PassDefenseRank"
  names(pd)[names(pd)=="Pts.G"] <- "PassingPointsperGameGAllowed"
  names(pd)[names(pd)=="TotPts"] <- "TotalPassingPointsAllowed"
  names(pd)[names(pd)=="Att"] <- "TotalPassAttemptsAgainst"
  names(pd)[names(pd)=="Att.G"] <- "PassAttemptsAgainstPerGame"
  names(pd)[names(pd)=="Yds"] <- "PassingYdsAllowed"
  names(pd)[names(pd)=="Avg"] <- "AverageYardsPerPassAllowed"
  names(pd)[names(pd)=="Yds.G"] <- "PassingYardsPerGameAllowed"
  names(pd)[names(pd)=="TD"] <- "PassingTDAllowed"
  names(pd)[names(pd)=="Lng"] <- "LongestPassAllowed"
  names(pd)[names(pd)=="Avg"] <- "AveragePassYardsAllowed"
  names(pd)[names(pd)=="X20."] <- "20yardsPassOrLongerAllowed"
  names(pd)[names(pd)=="X40."] <- "40yardsPassOrLongerAllowed"
  names(pd)[names(pd)=="Sck"] <- "Sacs"
  names(pd)[names(pd)=="X1st"] <- "PassingFirstDownsAllowed"
  names(pd)[names(pd)=="X1st."] <- "PassingFirstDownPercentageAllowed"
  names(pd)[names(pd)=="G"] <- "PassingGamesPlayed"
  names(pd)[names(pd)=="Rate"] <- "PassDefenseRating"
  names(pd)[names(pd)=="Comp"] <- "CompletionsAllowed"
  names(pd)[names(pd)=="Pct"] <- "CompletionPercentageAllowed"
  names(pd)[names(pd)=="Int"] <- "Interceptions"
  
  return(pd)
}

