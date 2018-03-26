library(NISTunits)
lat1=NISTdegTOradian(19.202)
lat2=NISTdegTOradian(13.0292)
lon1=NISTdegTOradian(72.9725)
lon2=NISTdegTOradian(80.2708)
dlon = lon2 - lon1 
dlat = lat2 - lat1 
a = (sin(dlat/2))^2 + cos(lat1) * cos(lat2) * (sin(dlon/2))^2 
c = 2 * atan2( sqrt(a), sqrt(1-a) ) 

d=c*6371
d

data=read.csv("dist.csv",header=T)
attach(data)
head(data)
slat=NISTdegTOradian(data$slat)
slong=NISTdegTOradian(data$slong)
dlat=NISTdegTOradian(data$dlat)
dlong=NISTdegTOradian(data$dlong)
dilon = dlong- slong
dilat = dlat - slat 
a = (sin(dilat/2))^2 + cos(slat) * cos(dlat) * (sin(dilon/2))^2 
c = 2 * atan2( sqrt(a), sqrt(1-a) ) 

d=c*6373
d
data$d=d
write.csv(data,"dist2.csv")
