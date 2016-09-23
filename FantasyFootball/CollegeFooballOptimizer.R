library(Rglpk)
library(data.table)


final <- read.csv('FanDuel-CFB-2015-10-24-13318-players-list.csv')

# objective:
obj <- final$FPPG
# the vars are represented as booleans
var.types <- rep("B", num.players)
# the constraints
matrix <- rbind(as.numeric(final$Position == "QB"), # num QB
                as.numeric(final$Position == "RB"), # num RB
                as.numeric(final$Position == "WR"), # num WR
                as.numeric(final$Position == "TE"), # num TE
                final$Salary)                       # total cost
direction <- c("==",
               "==",
               "==",
               "==",
               "<=")
rhs <- c(1, # Quartbacks
         2, # RB Min
         3, # WR Min
         1, # TE Min
         45000)                # By default, you get 50K to spend, so leave this number alone. 

sol <- Rglpk_solve_LP(obj = obj, mat = matrix, dir = direction, rhs = rhs,
                      types = var.types, max = TRUE)



d <- data.table(cbind(sol[2],final))

l <- d[d$solution != 0]
View(l)
