

#Subsetting Data###########################################
#some data: two datbles appendend on the rows
final <- data.table(rbind(w1,w2))

#search for a column name
final2 <- final[which(final$Name == 'Washington Defense'),]
final2 <- final[which(grepl('Washington Defense',final))]


#Search for a partial string
test <- final[, final$Name %like% "Defense"]

#subset the table with searching
test1 <- final[which(final$Name %like% "Defense" == FALSE)]
###########################################################

#Table manipulation########################################
#add team ID column names (to cbind using column IDs)
p[,"TeamID"] <- NA

#get first 7 rows and all columns
players <- players[1:7,]
defenses <- defenses[1:7,]

###########################################################

#String manipulation
n <- paste0('Mohtashemi', ', ', 'Iman')
n <- paste('Mohtashemi','Iman')
