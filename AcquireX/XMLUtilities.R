
url <- "http://www.fantasyfootballnerd.com/service/player/xml/test/13/"

# Load the packages required to read XML files.
library("XML")
library("methods")

# Convert the input xml file to a data frame.
xmldataframe <- xmlToDataFrame(url)
print(xmldataframe)