data=read.csv("v.csv",header=T)
attach(data)
head(data)
library(data.table)
dt=data.table(data)
#no. of times card used @ mcc
dt[ , mccount := 1:.N , by = c("card" , "mcc") ]

#avg per MCc
dt$Conc=paste(dt$card,dt$mcc)
dt[order(card,mcc)]
df=dt[,.(Mean=cumsum(amt)/1:length(amt)),(Conc)]
dt$Mean=paste(df$Mean)
