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

OptimizeFBLineup <- function(dt){
  RunOptimizer(dt[!is.na(data$Rk)])
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

###############################################################

