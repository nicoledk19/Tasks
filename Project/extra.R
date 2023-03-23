## DELETE ALL THE NONSENSE BELOW THIS
i <- unique(Data1$Species)[2]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaDakotensis.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()

i <- unique(Data1$Species)[3]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaGlacialis.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()

i <- unique(Data1$Species)[4]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaNeoclara.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()

i <- unique(Data1$Species)[5]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaNeorufibarbes.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()

i <- unique(Data1$Species)[6]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaObscuriventris.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()

i <- unique(Data1$Species)[7]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaPodzolica.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()

i <- unique(Data1$Species)[8]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaUlkei.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()

i <- unique(Data1$Species)[9]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaRufaSp1.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()

i <- unique(Data1$Species)[10]

Species <- Data1[which(Data1$Species == i),]

X <- Species$Task
repHC <- which(X == "HC")
repNB <- which(X == "NB")
repPF <- which(X == "PF")
Z <- rep(1, length(X))
Z[repHC] <- rnorm(length(repHC), 2, 0.05)
Z[repNB] <- rnorm(length(repNB), 3, 0.05)
Z[repPF] <- rnorm(length(repPF), 4, 0.05)

pdf("FormicaRufaSp2.pdf")
par(las=1, mar=c(3,4,3,1), mgp=c(1.5, 0.5, 0), tck=-0.01)
plot(Z, Species$Head.Width, xlab="", ylab="head width", xaxt="n")
axis(1, at=c(2,3,4), labels=c("HC", "NB", "PF"))
mtext(i, side=3, line=1.5)
dev.off()