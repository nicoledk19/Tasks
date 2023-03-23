Dprob <- 0.5 
Ekid <- 2
Pop <- c(rep(1,10),rep(2,10))
N <- c()
Na <- c()
Nb <- c()

ngen <- 50
for (i in 1:ngen)	{
  N[i] <- length(which(Pop == 1))
  Na[i] <- length(G1)
  G1 <- rep(1, N[i])
  PDeath <- runif(length(which(Pop == 2)))
  G2 <- rep(2, Ekid * (length(which(PDeath > Dprob))))
  Nb[i] <- length(G2)
  Pop <- c(G1, G2)
  cat(length(Pop), "\n")
}

par(mar=c(4,5,1,1), las=1, mgp=c(2.5, 0.75, 0), tck=-0.01)
plot(1:ngen, Nb, type="l", ylim=c(0, max(Nb)), xlab="generation", ylab="num. individuals")
lines(1:ngen, Na, type="l", lty=2, col='red')
### Make GIF

library(animation)

setwd("C:\\Users\\jsm0036\\Dropbox\\Professional\\Courses\\c_Evolution\\c_Lectures\\2021")
saveGIF({
  Dprob <- 0.5
  Ekid <- 2
  Pop <- c(rep(1,10),rep(2,10))
  N <- c()
  Na <- c()
  Nb <- c()
  
  ngen <- 50
  for (i in 1:ngen)	{
    N[i] <- length(which(Pop == 1))
    Na[i] <- length(G1)
    G1 <- rep(1, N[i])
    PDeath <- runif(length(which(Pop == 2)))
    G2 <- rep(2, Ekid * (length(which(PDeath > Dprob))))
    Nb[i] <- length(G2)
    Pop <- c(G1, G2)
    par(mar=c(4,5,1,1), las=1, mgp=c(2.5, 0.75, 0), tck=-0.01)
    plot(1:i, Nb, type="l", ylim=c(0, max(Nb)), xlab="generation", ylab="num. individuals", xlim=c(0, 50))
    lines(1:i, Na, type="l", lty=2, col='red')
  }
  
}, movie.name = "geomEx_02.gif", interval = 0.01, ani.width = 720, ani.height = 480)
