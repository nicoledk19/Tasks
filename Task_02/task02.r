setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Task_02')
Data1 <- read.csv('http://jonsmitchell.com/data/beren.csv', stringsAsFactors=F)
Data2 <- read.csv('http://jonsmitchell.com/data/cyrus.csv', stringsAsFactors=F)
write.csv(Data1, 'rawdata.csv', quote=F)
head(Data1)
GlargleBrgle <-Data1
head(GlargleBrgle)
length(Data1)
nrow(Data1)
ncol(Data1)
colnames(Data1)
head(Data1)
Data1[1,]
Data1[2,]
Data1[1:3,]
Data1[1:3, 4]
Data1[1:5, 1:3]
Data1[257,1:3]
Feeds <- which(Data1[,9] =='bottle')
berenMilk<-Data1[Feeds,]
head(berenMilk)
Feeds1<-which(Data1[,'event'] =='bottle')
Feeds2<-which(Data1$event == 'bottle')
head(berenMilk)
berenMilk<-Data1[Feeds,]
head(berenMilk)
Feeds
identical(Feeds,Feeds1)
identical(Feeds,Feeds2)
identical(Feeds1, Feeds2)
#I assigned each way to a different variable and then tested to see if
#they were the same using the identical function. When all came back as true
#I determined that they were identical and therefore the three different ways were the same
dayID<-apply(Data1, 1, function(x) paste(x[1:3], collapse='-'))
dateID<-sapply(dayID, as.Date, format= "%Y-%m-%d", origin = "2019-04-18")
Data1$age<-dateID-dateID[which(Data1$event == 'birth')]
head(Data1)
beren2<-Data1
beren3<-beren2[order(beren2$age),]
head(Data1)
head(beren2)
identical(Data1, beren2)
head(beren3)
identical(beren2, beren3)
write.csv(beren3, 'beren_new.csv', quote=F, row.names=FALSE)
##Q1:The first hypothesis is not specific enough because it does not tell how much he eats, the units are not defined. 
##The second hypothesis is not appropriate because you cannot confirm or deny that there is a relationship. It is not specific enough to be a good hypothesis, you would need to specify whether it is a positive or negative relationship.  
head(beren3)
#length(1)
#length(Data)
length(Data1)
nrow(Data1)
naps<-which(Data1$event=='nap')
naps
head(naps)
solid_dates<-which(Data1$event=='solids')
solid_dates
solid_dates1<-dateID[which(Data1$event=='solids')]
solid_dates1
head(beren2)
head(beren3)
length(Data1)
nrow(Data1)
naps
#Data1age
solid_dates1
Feeds<-which(beren3$event == "bottle")
avgMilk<- mean(beren3$value[Feeds])
avgMilk
avgFeed<-tapply(beren3$value[Feeds], beren3$age[Feeds], mean)
avgFeed
head(avgFeed)
tail(avgFeed)
length(avgFeed)
nrow(avgFeed)
ncol(avgFeed)
varFeed<-tapply(beren3$value[Feeds], beren3$age[Feeds], var)
totalFeed<-tapply(beren3$value[Feeds], beren3$age[Feeds], sum)
numFeeds<-tapply(beren3$value[Feeds], beren3$age[Feeds], length)
varFeed
totalFeed
numFeeds
cor(beren3$value[Feeds], beren3$age[Feeds])
cor.test(beren3$value[Feeds], beren3$age[Feeds])
berenCor<-cor.test(beren3$value[Feeds], beren3$age[Feeds])
summary(berenCor)
berenANOVA <-aov(beren3$value[Feeds] ~ beren3$caregiver[Feeds])
boxplot(beren3$value[Feeds] ~ beren3$caregiver[Feeds], xlab="who gave the bottle", ylab= "amount of milk consumed (oz)")
?par
#las is the style of axis labels. so we picked 1 which is always horizontal. 
#mar gives the number of lines of margin to be specified on the four sides of the plot. 
#mgp is the margin line for axis title, labels, and line
#tck is the length of tick marks
par(las=1, mar= c(5,5,1,1), mgp=c(2, 0.5, 0), tck = -0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab= "ounces of milk")
abline(h=mean(totalFeed), lty=2, col='red')
pdf("r02b-totalMilkByDay.pdf", height = 4, width = 4)
par(las=1, mar= c(5,5,1,1), mgp=c(2, 0.5, 0), tck = -0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab= "ounces of milk")
abline(h=mean(totalFeed), lty=2, col='red')
dev.off()
getwd()
##Q2:This graph is impossible to interpret because the amount of milk does not include what is eaten outside of daycare and therefore would not be a good indicator of how that is related to the age which was calculated in this code.It also has a very large x axis and it makes the points hard to understand or compare.
pdf("r02b-CumulativeMilkByTime.pdf",height = 4, width = 4)
source("http://jonsmitchell.com/code/plotFxn02b.R")
#pdf("r02b-CumulativeMilkByTime.pdf",height = 4, width = 4)
dev.off()
?dev.off
write.csv(Data1, 'rawdata.csv', quote=F)
write.csv(Data2, 'rawdata2.csv', quote=F)
Mass<-which(beren3$event=='trait_mass')
avgmassberen<-mean(beren3$value[Mass])
avgmassberen<-tapply(beren3$value[Mass], beren3$age[Mass])
varmassberen<-tapply(beren3$value[Mass], beren3$age[Mass], var)
totalmassberen<-tapply(beren3$value[Mass], beren3$age[Mass], sum)
nummassberen<-tapply(beren3$value[Mass], beren3$age[Mass], length)
avgmassberen
totalmassberen
nummassberen
cor(beren3$value[Mass], beren3$age[Mass])
cor.test(beren3$value[Mass], beren3$age[Mass])
berenCorM<-cor.test(beren3$value[Mass], beren3$age[Mass])
summary(berenCorM)
berenANOVAM<-aov(beren3$value[Mass]~ beren3$age[Mass])
boxplot(beren3$value[Mass] ~beren3$age[Mass], xlab= "Age in Days", ylab = "Mass in kg")
par(las=1, mar= c(5,5,1,1), mgp=c(2, 0.5, 0), tck = -0.01)
plot(as.numeric(names(totalmassberen)), totalmassberen, type = "b", pch=16, xlab="Age in Days", ylab="Mass in kg", col = 'red', main="Age vs Mass")
dev.off()

dayID2<-apply(Data2, 1, function(x) paste(x[1:3], collapse = "-"))
dateID2<-sapply(dayID2, as.Date, format="%Y-%m-%d", origin = "2022-04-12")
Data2$age<-dateID2-dateID2[which(cyrus3$event== 'birth')]

cyrus2<-Data2
cyrus2
cyrus3<-cyrus2
cyrus3<-cyrus3[order(cyrus2$age),]

write.csv(cyrus2, 'cyrus_new.csv', quote=F, row.names=FALSE)
Mass2<-which(cyrus3$event=='trait_mass')
avgmasscyrus<-mean(cyrus3$value[Mass2])
head(cyrus3)
avgmasscyrus<-tapply(cyrus3$value[Mass2], cyrus3$age[Mass2])
varmasscyrus<-tapply(cyrus3$value[Mass2], cyrus3$age[Mass2], var)
totalmasscyrus<-tapply(cyrus3$value[Mass2], cyrus3$age[Mass2], sum)
nummasscyrus<-tapply(cyrus3$value[Mass2], cyrus3$age[Mass2], length)
avgmasscyrus
totalmasscyrus
nummasscyrus
cor(cyrus3$value[Mass2], cyrus3$age[Mass2])
cor.test(cyrus3$value[Mass2], cyrus3$age[Mass2])
cyrusCorM<-cor.test(cyrus3$value[Mass2], cyrus3$age[Mass2])
summary(cyrusCorM)
cyrusANOVAM<-aov(cyrus3$value[Mass2]~ cyrus3$age[Mass2])
boxplot(cyrus3$value[Mass2]/1000 ~cyrus3$age[Mass2], xlab= "Age in Days", ylab = "Mass in kg")
par(las=1, mar= c(5,5,1,1), mgp=c(2, 0.5, 0), tck = -0.01)
pdf("002_massPlot.pdf")
plot(as.numeric(names(totalmassberen)), totalmassberen, type = "b", pch=16, xlab="Age in Days", ylab="Mass in kg", col = 'red', main="Beren and Cyrus Age vs Mass", ylim=c(4,18))
points(cyrus3$age[Mass2], cyrus3$value[Mass2]/1000, type="b",pch=24, col = 'blue', xlab= "Age in Days", ylab="Mass in kg")
legend(1000, 8, c("Beren", "Cyrus"), col = c('red', 'blue'), lty=2:2, cex=0.8, title="Child Name", text.font=4)
dev.off()
##EC
cyrusregression<-lm(cyrus3$value[Mass2]~cyrus3$age[Mass2])
summary(cyrusregression)
cor.test(cyrus3$value[Mass2], cyrus3$age[Mass2])
##I predict that Cyrus will gain between 0.858309 and 0.993807 kg by his next appointment so he will be 11.170 so he will weigh between 12.028309 and 12.163807.
attributes(cyrusregression)
coef(cyrusregression)
confint(cyrusregression)
?confint
?points
pdf("linearregression.pdf")
plot(as.numeric(names(totalmassberen)), totalmassberen, type = "b", pch=16, xlab="Age in Days", ylab="Mass in kg", col = 'red', main="Age vs Mass", ylim=c(4,18))
points(cyrus3$age[Mass2], cyrus3$value[Mass2]/1000, pch=24, col = 'blue', xlab= "Age in Days", ylab="Mass in kg")
legend(1000, 8, c("Beren", "Cyrus"), col = c('red', 'blue'), lty=2:2, cex=0.8, title="Child Name", text.font=4)
cyrusregression<-lm(cyrus3$age[Mass2]~cyrus3$value[Mass2])
confint(cyrusregression)
dev.off()

