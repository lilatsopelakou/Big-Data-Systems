library("redux")

#Remote Connection
r <- redux::hiredis(
  redux::redis_config(
    host = "redis-11045.c16.us-east-1-3.ec2.cloud.redislabs.com", 
    port = "11045", 
    password = "2091992"))

agg<-read.table("aggregated_stock_data.csv",sep=",",header = TRUE)
agg



for (i in 1:11){
  r$HMSET(paste("stock_id:",agg[i,1]), c("price_open", "price_close", "volume_buy", "volume_sell"), 
          c(agg[i,2], agg[i,3], agg[i,4], agg[i,5]))
  
}



r$HGETALL("stock_id: CSCO")
r$HGETALL("stock_id: AAPL")
r$HGETALL("stock_id: GOOG")
