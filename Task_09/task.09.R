setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Task_09')
install.packages("diversitree")
library(diversitree)
transition_0to1<-0.1
transition_1to0<-0.1

speciation_0<-0.2
extinction_0<-0.1

speciation_1<-0.2
extinction_1<-0.1

maxN<-1e3

maxT<-50

Pars<-c(speciation_0, speciation_1, extinction_0, extinction_1, transition_0to1, transition_1to0)

simTree<-tree.bisse(Pars, max.taxa=maxN, max.t=maxT)

str(simTree)

?tree.bisse
#list of phylo trees, contains binary state info for tip.state

stateTable<-table(simTree$tip.state)
stateTable/sum(stateTable)
stateTable

pdf("Table.pdf")
plot(stateTable)
dev.off()

library("ape")
library("phytools")
pdf("Phylogeny.pdf")
plotTree(simTree)
dev.off()

#relativefreq0<-tip.state$0/tip.state

#1
transition_0to1<-0.1
transition_1to0<-0.1

speciation_2<-0.4
extinction_2<-0.2

speciation_3<-0.2
extinction_3<-0.1

maxN<-1e3

maxT<-50

Pars2<-c(speciation_2, speciation_3, extinction_2, extinction_3, transition_0to1, transition_1to0)

simTree2<-tree.bisse(Pars2, max.taxa=maxN, max.t=maxT)

str(simTree2)

stateTable2<-table(simTree2$tip.state)
stateTable2/sum(stateTable2)

pdf("Number1.pdf")
plot(stateTable2)
dev.off()

#No, if the net diversification of state 1 is lower than state 0 then the freq of state 1 will not be higher. ND is speciation-expiration so the higher ND is then the more offsprings that are surviving when comparing to the expiration rate. So the higher ND would mean the higher the freq. 

#2
transition_0to1<-0.2
transition_1to0<-0.1

speciation_4<-0.2
extinction_4<-0.2

speciation_5<-0.2
extinction_5<-0.1

maxN<-1e3

maxT<-50

Pars3<-c(speciation_4, speciation_5, extinction_4, extinction_5, transition_0to1, transition_1to0)

simTree3<-tree.bisse(Pars3, max.taxa=maxN, max.t=maxT)

str(simTree3)

stateTable3<-table(simTree3$tip.state)
stateTable3/sum(stateTable3)

pdf("Number2.pdf")
plot(stateTable3)
dev.off()
#The freq. could not be zero if the transition rate is non-zero for both states bc they would both be transitioning so there would have to be some amount that could transition. 

#3
transition_0to1<-0.1
transition_1to0<-0.1

speciation_6<-0.1
extinction_6<-0.1

speciation_7<-0.1
extinction_7<-0.1

maxN<-1e3

maxT<-50

Pars4<-c(speciation_6, speciation_7, extinction_6, extinction_7, transition_0to1, transition_1to0)

simTree4<-tree.bisse(Pars4, max.taxa=maxN, max.t=maxT)

str(simTree4)

stateTable4<-table(simTree4$tip.state)
stateTable4/sum(stateTable4)

pdf("Number3.pdf")
plot(stateTable4)
dev.off()

var(stateTable4)

#4
#The maxT and maxN also have an effect on the freq of state 1. 
transition_0to1<-0.1
transition_1to0<-0.1

speciation_8<-0.1
extinction_8<-0.2

speciation_9<-0.2
extinction_9<-0.2

maxN<-1e3

maxT<-3

Pars5<-c(speciation_8, speciation_9, extinction_8, extinction_9, transition_0to1, transition_1to0)

simTree5<-tree.bisse(Pars5, max.taxa=maxN, max.t=maxT)

str(simTree5)

stateTable5<-table(simTree5$tip.state)
stateTable5/sum(stateTable5)


pdf("Number4.pdf")
plot(stateTable5)
dev.off()

#09 plot
stateTable2
stateTable2/sum(stateTable2)
rf<-stateTable2[1]/sum(stateTable2)
rf
rf0<-stateTable2[2]/sum(stateTable2)
rf0
##
transition_0to1<-0.1
transition_1to0<-0.1
sp1<-0.2
ex1<-0.5
sp2<-0.2
ex2<-0.5
maxN<-1e3
maxT<-50
nd0.1<-sp1-ex1
nd1.1<-sp2-ex2
Pars6<-c(sp1, sp2, ex1, ex2, transition_0to1, transition_1to0)
simTree6<-tree.bisse(Pars6, max.taxa=maxN, max.t=maxT)
str(simTree6)
stateTable6<-table(simTree6$tip.state)
rf6<-stateTable6/sum(stateTable6)
rf0.1<-stateTable6[1]/sum(stateTable6)
rf1.1<-stateTable6[2]/sum(stateTable6)
#plot(rf0.1, nd0.1,xlab="relative freq of state 0", ylab="net diversification of state 0")

transition_0to1<-0.1
transition_1to0<-0.1
sp3<-0.1
ex3<-0.2
sp4<-0.2
ex4<-0.1
maxN<-1e3
maxT<-50
nd0.2<-sp3-ex3
Pars7<-c(sp3, sp4, ex3, ex4, transition_0to1, transition_1to0)
simTree7<-tree.bisse(Pars7, max.taxa=maxN, max.t=maxT)
str(simTree7)
stateTable7<-table(simTree7$tip.state)
rf7<-stateTable7/sum(stateTable7)
rf0.2<-stateTable7[1]/sum(stateTable7)
rf1.2<-stateTable7[2]/sum(stateTable7)

transition_0to1<-0.1
transition_1to0<-0.1
sp5<-0.1
ex5<-0.1
sp6<-0.2
ex6<-0.1
maxN<-1e3
maxT<-50
nd0.3<-sp5-ex5
Pars8<-c(sp5, sp6, ex5, ex6, transition_0to1, transition_1to0)
simTree8<-tree.bisse(Pars8, max.taxa=maxN, max.t=maxT)
str(simTree8)
stateTable8<-table(simTree8$tip.state)
rf8<-stateTable8/sum(stateTable8)
rf0.3<-stateTable8[1]/sum(stateTable8)
rf1.3<-stateTable8[2]/sum(stateTable8)

transition_0to1<-0.1
transition_1to0<-0.1
sp7<-0.2
ex7<-0.1
sp8<-0.2
ex8<-0.1
maxN<-1e3
maxT<-50
nd0.4<-sp7-ex7
Pars9<-c(sp7, sp8, ex7, ex8, transition_0to1, transition_1to0)
simTree9<-tree.bisse(Pars9, max.taxa=maxN, max.t=maxT)
str(simTree9)
stateTable9<-table(simTree9$tip.state)
rf9<-stateTable9/sum(stateTable9)
rf0.4<-stateTable9[1]/sum(stateTable9)
rf1.4<-stateTable9[2]/sum(stateTable9)

transition_0to1<-0.1
transition_1to0<-0.1
sp9<-0.5
ex9<-0.2
sp10<-0.2
ex10<-0.1
maxN<-1e3
maxT<-50
nd0.5<-sp9-ex9
Pars10<-c(sp9, sp10, ex9, ex10, transition_0to1, transition_1to0)
simTree10<-tree.bisse(Pars10, max.taxa=maxN, max.t=maxT)
str(simTree10)
stateTable10<-table(simTree10$tip.state)
rf10<-stateTable10/sum(stateTable10)
rf0.5<-stateTable10[1]/sum(stateTable10)
rf1.5<-stateTable10[2]/sum(stateTable10)

x0<-c(rf0.1, rf0.2, rf0.3, rf0.4, rf0.5)
y0<-c(nd0.1, nd0.2, nd0.3, nd0.4, nd0.5)
x1<-c(rf1.1, rf1.2, rf1.3, rf1.4, rf1.5)

pdf("09_plot.pdf")
plot(x0, y0, col=1, type = "b", xlab="Relative Frequency", ylab="Net Diversification of State Zero", xlim=c(0.2, 1.1), ylim=c(-0.3, 0.3))
points(x1, y0, col=2, type="b", xlim=1)
legend(x="bottomright", legend=c("State 0", "State 1"), col=c(1, 2), lwd =2)
dev.off()
#This plot shows the relative frequency of both State 0 and State 1 when looking at the net diversification rate of state 0. This graph helps show that the relative frequency must always be equal to 1 so whatever the frequency of State 0 is, State 1 is the difference between that and 1. I tested this graph because I wanted to see how the frequency responded when the extinction rate was higher than the speciation rate. So to do this I ran five different scenarios with varying extinction and speciation rates. I had two that led to net diversification being negative, two positive, and one at zero. As net diversification increases the frequency of that state increases as well. So if the speciation rate of State 0 is higher than the extinction rate then it will be more frequent, thus making State 1 less frequent.This supports that if there is more of you being born than there is dying, then you will occur more frequently than if the reverse were true. 