library(sunburstR)
data=read.csv("sun2.csv",header=T)
attach(data)
sunburst(data)

# head(data) ----> input format
# paths counts
# <1 min-30K _ 40K    261
# <1 min-40K _ 50K   5731
# <1 min-50K _ 60K   3455
# <1 min-60K _ 70K    593
# <1 min-70K _ 80K     53
# <1 min-80K _ 90K   1130