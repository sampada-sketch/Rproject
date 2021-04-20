dat<-read.csv("femaleMiceWeights.csv")

library(dplyr)
View(dat)
controls<-filter(dat,Diet=="chow")
View(controls)
select(controls,Bodyweight)
controls<-select(controls,Bodyweight)
unlist(controls)
controls<-filter(dat,Diet=="chow")%>%select(Bodyweight)%>%unlist




