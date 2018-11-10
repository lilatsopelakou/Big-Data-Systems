a<-NULL
b<-NULL
d<-NULL
for(i in 1:11) {
a[i]<-as.numeric(r$HGET(paste("stock_id:",agg[i,1]),"volume_buy"))
b[i]<-as.numeric(r$HGET(paste("stock_id:",agg[i,1]),"volume_sell"))
d[i]<-a[i]/b[i]
}
  


for (i in 1:11){
  print(r$HGET(paste("stock_id:",agg[i,1]), "average"))
  
}


n<-length(r$LRANGE(i,0,-1))
e<-NULL
for (i in r$KEYS("* BUY")){
  e[i]<-as.numeric(mean(as.numeric(unlist(r$LRANGE(i,n-30,n)))))
  
}

f<-NULL
for (i in r$KEYS("* SELL")){
  f[i]<-as.numeric(mean(as.numeric(unlist(r$LRANGE(i,n-30,n)))))
  
}



n<-length(r$LRANGE(i,0,-1))
c<-NULL
for (i in r$KEYS("stock_id:*")){
  for (j in 1:11) {
    
  
  c[j]<-as.numeric(r$HGET(paste("stock_id:",agg[j,1]), "average"))
  if (c[i] > 2.5){
    
    
  }

}
  
  
}

