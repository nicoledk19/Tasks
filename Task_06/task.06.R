setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Task_06')
source("http://jonsmitchell.com/code/reformatData07.R")
source("http://jonsmitchell.com/code/simFxn.R")

plot(1, 1, type="n", xlim=c(1998, 2013), ylim=c(0,1))
s<-apply(overallFreq, 2, function(x)lines(overallFreq[,1], x, col=rgb(0,0,0,0.01)))

rescaleFreq<-apply(overallFreq[,3:ncol(overallFreq)], 2, function(x)x-x[1])
nrow(rescaleFreq)
ncol(rescaleFreq)
head(rescaleFreq)
plot(1,1,type="n", xlim=c(1998, 2013), ylim=c(-0.25, 0.25))
s<-apply(rescaleFreq, 2, function(x)lines(overallFreq[,1], x, col=rgb(0,0,0,0.01)))

dYear<-c()
dAlleles<-c()
dYear
dAlleles

for(i in 3:ncol(overallFreq)){
  dYear<-c(dYear, overallFreq[,1])
  Vec<-overallFreq[,i]
  Init<-overallFreq[1,i]
  dAlleles<-c(dAlleles, Vec-Init)
}

smoothScatter(dYear, dAlleles, colramp=Pal, nbin=100)

smoothScatter(dYear, dAlleles, colramp=Pal, nbin=100, xlab="year", ylab="change in allele freq. since 1998")
addFit(nruns=50, n=100, ngens=18, startT=1997, simCol="gray40", rescale=TRUE)
dev.off()

pdf("006_plot_n190h1s0.pdf")
smoothScatter(dYear, dAlleles, colramp=Pal, nbin=100, xlab="year", ylab="change in allele freq. since 1998")
addFit(nruns=100, n=190, ngens=18, startT=1997, simCol="black", rescale=TRUE, s=0, h=1)
#if n is 200 then most of the time the yellow at the beginning is not covered, so decreasing it causes more spikes overall but has more of the yellow covered, dropping to 175 seems to be the best option because most of them stay inside the purple while still spanning the whole possiblity of distributions. if selection is positive it spikes upward quickly and if negative it spikes quickly downward so it fits best at zero, if s is zero then h will always have the same effect so it does not matter what you set h to. this means that this population did not experience a lot of selection and it likley had a population size of around 150-200. selection =0 is better to get line in middle. s=1 it skyrockets. h=about the same when .25 and .75, .5 has some variety. h=0.75, black
dev.off()

plot(alleleFreqs$d_freq, alleleFreqs$d_imm, xlim=c(-0.15, 0.15), xlab ="overall freq. change", ylab="freq. change in subset")
points(alleleFreqs$d_freq, alleleFreqs$d_birth, col='blue')
points(alleleFreqs$d_freq, alleleFreqs$d_surv, col='red')
