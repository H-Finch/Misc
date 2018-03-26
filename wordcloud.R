library(wordcloud)
library(RColorBrewer)
library(tm)
library(SnowBallC)
library(ggplot2)
library(ggthemes)

words=words <- readLines("month.txt")
# words=Corpus(VectorSource(words))
# words=tm_map(words,removeNumbers)
# words=tm_map(words,removePunctuation)
# words=tm_map(words, removeWords, stopwords("english"))
# writeLines(as.character(words), con="mycorpus.txt")
# t=unlist(words)
# freq=table(t)
# t1=sort(freq, decreasing=TRUE)
wordcloud(words, 
          scale=c(5.5,0.5), 
          max.words=100, 
          random.order=FALSE, 
          rot.per=0.40)
ggColors <- function(n) {
  hues = seq(15, 375, length=n+1)
  hcl(h=hues, l=65, c=100)[1:n]
}
gg.cols <- ggColors(8)
bp.cols<- c("light blue","cornflowerblue", "coral2", brewer.pal(8,"Dark2"))
wordcloud(words, 
          scale=c(5.5,0.5), 
          max.words=100, 
          random.order=FALSE, 
          rot.per=0.40, 
          use.r.layout=FALSE, 
          random.color=TRUE, 
          colors=bp.cols)

