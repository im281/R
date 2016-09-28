url <- "http://www.fantasyfootballnerd.com/service/player/json/test/12/"
d1 <- data.table(as.data.frame(fromJSON(file = url)))
