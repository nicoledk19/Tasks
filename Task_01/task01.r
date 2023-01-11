library(swirl)
swirl()
Nicole Kester
1
1
1
5+7
x <- 5 + 7
x
y <- x-3
y
z <- c(1.1, 9, 3.14)
?c
z
c(z, 555, z)
z*2+1000
my_sqrt <- sqrt(z-1)
2
my_sqrt
my_div <- z/my_sqrt
3
my_div
c(1, 2, 3, 4) + c(0, 10)
c(1, 2, 3, 4) + c(0, 10, 100)
my_div
2
2
1
library(swirl)
swirl()
Nicole Kester
1
2
getwd()
ls()
x<-9
ls()
list.files()
?list.files
args()
args(list.files())
args(list.files)
old.dir<-list.files
old.dir<-getwd()
testdir<-dir.create()
dir.create()
dir.create(testdir)
testdir<-dir.create(old.dir)
dir.create("testdir")
setwd("testdir")
file.create("mytest.R")
ls()
list.files()
file.exists("mytest.R")
file.info("mytest.R")
file.rename("mytest2.R")
file.rename("mytest.R, mytest2.R")
file.rename()
file.rename(mytest.R)
file.rename(mytest.R, mytest2.R)
file.rename("mytest.R", "mytest2.R")
file.copy("mytest2.R", "mytest3.R")
file.path("mytest3.R")
file.path("folder1", "folder2")
?dir.create
dir.create(file.path("testdir2", "testdir3"), recursive=TRUE)
setwd(old.dir)
2
1
12
ls()
class(plants)
dim(plants)
nrow(plants)
ncol(plants)
object.size(plants)
names(plants)
head(plants)
head(plants, 10)
tail(plants, 15)
summary(plants)
table(plants$Active_Growth_Period)
str(plants)
2
