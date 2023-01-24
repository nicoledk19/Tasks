setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Task_03')
5
A<-5
A * 2
B<-c(A,5,5)
B
B*2
'B'*2
B<-c(A, 5, 5)
B*2
C<-c(B, 6, 10)
C*6
D<-c(1,5,10,15,20)
sum(D)
mean(D)
min(D)
E<-c(6,7,8,9,10)
which(E==8)
which(E>8)
E[which(E>8)]
trueMean1<-5
trueSD1<-5
population1<-rnorm(1e6, trueMean1, trueSD1)
trueMean2<-4
trueSD2<-5
population2<-rnorm(1e6, trueMean2, trueSD2)
Size<-50
Sample1<-sample(population1, Size)
Sample2<-sample(population2, Size)
Sample1
Sample2
boxplot(Sample1, Sample2)
individual1<-c("B", "A")
individual2<-c("A", "A")
Gam1<-sample(individual1, 1)
Gam2<-sample(individual2, 1)
newBaby<-c(Gam1, Gam2)
newBaby
#baby was homozygous
isHet<-c()
for (i in 1:100) {
  Gam1<-sample(individual1, 1)
  Gam2<-sample(individual2,1)
  newBaby<-c(Gam1, Gam2)
  isHet[i]<-Gam1 == Gam2
}
sum(isHet)/length(isHet)
source("http://jonsmitchell.com/code/simFxn04.R")
MatGrandma<-makeFounder("grandma_mom")
MatGrandpa<-makeFounder("grandpa_mom")
PatGrandma<-makeFounder("grandma_da")
PatGrandpa<-makeFounder("grandpa_da")
head(MatGrandma)
nrow(MatGrandma)
head(MatGrandpa)
nrow(MatGrandpa)
head(PatGrandma)
nrow(PatGrandma)
head(PatGrandpa)
nrow(PatGrandpa)
Alan<-makeBaby(PatGrandma, PatGrandpa)
head(Alan)
nrow(Alan)
Brenda<-makeBaby(MatGrandma, MatGrandpa)
head(Brenda)
nrow(Brenda)
Focus<-makeBaby(Brenda, Alan)
head(Focus)
nrow(Focus)
ToMom<-length(grep("mom", Focus))/length(Focus)
#should be half so 5000/10000 = 0.5
ToMom
ToMomMom<-length(grep("grandma_mom", Focus))/length(Focus)
ToMomDad<-length(grep("grandpa_mom", Focus))/length(Focus)
#should be half of moms, so 1/4 for each
ToMomMom
ToMomDad
Sibling_01<-makeBaby(Brenda, Alan)
ToSib<-length(intersect(Focus, Sibling_01))/length(Focus)
#can be anywhere from 0.0-1.0 because there is variation in which loci they get from their parents so the amount shared can be random
ToSib
ManySiblings<-replicate(1e3, length(intersect(Focus, makeBaby(Brenda, Alan)))/length(Focus))
ManySiblings
#would still vary depending on which genes they got from the parents 
quantile(ManySiblings)
mean(ManySiblings)
Range<-max(ManySiblings, na.rm=TRUE)-min(ManySiblings,na.rm=TRUE)
Range
pdf("003_relatePlot.pdf")
hist(ManySiblings, col='black', border="white", ylim=c(0,200))
dev.off()
#Whenever we made the MatGrandma, etc. we set it to make 10000 which is what len is set to use in the makeFounder function, if you change the set of loci then the range will change. 