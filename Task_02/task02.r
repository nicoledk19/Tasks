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
dateID<-sapply(dayID, as.Date, format= "%Y-%n-$d", origin = "2019-04-18")
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
#head(beren3)
