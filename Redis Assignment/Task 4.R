
for (i in r$KEYS("* PRICE")){
  print(i)
  print(mean(as.numeric(unlist(r$LRANGE(i,0,-1)))))
  print(max(as.numeric(unlist(r$LRANGE(i,0,-1)))))
  print(min(as.numeric(unlist(r$LRANGE(i,0,-1)))))
}

