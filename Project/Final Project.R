setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Project')
Data1<-read.csv("AntData.csv")
#hypothesis: 

#10 boxplots for 10 Species showing association between task and head width
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
  jpeg(paste(i, ".jpeg", sep=""))
  par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
  plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
  axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
  mtext(i, side=3, line=1.5)
  boxplot(Species$Head.Width~X, add=T, at=c(2,3,4), boxwex=0.25, col=c(rgb(1,0,0, .5), rgb(0,1,0, .5), rgb(0,0,1, .5)))
  dev.off()
}


#multinomial logistic regression looking at head width and species impact on task assignment
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

#boxplot of headwidth by task for all species

Data1$Task<-factor(Data1$Task, levels=c("HC", "NB", "PF"))

table(Data1$Task)
prop.table(table(Data1$Task))

library(ggplot2)

mlr2<-multinom(Task~Head.Width, data=Data1)
mlr2
summary(mlr2)
exp(coef(mlr2)['NB', 'Head.Width'])
exp(coef(mlr2)['PF', 'Head.Width'])
confint(mlr2)
exp(confint(mlr2))

jpeg("HeadWidthbyTaskboxplot.jpeg")
totalplot<-ggplot(Data1)+aes(x=Task, y=Head.Width)+geom_boxplot()
dev.off()

jpeg("HeadWidthbyTaskscatterplot.jpeg")
ggplot(Data1)+aes(y=Head.Width, x=Task)+geom_point(position=position_jitter(width=0.1, height=0))
dev.off()

#graph showing the predicted probability of a task assignment based on head width of an ant

library(ggeffects)
mlr_ME <- ggeffect(mlr, terms = "Head.Width[0.25:2.5,by=0.01]")
mlr_ME

jpeg("multinomialregression.jpeg")
Cols <- c('#a6cee3','#1f78b4','#b2df8a')
names(Cols) <- c("HC", "NB", "PF")
plot(mlr_ME$x, mlr_ME$predicted, pch=16, col=Cols[mlr_ME$response.level], xlim=c(0, 2.5), ylim=c(0,1), ylab="Predicted Probabilities", xlab="Head Width")

for (i in 1:length(mlr_ME$x)){
  segments(mlr_ME$x[i], mlr_ME$conf.low[i], mlr_ME$x[i], mlr_ME$conf.high[i], lwd=1, col=Cols[mlr_ME$response.level[i]])
}
dev.off()

jpeg("Phylogeny.jpeg")
text.string<-
  "((F. Ulkei), (((F. Rufa Sp. #2), (F. Rufa Sp. #1, F. Obscuriventris)), (F. Dakotensis, F. Aserva)), ((F. Neorufibarbis), ((F. Neoclara), (F. Glacialis, F. Podzolica))));"
vert.tree<-read.tree(text=text.string)
plot(vert.tree, edge.width=2)
dev.off()
