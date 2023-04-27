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

#meme Extra Credit
#install.packages("memery")
#??memery
#library("memery")
install.packages("devtools")
devtools::install_github("sctyner/memer")
library(memer)

jpeg(filename="ForMeme1.jpeg")
meme_list()
memer::meme_get("Y-U-NOguy")%>%
  meme_text_top("Y U No Do A For Loop") %>%
  meme_text_bottom("Bc idk howwww")
dev.off()

#pic<-"https://www.liveabout.com/thmb/Fl0EUNIe7GbyBGivnKj-FDNB06s=/2133x1406/filters:fill(auto,1)/the-15-best-think-memes-4165651-1-5b05bcb5ff1b78003bd125c9.jpg"
txt1<-c("Can you put this in a for loop?", "ummm")
memery::meme("monkey.jpg", txt1, "monkey.jpg")

#jpeg("Monkey.jpg")
#pic<-"https://www.liveabout.com/thmb/Fl0EUNIe7GbyBGivnKj-FDNB06s=/2133x1406/filters:fill(auto,1)/the-15-best-think-memes-4165651-1-5b05bcb5ff1b78003bd125c9.jpg"
#txt<-c("Can you make this a for loop?", "Ummm")
#memery::meme("meme.jpg", txt, "meme.jpg")
#dev.off()

#jpeg("Monkey1.jpeg")
#pics<-system.file("meme.jpeg", package="memery")
#txt<-c("Can you make this a for loop?", "Ummm")
#txt
#memery::meme(pics, txt[1], "monkey.img")
#dev.off()

#Monty Hall Extra Credit
doors<-c("A", "B", "C")
xdata=c()
for(i in 1:10000){
  prize<-sample(doors)[1]
  pick<-sample(doors)[1]
  open<-sample(doors[which(doors!=pick&doors!=prize)])[1]
  switches<-doors[which(doors!=pick&doors!=open)]
  if(pick==prize){xdata=c(xdata, "noswitching")}
  if(switches==prize){xdata=c(xdata, "switching")}
}
y<-length(which(xdata=="switching"))
x<-length(which(xdata=="noswitching"))
y
x
height<-c(y,x)
pdf("plot10_ec01.pdf")
barplot(height, legend.text= c("Switching", "No Switching"), col = c("red", "blue"), names.arg=c("Switching", "No Switching"), main="Chances of Winning Prize", ylab="Chance of Winning Out of 10,000")
dev.off()

