library(dplyr)
dat<-read.csv("femaleMiceWeights.csv")
controls<-filter(dat,Diet=="chow")%>%select(Bodyweight)%>%unlist
treatment<-filter(dat,Diet=="hf")%>%select(Bodyweight)%>%unlist
t.test<-t.test(treatment,controls)
t.test
mean(controls)
mean(treatment)


