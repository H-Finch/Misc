library(ggplot2)
library(ggthemes)
library(ggrepel)
data=read.csv("graph.csv",header = T)
attach(data)
p=ggplot(data,aes(x,y))+geom_point()+theme(axis.ticks=element_blank(),axis.title=element_text(size=14,face="bold"),axis.text.x=element_blank(),panel.grid.major = element_blank(),
                                           panel.grid.minor = element_blank(),
                                           axis.text.y=element_blank(),panel.background = element_blank(),axis.line = element_line(colour = "black"))+xlab("Complexity")+ylab("Competitve Advantage")#+geom_text(aes(x,y,label = label)) 
p+geom_label(label=label,aes(fill = factor(label)), colour = "white", fontface = "bold",size=4.6)+guides(fill=FALSE)

  