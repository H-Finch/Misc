library("ggmap")
library(maptools)
library(maps)
data=read.csv("maps.csv",header=TRUE)
attach(data)
head(data)

mp <- NULL
mapWorld <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
mp <- ggplot() +   mapWorld
mp


mp=mp+geom_point(aes(x=Long, y=Lat),color="red", size=Sum.of.MisuseAmt)+
  geom_text(aes(label=Country,x=Long,y=Lat),hjust = 0, nudge_x = 0.05)

mp

