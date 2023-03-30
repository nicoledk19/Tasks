setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Task_08')
library(phytools)
#Questions 1-3
trees<-list()
births<-vector()
Fractions<-vector()

for(i in 1:100){
  births[i]<-runif(1)
  Fractions[i]<-runif(1)
  trees[[i]]<-pbtree(births[i], births[i] * Fractions[i], n=100)
}
trees

#do i need to set min and max to 1 and 100? 
#do I need to somehow make it to where randomly selecting the number also accounts for the first randomly selected one or do i just select another one? 
#Question 4
exrate<-births*Fractions
nd<-births-exrate
trees
Fractions
tiplog<-log(sapply(trees, Ntip))
tiplog

plot(nd, tiplog, xlab="Net Diversification", ylab="Log of Tips")
abline(lm(tiplog~nd), col="red")
dev.off()
#Question 5
avgbranchlength<-vector()

for(i in 1:100){
  births[i]<-runif(1)
  Fractions[i]<-runif(1)
  trees[[i]]<-pbtree(n=100, b=births[[i]], d=(births[[i]]*Fractions[i]))
  avgbranchlength[i]<-mean(trees[[i]]$edge.length)
}

avgbranchlength
plot(births, avgbranchlength, xlab="Speciation Rate", ylab="Average Branch Length")

#Question 6
cor(births, avgbranchlength)

#Question 7
MaxTree<-which.is.max(sapply(trees, Ntip))
MaxTree
Tree<-trees[[MaxTree]]
Tree
plot(Tree)
rates<- vector()
traits<-list()
for(i in 1:100){
  rates[i]<-runif(1)
 traits[[i]]<- fastBM(tree=Tree, sig2=rates[[i]])
}

#Question 8
mean<-sapply(traits, mean)
cor(mean, rates)
plot(mean, rates, xlab="Mean of Traits", ylab="Rates")
#Question 9
variance<-sapply(traits, var)
cor(variance, rates)
plot(variance, rates, xlab="Variance of Traits", ylab="Rates")
#Question 10
trait1<-traits[[1]]
trait2<-traits[[2]]
cor(trait1, trait2)
traitMat<-cbind(traits[[1]], traits[[4]])
traitMat
pdf("08_plot.pdf")
plot(traitMat)
dev.off()

#EC
pdf("08_ec.pdf")
phylomorphospace(Tree, traitMat)
phylomorphospace
dev.off()
