
#library(stringdist)


dict=read.csv("dict.csv",header=T)
dict[with(dict,order(dict)),]
pat=read.csv("pat.csv",header=T)
pat[with(pat,order(pat)),]

#some look-&-find before the heavy-lifting

#pat$pat[!pat$pat %in% dict$dict]
# for (i in 1:nrow(pat)) {
#   for(j in 1:nrow(dict)){
#   if (!is.null(pat$pat[i] == dict$dict[j])) {
#     out$out[i]=pat[i]
#     pat[!pat$pat==pat[i],]
#   }
# }}


df=reshape::expand.grid.df(pat,dict)
n=nrow(df)
df=df[with(df,order(pat,dict)),]

#######
#For writing output to file & append
# write.table(rbind(names(data.frame(i=1, distance=n[1])))
#             ,file="output.csv",append=FALSE   # <~~ Don't append for first run.
#             , sep=",", col.names=FALSE, row.names=FALSE)
# 
# for (i in 1:n) {
#   n[[i]] <- stringdist(df[i,1], df[i,2], method="osa")
#   write.table(data.frame(i=i,distance=n[i]),file="output.csv"
#               ,append=TRUE, sep=",", col.names=FALSE, row.names=FALSE)
#   print(n[[i]])
#   flush.console()
# }
#######

#Algo: For every name, compare in dictionary and get least/max score per name
#Requires reshape & stringdist, stringdist() might be replaced possibly by base::adist()

####
pat=gsub(" ","",pat) #possible optimization
dict=gsub(" ","",dict)#possible optimization
####


for (i in 1:n) {
  #df$n[[i]] <- stringdist(tolower(df[i,1]), tolower(df[i,2]), method="osa")
  df$n[[i]] <- adist(df[i,1], df[i,2], ignore.case = T) #COMPUTATIONALLY INTENSIVE!!
  print(df$n[[i]])
  #flush.console()
  #svMisc::progress(i,progress.bar=T) #for a nifty progress bar
}
fin=aggregate(n~pat,df,function(x)min(x)) #write to csv if needed
fin


### Measuring how long it takes for the loop to run. Output is in seconds
system.time(for (i in 1:n) {
  #df$n[[i]] <- stringdist(tolower(df[i,1]), tolower(df[i,2]), method="osa")
  df$n[[i]] <- adist(df[i,1], df[i,2], ignore.case = T) #COMPUTATIONALLY INTENSIVE!! O(n^2)
  #print(df$n[[i]])
  #flush.console()
  #svMisc::progress(i,progress.bar=T) #for a nifty progress bar #9+ hours for 18L combinations
})

tmp=split(df,df$pat)
tmp  =  lapply(tmp,function(x)
  x[x$n == min(x$n),])
tmp=do.call(rbind,tmp)

# library(fuzzyjoin)
# cbind(pat,m,stringdist(tolower(pat),tolower(m),method="cosine"))
# method_list <- c("osa", "lv", "dl", "hamming", "lcs", "qgram", "cosine", 
#                  "jaccard", "jw", "soundex")
# ndf <- expand.grid(lapply(data.frame(pat=pat), levels)) 
# for( i in method_list){
#   
#   ndf[,i] <- stringdist(m,pat,method=i)
#   
# }
