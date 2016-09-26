library(RCurl)
library(rjson)
library(rlist)
library(data.table)

# Accept SSL certificates issued by public Certificate Authorities
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

h = basicTextGatherer()
hdr = basicHeaderGatherer()


req = list(
  
  Inputs = list(
    
    "Matchups" = list(
      "ColumnNames" = list("Column 0", "TeamID", "Week", "Year.x", "GID", "Name", "Pos", "Team.x", "h.a", "Oppt", "FD.points", "FD.salary", "Team.y", "Rk.x", "G.x", "Pts.G.x", "TotPts.x", "Att.x", "Att.G.x", "Yds.x", "Avg.x", "Yds.G.x", "TD.x", "Lng.x", "X1st.x", "X1st..x", "X20..x", "X40..x", "FUM.x", "Rk.y", "G.y", "Pts.G.y", "TotPts.y", "Comp", "Att.y", "Pct", "Att.G.y", "Yds.y", "Avg.y", "Yds.G.y", "TD.y", "Int", "X1st.y", "X1st..y", "Lng.y", "X20..y", "X40..y", "Sck", "Rate", "k", "G", "Pts.G", "TotPts", "Scrm.Plys", "Yds.G", "Yds.P", "X1st.G", "X3rd.Md", "X3rd.Att", "X3rd.Pct", "X4th.Md", "X4th.Att", "X4th.Pct", "Pen", "Pen.Yds", "ToP.G", "FUM.y", "Lost", "Year.y", "Rk"),
      "Values" = list( list( "0", "0", "0", "0", "0", "value", "value", "value", "value", "value", "0", "0", "value", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "value", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "value", "0", "0", "0", "0", "value", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "value", "0", "0", "value", "value" ),  list( "0", "0", "0", "0", "0", "value", "value", "value", "value", "value", "0", "0", "value", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "value", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "value", "0", "0", "0", "0", "value", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "value", "0", "0", "value", "value" )  )
    )                ),
  GlobalParameters = setNames(fromJSON('{}'), character(0))
)

body = enc2utf8(toJSON(req))
api_key = "LfKcv781k71h84kKdmx5/sHLRvBSwr5npoQGwHKYJ92esnVZKY4QTU0FCLp6GcLmH87E1zZ5L7/SZ8zA+EP29A==" # Replace this with the API key for the web service
authz_hdr = paste('Bearer', api_key, sep=' ')

h$reset()
curlPerform(url = "https://ussouthcentral.services.azureml.net/workspaces/8dbb390855c44346b02db40767f19b60/services/e36570f47d2e4ff5b039b6cf80209566/execute?api-version=2.0&details=true",
            httpheader=c('Content-Type' = "application/json", 'Authorization' = authz_hdr),
            postfields=body,
            writefunction = h$update,
            headerfunction = hdr$update,
            verbose = TRUE
)

headers = hdr$value()
httpStatus = headers["status"]
if (httpStatus >= 400)
{
  print(paste("The request failed with status code:", httpStatus, sep=" "))
  
  # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
  print(headers)
}

print("Result:")
result = h$value()
print(fromJSON(result))

#Tests
#########################
dt <- data.table(data.frame(matrix(unlist(fromJSON(result)), nrow=214, byrow=T),stringsAsFactors=FALSE))
t <- data.table(unlist(fromJSON(result)))
t <- fromJSON(result)

n <- data.table(unlist(t$Results$`FP Predictions`$value$ColumnNames))
v <- data.table(unlist(t$Results$`FP Predictions`$value$Values))

r <- rbind(v,n)
View(r)

m <- data.table(data.frame(matrix(0, ncol = 71, nrow = 0)))
colnames(m) <- t$Results$`FP Predictions`$value$ColumnNames
values <- t$Results$`FP Predictions`$value$Values

dt <- data.table(values[[1]])
dt <- t(dt)

test <- rbind(m,dt)

View(test)


x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
          p2 = list(type='B',score=list(c1=9,c2=9)),
          p3 = list(type='B',score=list(c1=9,c2=7)))
list.table(x, type)
list.table(x, type, c1 = score$c1)
list.table(x, type, score$c1, table.args = list(dnn=c('type','c1')))

df <- data.frame(matrix(unlist(t$Results$`FP Predictions`$value$ColumnNames), nrow=71, byrow=T),stringsAsFactors=FALSE)
            