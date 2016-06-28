library("ggmap")
library(maptools)
library(maps)
library(ggrepel)
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




mp=mp+geom_point(aes(x=Long, y=Lat),color="red", size=3)+
  geom_label_repel(aes(label=Label,x=Long,y=Lat,fill = factor(Country)),
             color="white",angle=45)+theme(legend.position="none")
mp
