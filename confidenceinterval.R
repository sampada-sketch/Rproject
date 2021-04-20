set.seed(1)
chowPopulation<-read.csv("femaleControlsPopulation.csv")
chowPopulation<-unlist(chowPopulation)

mu_chow<-mean(chowPopulation)
print(chowPopulation)
N<-5

chow<-sample(chowPopulation,N)
print(mean(chow))

se<-sd(chow)/sqrt(N)
print(se)

(mean(chow)-mean(chowPopulation))/se
##Q<-qnorm(1-0.05/2)
Q <- qt(1- 0.05/2, df=4)
interval<-c(mean(chow)-Q*se,mean(chow)+Q*se)
interval
interval[1]<mu_chow&interval[2]>mu_chow
library(rafalib)
B <- 250
mypar()
plot(mean(chowPopulation)+c(-7,7),c(1,1),type="n",
     xlab="weight",ylab="interval",ylim=c(1,B))
abline(v=mean(chowPopulation))

for (i in 1:B) {
  chow <- sample(chowPopulation,N)
  se <- sd(chow)/sqrt(N)
  interval <- c(mean(chow)-Q*se, mean(chow)+Q*se)
  covered <- 
    mean(chowPopulation) <= interval[2] & mean(chowPopulation) >= interval[1]
  color <- ifelse(covered,1,2)
  lines(interval, c(i,i),col=color)
}
mypar()

                                                        