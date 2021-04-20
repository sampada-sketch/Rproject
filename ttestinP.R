
population<-read.csv("femaleControlsPopulation.csv")
population<-unlist(population)


n<-10000
nulls<-vector("numeric",n)
for(i in 1:n)
{
  controls<-sample(population,N)
  treatment<-sample(population,N)
  se<-sqrt(var(treatment)/N+var(controls)/N)
  nulls[i]<-(mean(treatment)-mean(controls))/se
}


library(rafalib)
mypar()
qqnorm(nulls)
abline(0,1)
qqline(nulls)
