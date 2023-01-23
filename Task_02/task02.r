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
##Q1:The first hypothesis is not appropriate because the amount he eats each day has no units specified. So you do not know if it is oz, lbs, etc., so you can't accurately test the hypothesis
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
##Q2:This graph is impossible to interpret because it is looking at the ounces of milk and the age in days and comparing them. The amount of milk does not include what is eaten outside of daycare and therefore would not be a good indicator of how that is related to the age which was calculated in this code.It also has multiple data points per day which makes the data difficult to interpret.  
pdf("r02b-CumulativeMilkByTime.pdf",height = 4, width = 4)
source("http://jonsmitchell.com/code/plotFxn02b.R")
#pdf("r02b-CumulativeMilkByTime.pdf",height = 4, width = 4)
dev.off()
?dev.off
write.csv(Data1, 'rawdata.csv', quote=F)
write.csv(Data2, 'rawdata2.csv', quote=F)
#head(Data2)
#tail(Data2)
#mass<-which(beren3$value == "trait_mass")
#totalWeigh<-tapply(beren3$age[mass], beren3$value[mass], sum)
#totalWeigh
#boxplot(beren3$age[Feeds] ~ beren3$value[mass], xlab= "Age", ylab= "Mass")
#unique(Data1$event)
#pdf("002_massPlot.pdf")
#plot(as.numeric(beren3$age[Feeds]), Feeds, type="b", pch=16, xlab="age in days", ylab= "mass in g")
#abline(h=mean(Feeds), lty=2, col= 'red')
#dev.off()
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
#Cyrus<-Data2
#plot(as.numeric(Cyrus$age[mass]), mass, type="b", pch=16, xlab="age in days", ylab="mass in g")
#?points
#Feedsc<-which(Data2$event =='bottle')
#cyrusMilk<-Data2[Feedsc]
Mass<-which(Data2$event=='trait_mass')
avgmasscyrus<-mean(Data2$value[Mass])
dayID2<-apply(Data2, 1, function(x) paste(x[1:3], collapse = "-"))
dateID2<-sapply(dayID2, as.Date, format="%Y-%m-%d", origin = "2019-04-18")
Data2$age<-dateID2-dateID2[which(Data2$event== 'birth')]
head(Data2)
cyrus2<-Data2
cyrus3<-cyrus2[order(cyrus2$age),]
write.csv(cyrus3, 'cyrus_new.csv', quote=F, row.names=FALSE)
avgmasscyrus<-tapply(cyrus3$value[Mass], cyrus3$age[Mass])
varmasscyrus<-tapply(cyrus3$value[Mass], cyrus3$age[Mass], var)
totalmasscyrus<-tapply(cyrus3$value[Mass], cyrus3$age[Mass], sum)
nummasscyrus<-tapply(cyrus3$value[Mass], cyrus3$age[Mass], length)
avgmasscyrus
totalmasscyrus
nummasscyrus
cor(cyrus3$value[Mass], cyrus3$age[Mass])
cor.test(cyrus3$value[Mass], cyrus3$age[Mass])
cyrusCorM<-cor.test(cyrus3$value[Mass], cyrus3$age[Mass])
summary(cyrusCorM)
cyrusANOVAM<-aov(cyrus3$value[Mass]~ cyrus3$age[Mass])
boxplot(cyrus3$value[Mass]/1000 ~cyrus3$age[Mass], xlab= "Age in Days", ylab = "Mass in kg")
par(las=1, mar= c(5,5,1,1), mgp=c(2, 0.5, 0), tck = -0.01)
pdf("002_massPlot.pdf")
plot(as.numeric(names(totalmassberen)), totalmassberen, type = "b", pch=16, xlab="Age in Days", ylab="Mass in kg", col = 'red', main="Age vs Mass")
#plot(as.numeric(names(beren3$value=='trait_mass'), beren3$value, type="b", pch=16, xlab="Age in Days", ylab="Mass in kg", col = 'red', main = "Age vs Mass")
points(cyrus3$value[Mass]/1000, cyrus3$age[Mass], pch=24, col = 'blue', xlab= "Age in Days", ylab="Mass in kg")
legend(1000, 8, c("Beren", "Cyrus"), col = c('red', 'blue'), lty=2:2, cex=0.8, title="Child Name", text.font=4)
#cyrusregression<-lm(cyrus3$value[Mass]~cyrus3$age[Mass])
#confint(cyrusregression)
#abline(coef(cyrusregression), col='blue', lwd=3)
#?lines
#dayID2<- apply(Data2, 1, function(x)paste(x[1:3], collapse= "-"))
#dateID2<-sapply(dayID2, as.Date, format="%Y-%m-%d", origin = "2019-04-18")
#Data2$age<-dateID2-dateID2[which(Cyrus$event== 'birth')]
#Data2$age
#Data1$age
#cyrus2<-Data2
#cyrus2
#cyrus3<-cyrus2[order(cyrus2$age),]
#massberen<-which(Data1$event=='trait_mass')
#masscyrus<-which(Data2$event=='trait_mass')
#massberen
#masscyrus
#length(cyrus3$age)=length(masscyrus)
#plot(as.numeric(names(totalmassberen)), totalmassberen, type = "b", col = 'red', pch = 16, xlab = "Age in Days", ylab= "Mass in kg", main = "Age vs Mass")
#points(cyrus3$age[totalmasscyrus], totalmasscyrus*1000, type = "b", col = 'blue', pch=24, xlab="Age in Days", ylab= "Mass in g")
#legend(beren3, cyrus3, legend = c(beren3, cyrus3), col = c('red', 'blue'), pch = c(16, 24))
dev.off()
cyrusregression<-lm(cyrus3$value[Mass]~cyrus3$age[Mass])
summary(cyrusregression)
##We are 95% confident that Cyrus will be between 15.62 and 79.85 kg at his next appointment. 
#cor(cyrus3$value[Mass], cyrus3$age[Mass])
attributes(cyrusregression)
coef(cyrusregression)
#abline(cyrusregression, col='blue', lwd=3)
confint(cyrusregression)
?confint
?points
pdf("linearregression.pdf")
#plot(as.numeric(names(totalmassberen)), totalmassberen, type = "b", pch=16, xlab="Age in Days", ylab="Mass in kg", col = 'red', main="Age vs Mass")
#points(cyrus3$value[Mass]/1000, cyrus3$age[Mass], pch=24, col = 'blue', xlab= "Age in Days", ylab="Mass in kg")
#points(confint(cyrusregression), pch=22, col='purple', xlab="Age in Days", ylab="Mass in kg")
#dev.off()
plot(as.numeric(names(totalmassberen)), totalmassberen, type = "b", pch=16, xlab="Age in Days", ylab="Mass in kg", col = 'red', main="Age vs Mass")
#plot(as.numeric(names(beren3$value=='trait_mass'), beren3$value, type="b", pch=16, xlab="Age in Days", ylab="Mass in kg", col = 'red', main = "Age vs Mass")
points(cyrus3$value[Mass]/1000, cyrus3$age[Mass], pch=24, col = 'blue', xlab= "Age in Days", ylab="Mass in kg")
legend(1000, 8, c("Beren", "Cyrus"), col = c('red', 'blue'), lty=2:2, cex=0.8, title="Child Name", text.font=4)
cyrusregression<-lm(cyrus3$value[Mass]~cyrus3$age[Mass])
confint(cyrusregression)
abline(coef(cyrusregression), col='blue', lwd=3)
dev.off()
##We are 95% confident that Cyrus will be between 15.62 and 79.85 kg at his next appointment. 
