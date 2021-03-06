library(data.table)
source('FFfunctions.R')
source('FootballOptimizer.R')

#fanduel data http://rotoguru1.com/cgi-bin/fyday.pl?week=1&game=fd&scsv=1
#2015 stats
#Training#
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

#2016 stats########################################################################################################
w18 <- read.csv('Week1.txt', sep = ';',stringsAsFactors = FALSE)
w19 <- read.csv('Week2.txt', sep = ';',stringsAsFactors = FALSE)
w20 <- read.csv('Week3.txt', sep = ';',stringsAsFactors = FALSE)
###################################################################################################################

#append the tables on the row
p <- data.table(rbind(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20))

#subset the player tables so it doesn't contain defensive data
p <- p[which(p$Name %like% "Defense" == FALSE)]

#add offensive stats per player to the table for each player

#read the multidimensional defense tables
#NFL stats page http://www.nfl.com/stats/team?seasonId=2015&seasonType=REG&Submit=Go

#Mergin tables######################################################################################################

#Each week get the latest defensive stats and retrain the model

#2015 run pass and total defense
runD15 <- data.table(read.csv('2015RunD.txt',sep = "\t"))
passD15 <- data.table(read.csv('2015PassD.txt',sep = "\t"))
totalD15 <- data.table(read.csv('2015TotalD.txt',sep ="\t"))

#merge 2015 stats to one table
runandpass2015 <- merge(runD15,passD15,by="Team")
runandpassandtotal2015 <- merge(runandpass2015 ,totalD15,by="Team")
runandpassandtotal2015[,"Year"] <- 2015

#2016 run pass and total defense
runD16 <- data.table(read.csv('2016RunD.txt',sep = "\t"))
passD16 <- data.table(read.csv('2016PassD.txt',sep = "\t"))
totalD16 <- data.table(read.csv('2016TotalD.txt',sep ="\t"))
runandpassandtotal2015[,"Year"] <- 2016

#merge 2015 stats to one table
runandpass2016 <- merge(runD16,passD16,by="Team")
runandpassandtotal2016 <- merge(runandpass2016 ,totalD16,by="Team")

#row bind
finalD <- rbind(runandpassandtotal2015,runandpassandtotal2016,fill=TRUE)
d <- finalD
#####################################################################################################################


#add team ID column names (to cbind using column IDs)
p[,"TeamID"] <- 0
d[,"TeamID"] <- 0

players <- AssignTeamIDs(p)
defenses <- AssignTeamIDsDefense(d)

# setkey(players,'TeamID')
# setkey(defenses,'TeamID')

#join the tables on Team ID. Player and the opposing team
matrix = merge(players,defenses, by='TeamID',allow.cartesian = TRUE)
write.csv(matrix,'ffd7.csv')
UploadToMLStudio(myexp,'ffd7.csv')

#End Training

#Experiment##########################################################################################################
path <- 'C:/Users/Owner/Source/Repos/R/FantasyFootball/Fanduel/FanDuel-NFL-2016-09-29-16456-players-W4-Thurs-Sun-list.csv'
t <- data.table(read.csv(path,stringsAsFactors = FALSE))
# remove injured players
t <- t[which(t$Injury.Indicator == "")]
idData<- data.table(read.csv('RotoguruPlayerIds.csv',stringsAsFactors = FALSE))

input <- ConvertFanduelCSV(t,idData)
input[,"TeamID"] <- 0
experiment <- AssignTeamIDs(input)
#setkey(experiment,'TeamID')

myexp <- merge(experiment,defenses, by='TeamID',allow.cartesian = TRUE)
#rename points and salary columns
colnames(myexp)[colnames(myexp)=="FD.Points"] <- "FD.points"
colnames(myexp)[colnames(myexp)=="FD.Salary"] <- "FD.salary"
write.csv(myexp,'Week4_Thurs_Sun_Exp.csv')
UploadToMLStudio(myexp,'Week4_Thurs_Sun_Exp.csv')
#####################################################################################################################

#Optimize the lineup##############################################################
#csvFile < 'THE FILE PATH TO CSV FILE WITH EXTENSION'
csvFile <- 'W4_Thurs_Mon_FullModel_P.csv'
data <- data.table(read.csv(csvFile))
d <- OptimizeFBLineup(data)


##TESTS############################################################################################################


po <- data.table(read.csv('2016PassO.txt', sep = "\t"))
View(po)

#onlt numeric columns
dt <- data[sapply(data,is.numeric)]
cor(dt)

#regression
# Multiple Linear Regression Example 
fit <- lm(data$Scored.Labels ~ data$Rk.y + data$Yds.x + data$FD.salary + 
            data$TD.y + data$TotPts.y + data$TD.x + data$X3rd.Pct + data$Att.x + 
            data$Yds.G.x,data=data)
summary(fit) # show result

# diagnostic plots 
#layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit)






# Other useful functions 
coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics





#example###############
y <- c(1,2,3,4,5)
x <-c(1,2,3,4,5)
fit <- lm(y ~ x)
summary(fit) # show results





######################################################################################################################



