library(data.table)

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

#subset table 
t1 <- p0[which(p0$Name %like% "Cousins")]
###########################################################

#Table manipulation########################################
#add team ID column names (to cbind using column IDs)
p[,"TeamID"] <- NA

#get first 7 rows and all columns
players <- players[1:7,]
defenses <- defenses[1:7,]

#create a table with 71 columns
#add the column names from a list
m <- data.table(data.frame(matrix(0, ncol = 71, nrow = 0)))
colnames(m) <- t$Results$`FP Predictions`$value$ColumnNames

#rename a single column
names(myexp)[names(myexp)=="Team.x"] <- "Team"


Employees <- data.table(read.csv('Employees.csv'))
Departments <- data.table(read.csv('Departments.csv'))

#Inner join
# set the ON clause as keys of the tables:
setkey(Employees,Department)
setkey(Departments,Department)

# perform the join using the merge function
Result <- merge(Employees,Departments, all.x=TRUE)


###########################################################

#String manipulation
n <- paste0('Mohtashemi', ', ', 'Iman')
n <- paste('Mohtashemi','Iman')
#no space
n <- paste('Mohtashemi','Iman',sep = "")

#change order of first and last name and add a comma in between
x <- strsplit('Mohtashemi Iman'," ")
y <- strsplit(x[[1]]," " )
View(y)
paste0(y[2],', ',y[1])











