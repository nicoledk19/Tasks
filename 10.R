setwd('C:\\Users\\Nicole\\Desktop\\Evolution\\Tasks\\Task_10')

x<-rnorm(100, mean=0, sd=2)
w<-runif(100, min=0, max=0.1)
y<-(x*5+2+w)

reg<-lm(y~x)
cf<-coef(reg)
cf
#intercept is 2.05, slope is 5.00. 
plot1<-plot(x,y)
abline(reg, col='red')

x<-c()
w<-c()
z<-c()
v<-c()
y<-c()
slope1<-c()

for(i in 1:100){
  x[i]<-rnorm(100, mean=0, sd=2)
  w[i]<-runif(100, min=0, max=0.1)
  z[i]<-rnorm(1)
  v[i]<-x*z
  y[i]<-(v[i]*5+2+w[i])
  reg<-lm(y~x)
  slope<-coef(reg)
  slope1[i]<-slope["x"]
}

pdf("plot10.pdf")
plot(z, slope1)
abline(lm(slope1~z), col='red')
dev.off()
reg1<-lm(slope1~z)
reg1
coef(reg1)
#slope is 0 and intercept is 0. 

install.packages("memery")
??memery
library(memery)

pic<-"https://www.liveabout.com/thmb/Fl0EUNIe7GbyBGivnKj-FDNB06s=/2133x1406/filters:fill(auto,1)/the-15-best-think-memes-4165651-1-5b05bcb5ff1b78003bd125c9.jpg"
txt1<-c("Can you put this in a for loop?", "ummm")
memery::meme("meme.jpg", txt1, "meme.jpg")
