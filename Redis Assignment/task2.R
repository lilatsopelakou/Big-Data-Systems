library(rjson)
sent <- fromJSON(file="C:/Users/tsope/OneDrive/Υπολογιστής/sentiment.json")
sent

avg <- NULL
for (i in 1:11) {
  total <- 0
  for(j in 1:length(sent[[i]])) {
    total <- total + sent[[i]][[j]]$sentiment
  }
  avg[i] <- total/length(sent[[i]])
}
avg

for (i in 1:11){
  r$HSET(paste("stock_id:",agg[i,1]), "average", avg[i])
}

r$HGETALL("stock_id: CSCO")
r$HGETALL("stock_id: AAPL")
r$HGETALL("stock_id: GOOG")