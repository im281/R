library(Rglpk)
library(data.table)

final <- read.csv('bb.csv')

# objective:
obj <- final$FPPG
# the vars are represented as booleans
var.types <- rep("B", num.players)
# the constraints
matrix <- rbind(as.numeric(final$Position == "P"), # num P
                as.numeric(final$Position == "C"), # num C
                as.numeric(final$Position == "1B"), # num 1B
                as.numeric(final$Position == "2B"), # num 2B
                as.numeric(final$Position == "3B"),  # num 3B
                as.numeric(final$Position == "SS"),  # num SS  
                as.numeric(final$Position == "OF"),  # num OF 
                final$Salary)                       
direction <- c("==",
               "==",
               "==",
               "==",
               "==",
               "==",
               "==",
               "<=")
rhs <- c(1, # Quartbacks
         1, # RB Min
         1, # WR Min
         1, # TE Min
         1, # K Max
         1, # Defense
         3, # Defense
         35000)                # By default, you get 50K to spend, so leave this number alone. 

sol <- Rglpk_solve_LP(obj = obj, mat = matrix, dir = direction, rhs = rhs,
                      types = var.types, max = TRUE)



d <- data.table(cbind(sol[2],final))

l <- d[d$solution != 0]
View(l)
