con <- socketConnection(host="46.101.203.215", port = 1337, blocking=TRUE,
                        server=FALSE, open="r+")

while(TRUE){
  server_resp <- readLines(con, 1)
  split<- strsplit(server_resp,",")[[1]]
  print(split)
  print(r$TIME())
  PRICEGOOG <-split[2]
  h<-as.numeric(unlist(r$TIME())[1])
  
  
  r$RPUSH(paste(split[1],"PRICE"),split[2])
  r$RPUSH(paste(split[1],"SELL"),split[3])
  r$RPUSH(paste(split[1],"BUY"),split[4])
  
  if (split[1]=="GOOG"){
    r$ZADD("PRICE GOOG",h,PRICEGOOG)
    
  }

}

r$ZRANGE("PRICE GOOG", 0, -1,"WITHSCORES")

r$ZREMRANGEBYSCORE("PRICE GOOG","-inf",h-20)
