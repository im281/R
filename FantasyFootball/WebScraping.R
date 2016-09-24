
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

