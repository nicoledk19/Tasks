setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Project')
Data1<-read.csv("AntData.csv")
#Data1
#Data2<-read.csv("AntData2.csv")
#Data2
#hypothesis
#Will a larger head width have an impact of what task the ants are assigned in different species
##My hypothesis is that there is a stronger size-task association between honeydew collectors and protein foragers or nest builders in different species of Formica ants.

VARtable <- data.frame(species=rep(NA, length=length(unique(Data1$Species))), HC=rep(NA, length=length(unique(Data1$Species))), NB=rep(NA, length=length(unique(Data1$Species))), PF=rep(NA, length=length(unique(Data1$Species))))
counter <- 1

for (i in unique(Data1$Species)){
  Species <- Data1[which(Data1$Species == i),]
  VARtable[counter,1] <- i
  
  X <- Species$Task
  repHC <- which(X == "HC")
  repNB <- which(X == "NB")
  repPF <- which(X == "PF")
  Z <- rep(1, length(X))
  Z[repHC] <- rnorm(length(repHC), 2, 0.05)
  Z[repNB] <- rnorm(length(repNB), 3, 0.05)
  Z[repPF] <- rnorm(length(repPF), 4, 0.05)

  VARtable[counter,2:4] <- c(var(Species$Head.Width[repHC]), var(Species$Head.Width[repNB]), var(Species$Head.Width[repPF]))
  counter <- counter+1
  pdf(paste(i, ".pdf", sep=""))
  par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
  plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
  axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
  mtext(i, side=3, line=1.5)
  boxplot(Species$Head.Width~X, add=T, at=c(2,3,4), boxwex=0.25, col=c(rgb(1,0,0, .5), rgb(0,1,0, .5), rgb(0,0,1, .5)))
    dev.off()
}
VARtable
chisq.test(VARtable)
X <- aov(Head.Width ~ Species + Task, data=Data1)
#interaction <- aov(Head.Width ~ Species * Task, data=Data1)

summary(X)
#summary(interaction)

library(nnet)
mlr <- multinom(Task ~ Head.Width + Species, data=Data1, Hess=TRUE, trace=FALSE)
mlr
summary(mlr)
z<-summary(mlr)$coefficients/summary(mlr)$standard.errors
z
p<-(1-pnorm(abs(z), 0, 1)) *2
p
exp(coef(mlr))
head(probability.table<-fitted(mlr))
confint(mlr)
exp(confint(mlr))
#predict(mlr, newdata=data.frame(Head.Width=1.2, type="probs")

Data1$Task<-factor(Data1$Task, levels=c("HC", "NB", "PF"))


table(Data1$Task)
prop.table(table(Data1$Task))
library(ggplot2)


ggplot(Data1)+aes(x=Task, y=Head.Width)+geom_boxplot()
#predict
#install.packages(ggeffects)
library(ggeffects)
mlr_ME <- ggeffect(mlr, terms = "Head.Width[0.25:2.5,by=0.01]")

Cols <- c('#a6cee3','#1f78b4','#b2df8a')
names(Cols) <- c("HC", "NB", "PF")
plot(mlr_ME$x, mlr_ME$predicted, pch=16, col=Cols[mlr_ME$response.level], xlim=c(0, 2.5), ylim=c(0,1))

for (i in 1:length(mlr_ME$x)){
  segments(mlr_ME$x[i], mlr_ME$conf.low[i], mlr_ME$x[i], mlr_ME$conf.high[i], lwd=1, col=Cols[mlr_ME$response.level[i]])
}

#predict(mlr, newdata=data.frame(length=0:2), type='probs')
#ggpredict(mlr, terms="length[0:2, by 0.1]")
                   
#mlr2<-multinom(Task~Head.Width, data=Data1)
#mlr2

#mlr3<-multinom(Task~Species, data=Data1)
#mlr3


Colos <- unique(Data1$Colony)
ByColony <- matrix(data=0, nrow=length(Colos), ncol=3)
colnames(ByColony) <- c("HC", "NB", "PF")
Spp <- c()
for (i in 1:length(Colos)){
  sub <- Data1[which(Data1$Colony == Colos[i]),]
  Dat <- tapply(sub$Head.Width, sub$Task, mean, na.rm=T)
  ByColony[i,names(Dat)] <- Dat
  Spp[i] <- sub$Species[1]
}

Cols <- rainbow(10)
names(Cols) <- unique(Data1$Species)
par(mfrow=c(1,3))
plot(ByColony[,"NB"], ByColony[,"HC"], pch=16, col=Cols[Spp])
legend("bottomleft", col=Cols, legend=names(Cols), pch=16)
plot(ByColony[,"NB"], ByColony[,"PF"], pch=16, col=Cols[Spp])
plot(ByColony[,"PF"], ByColony[,"HC"], pch=16, col=Cols[Spp])
dev.off()

#install.packages("AICcmodavg")
#library(AICcmodavg)
#model.set<-list(X, interaction)
#model.names<-c("X", "interaction")
#aictab(model.set, modnames=model.names)

#interaction of species and task has the best fit line so we will use that test to continue. 
#summary(interaction)

#TukeyHSD(interaction)
TukeyHSD(X)


#### Everything plot
X <- Data1$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

Colors <- rainbow(length(unique(Data1$Species)))
names(Colors) <- unique(Data1$Species)
plot(Z, Data1$Head.Width, pch=16, col=Colors[Data1$Species], xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)

VARtable

SpTaskCode <- sapply(1:nrow(Data1), function(x) paste(Data1[x,"Species"], Data1[x,"Task"], sep="."))

SpVars <- tapply(Data1[,"Head.Width"], Data1[,"Species"], var, na.rm=T)
SpTaskMeans <- tapply(Data1[,"Head.Width"], SpTaskCode, mean, na.rm=T)

#The output coefficients are shown as log of odds and in order to make them easier to understand and interpret, we exponentiate the coefficients. After being exponentiated NB to HC the output coefficient was 70.98. The output coefficient for PF to HC was 37.46. 
