library("scales")


value1 <- NULL
for(i in r$KEYS("* PRICE")) {
  value1[i] <-mean(as.numeric(unlist(r$LRANGE(i,0,-1))))
}

value2 <- NULL
for(i in 1:11) {
   value2[i] <- as.numeric(r$HGET(paste("stock_id:",agg[i,1]),"price_close"))
}

final<-NULL
for(i in 1:11) {
  final[i]<-(value2[i]-value1[i])
  print(percent(final[i]))
}
