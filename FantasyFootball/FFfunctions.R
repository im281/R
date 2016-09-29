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
           55000)                # By default, you get 60K to spend, so leave this number alone. but save 5k for a defense
  
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

