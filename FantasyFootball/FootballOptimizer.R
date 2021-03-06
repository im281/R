
RunOptimizer1 <- function(x)
{
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
}