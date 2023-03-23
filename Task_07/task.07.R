setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Task_07')
library("ape")
library("phytools")

text.string<-
  "(((((((cow, pig), whale), (bat, (lemur,human))), (robin, iguana)), coelacanth), (gold_fish, trout)), shark);"
vert.tree<-read.tree(text=text.string)
plot(vert.tree, edge.width=2)

nodelabels(frame="circle", bg='white', cex=1)
#would the human be more closely related bc it hits 14 before having to go back to 13 which would have to happen for the shark.

vert.tree
#no branch lengeths

str(vert.tree)

tree<-read.tree(text="(((A, B), (C,D)), E);")
plotTree(tree, offset=1)
tiplabels(frame="circle", bg='lightblue', cex=1)
nodelabels(frame="circle", bg='white', cex=1)

tree$tip.label

tree$edge

AnolisTree<-force.ultrametric(read.tree("https://jonsmitchell.com/data/anolis.tre"))

par(las=1)
hist(AnolisTree$edge.length, col='black', border='white', main="", xlab="edge lengths for the Anolis tree", ylim=c(0,50), xlim=c(0, 6))

tipEdges<-which(AnolisTree$edge[,2]<=Ntip(AnolisTree))
Lengths<-AnolisTree$edge.length
names(Lengths)<-AnolisTree$tip.label
names(Lengths)[which(Lengths==min(Lengths))]

plot(AnolisTree, cex=0.25)
Labs<-sapply(AnolisTree$edge.length, round, digits = 2)
edgelabels(text=Labs, cex=0.25)

?plot.phylo

tipEdges<-which(AnolisTree$edge[,2]<=Ntip(AnolisTree))
tipEdges
eCols<-rep("black", 162)
(eCols[tipEdges]="red")

plot(AnolisTree,show.tip.label=FALSE, type=c("radial"), edge.color=eCols)
#show.tip.label=FALSE = no tips, 
#plotted as a circle radial. 
##
Ntip(AnolisTree)
names(Lengths)[which(Lengths==min(Lengths))]
AnolisTree2<- drop.tip(AnolisTree, tip="Anolis_occultus")
Ntip(AnolisTree2)

ltt(AnolisTree2)
abline(0,1,lwd=2, col='red', lty=2)
#the line has a strong positive slope suggesting that their lineages increase with time

pdf("007_plot01.pdf")
ltt(AnolisTree2)
abline(0,1,lwd=2, col='red', lty=2)
fit.bd(AnolisTree2, rho=0.2)
dev.off()

library("phytools")

#what am i reading into R? where does the phylogeny come in to use the read.tree()?
#name it as somehting else and change "tree" to name of object. 

# idk what to read into the read.tree function here? the last R assignment doesnt use read.tree ?### 
?read.tree

tree<-AnolisTree

plot(tree, type="fan")

data<-read.csv("https://jonsmitchell.com/data/svl.csv", stringsAsFactors=F, row.names=1)
Ntip(tree)
length(svl)
#nrow(data)
#ncol(data)
#has names and one row of data, so it has 2 columns (1 if you look at col, but wouldnt it be name and the value so 2? )and 82 rows. 

svl<-setNames(data$svl, rownames(data))

Ancestors<-fastAnc(tree, svl, vars=TRUE, CI=TRUE)
#head(Ancestors)
#ncol(Ancestors)
#nrow(Ancestors)
#?ace
#??vars
#?CI
#Ancestors$CI95

par(mar=c(0.1, 0.1, 0.1, 0.1))
plot(tree, type="fan", lwd=2, show.tip.label=F)

tiplabels(pch=16, cex=0.25*svl[tree$tip.label])

nodelabels(pch=16, cex=0.25*Ancestors$ace)
dev.off()
obj<-contMap(tree, svl, plot=F)
plot (obj, legend=0.7*max(nodeHeights(tree)), sig=2, fsize=c(0.7, 0.9))

fossilData<-data.frame(svl=log(c(25.4, 23.2, 17.7, 19.7, 24, 31)), tip1=c("Anolis_aliniger", "Anolis_aliniger", "Anolis_occultus", "Anolis_ricordii", "Anolis_cristatellus", "Anolis_occultus"), tip2=c("Anolis_chlorocyanus", "Anolis_coelestinus", "Anolis_hendersoni", "Anolis_cybotes", "Anolis_angusticeps", "Anolis_angusticeps"))

fossilNodes<-c()
nodeN<-c()
  
for(i in 1:nrow(fossilData)){
  Node<-fastMRCA(tree, fossilData[i, "tip1"], fossilData[i,"tip2"])
  fossilNodes[i]<-fossilData[i, "svl"]
  nodeN[i]<-Node
  names(fossilNodes)<-nodeN
}

Ancestors_withFossils<-fastAnc(tree, svl, anc.states=fossilNodes, CI= TRUE, var=TRUE)
Ancestors_withFossils

#