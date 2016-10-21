#Search for a partial string
t1 <- po[which(po$Player %like% "Cousins")]
View(t1)


nrow(p)

for(i in  1:nrow(p)){
  
}


target <- p[11]
View(target)

t <- po[which(po$Player %like% strsplit(target$Name,","))]
View(t)

t <- po[which(po$Player == 'Andy Dalton')]

f <- cbind(t,target)

ts <- strsplit(target$Name,",")


#2016  offensive stats
#passsing
w1p <- data.table(read.csv('Week1Passing.txt',sep = "\t", stringsAsFactors = FALSE))
w1p$Team <- tolower(w1p$Team)

#rushing
w1ru <- data.table(read.csv('Week1Rushing.txt',sep = "\t", stringsAsFactors = FALSE))
w1ru$Team <- tolower(w1ru$Team)

#receiving
w1re <- data.table(read.csv('Week1Receiving.txt',sep = "\t", stringsAsFactors = FALSE))
w1re$Team <- tolower(w1re$Team)

#sacs
#assign team IDs since they are defensice players
w1s <- data.table(read.csv('Week1Sacs.txt',sep = "\t", stringsAsFactors = FALSE))
w1s$Team <- tolower(w1s$Team)
w1s[,"TeamID"] <- 0
#Need to assign Team as Oppt for function to be consistent
names(w1s)[names(w1s)=="Team"] <- "Oppt"
newp <- AssignTeamIDs(w1s)
names(newp)[names(newp)=="Oppt"] <- "Team"
View(newp)

w2s <- data.table(read.csv('Week2Sacs.txt',sep = "\t", stringsAsFactors = FALSE))
w2s$Team <- tolower(w2s$Team)
w2s[,"TeamID"] <- 0
#Need to assign Team as Oppt for function to be consistent
names(w2s)[names(w2s)=="Team"] <- "Oppt"
newp1 <- AssignTeamIDs(w2s)
names(newp1)[names(newp1)=="Oppt"] <- "Team"
View(newp1)

w3s <- data.table(read.csv('Week3Sacs.txt',sep = "\t", stringsAsFactors = FALSE))
w3s$Team <- tolower(w3s$Team)
w3s[,"TeamID"] <- 0
#Need to assign Team as Oppt for function to be consistent
names(w3s)[names(w3s)=="Team"] <- "Oppt"
newp2 <- AssignTeamIDs(w3s)
names(newp2)[names(newp2)=="Oppt"] <- "Team"
View(newp2)


defensivePlayers <- rbind(newp,newp1,newp2)


setkey(w1p,Team)
setkey(p,Team)

# perform the join using the merge function
test <- merge(w1p,p, all.x=FALSE)
View(test)




Employees <- data.table(read.csv('Employees.csv'))
#View(Employees)
Departments <- data.table(read.csv('Departments.csv'))
#View(Department)
# set the ON clause as keys of the tables:
setkey(Employees,Department)
setkey(Departments,Department)
# perform the join using the merge function
Result <- merge(Employees,Departments, all.x=TRUE)
View(Result)
 
players <- p[1:5,]
stats <- po[1:5,]

# sort by mpg
players <- p[order(Name),]


setkey(palmer,Team)
setkey(poo,Team)
result <- merge(palmer,poo, all.x = TRUE)
View(result)

p <- w1p[1]


x <- strsplit(p$Name," ")
y <- strsplit(x[[1]]," " )
View(y)
paste0(y[2],', ',y[1])
p$Name

#test on Brees Join the tables (Offensive stats and Fanduel format)
####################################################################
breesstats <- w1p[which(w1p$Name == 'Drew Brees')]
brees <-  p[which(p$Name == 'Brees, Drew')]
#po$Team <- tolower(po$Team)

x <- strsplit(breesstats$Name," ")
y <- strsplit(x[[1]]," " )
View(y)
breesstats$Name <- paste0(y[2],', ',y[1])
p$Name
 
setkey(brees,Name)
setkey(breesstats,Name)
result <- merge(brees,breesstats, all.x = TRUE)
View(result)


x <- strsplit(passingstats[1]$Opp, ' ')
y <- tolower(strsplit(x[[1]]," " ))
View(y)
####################################################################

x <- strsplit(w1p$Name," ")
y <- strsplit(x[[1]]," " )
View(y)
w1p$Name <- paste0(y[2],', ',y[1])

test <- FormatNames(w1p)


setkey(w1p,Name)
setkey(p,Name)

result1 <- merge(p,test, all.x = TRUE, allow.cartesian = TRUE)
#rename a single column
names(result1)[names(result1)=="Team.x"] <- "Team"
####################################################################

setkey(defensivePlayers,TeamID)
setkey(defenses,TeamID)

alldefense <- merge(defensivePlayers,defenses,all.x = TRUE,allow.cartesian = TRUE)


#join the tables on Team ID. Player and the opposing team
matrix = merge(players,alldefense, by='TeamID',allow.cartesian = TRUE)
write.csv(matrix,'ffd6.csv')
UploadToMLStudio(myexp,'ffd6.csv')



plot(result$Yds,result$Scored.Labels, with(result, text(sr~dpi, labels = row.names(result), pos = 4)))




w1 <- read.csv('Week1.txt', sep = ';',stringsAsFactors = FALSE)
w2 <- read.csv('Week2.txt', sep = ';',stringsAsFactors = FALSE)
w3 <- read.csv('Week3.txt', sep = ';',stringsAsFactors = FALSE)
library(TTR)


w4$MA <- 'MA'

#Modify column names
#################################################################

rd <- '2016RunD.txt'
pd <- '2016passD.txt'
td <- '2016totalD.txt'

test <- GetLatestDefense(rd,pd,td,2016)



names(ps)[names(ps)=="Att"] <- "PlayerPassingAttempts"
names(ps)[names(ps)=="Comp"] <- "PlayerCompletions"
names(ps)[names(ps)=="Yds"] <- "PlayerPassingYds"
names(ps)[names(ps)=="TD"] <- "PlayerPassingTDs"
names(ps)[names(ps)=="Int"] <- "PlayerInterceptions"
names(ps)[names(ps)=="Sck"] <- "PlayerSacked"
names(ps)[names(ps)=="Fum"] <- "PlayerFumbles"
names(ps)[names(ps)=="Rate"] <- "PlayerPassRating"




test <- data.table(read.csv('W3_TrainingData.csv'))

# Multiple Linear Regression Example 
fit <- lm(d$Scored.Labels ~ d$PassDefenseRating + d$PlayerPassingYds + d$FD.salary, data=d)
summary(fit) # show results


colnames(d)

# Multiple Linear Regression Example 
fit <- lm(test$Scored.Labels ~ . , data=test)
summary(fit) # show results

test <- d[c(34:93)]


y <- c(1,4,6)
d <- data.frame(y = y, x1 = c(4,-1,3), x2 = c(3,9,8), x3 = c(4,-4,-2))
mod <- lm(y ~ ., data = d)
summary(mod)







rush <- data.table(read.csv('rush.csv'))
pass <- data.table(read.csv('pass.csv'))


setkey(rush,Name,Week,Team,Oppt,Opp,Score)
setkey(pass,Name,Week,Team,Oppt,Opp,Score)

t <- merge(rush,pass,all = TRUE)
View(t)

df$y <- ifelse(df$z == "A", x[1], ifelse(df$z == "B", x[2], ifelse(df$z == "C", x[3], NA)))

t$Team.x[is.na(t$Team.x)] <- t$Team.y


test <- data.table(read.csv('C:/Users/Owner/OneDrive/Source/Repos/R/FantasyFootball/Data/runD2016.csv'))
View(test)

#Rushing column has longests run with a T (for touchdown)
levels(test$Lng) <- sub("T", "", levels(test$Lng))
View(test)

str(levels(test$Lng))

str(test)
