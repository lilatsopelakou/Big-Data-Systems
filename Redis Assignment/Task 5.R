n<-length(r$LRANGE(i,0,-1))

for (i in r$KEYS("* PRICE")){
  print(i)
  print(mean(as.numeric(unlist(r$LRANGE(i,n-30,n)))))
  
}