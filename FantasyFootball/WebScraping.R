
library(XML)
srts <-htmlParse("http://rotoguru1.com/cgi-bin/fyday.pl?week=2&game=fd&scsv=0")
class(srts)
d <- readHTMLTable(srts,stringsAsFactors = FALSE)
#View(d[1])



library(RDCOMClient) 
u <- "http://stackoverflow.com/questions/tagged?tagnames=r"
ie <- COMCreate("InternetExplorer.Application") 
ie$Navigate(u)
txt <- list()
txt[[u]] <- ie[["document"]][["body"]][["innerText"]] 
ie$Quit() 
print(txt) 



test <- "http://www.nfl.com/stats/categorystats?tabSeq=2&defensiveStatisticCategory=TEAM_PASSING&conference=ALL&role=OPP&season=2016&seasonType=REG&d-447263-s=PASSING_NET_YARDS_GAME_AVG&d-447263-o=1&d-447263-n=1"
srts <-htmlParse(test)
class(srts)
d <- readHTMLTable(srts,stringsAsFactors = FALSE)
View(d)

