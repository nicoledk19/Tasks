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
library(swirl)
swirl()
Nicole Kester
1
1
5+7
x<-5+7
x
y<-x-3
y
z<-c(1.1,9,3.14)
?c
z
c(z,555,z)
z*2+1000
my_sqrt<-sqrt(z-1)
3
my_sqrt
my_div<-z/my_sqrt
1
my_div
c(1,2,3,4) + c(0, 10)
c(1,2,3,4) + c(0, 10, 100)
my_div
2
0
library(swirl)
swirl()
Nicole Kester
1
2
getwd()
ls()
library(swirl)
swirl()
Nicole Kester
1
x<-9
ls()
list.files()
?list.files
args(list.files)
old.dir<-getwd()
dir.create(testdir)
dir.create("testdir")
setwd("testdir")
file.create("mytest.R")
ls()
list.files()
file.exists()
file.exists("mytest.R")
file.info("mytest.R")
file.rename("mytest.R", "mytest2.R")
file.copy("mytest2.R", "mytest3.R")
file.path("mytest3.R")
file.path("folder1", "folder2")
?dir.create
dir.create(file.path("testdir2", "testdir3"), recursive=TRUE)
setwd(old.dir)
1
1
3
1:20
pi:10
15:1
?`:`
seq(1,20)
seq(0, 10, by=0.5)
my_seq<-seq(5, 10, length=30)
length(my_seq)
1:length(my_seq)
seq(along.with = my_seq)
seq_along(my_seq)
rep(0, times=40)
rep(c(0,1,2), times=10)
rep(c(0,1,2), each=10)
1
1
4
num_vect<-c(0.5, 55, -10, 6)
tf<-num_vect<1
1
2
1
tf
num_vect >=6
my_char<-c("My","name", "is")
my_char
paste(my_char, collapse =" ")
my_name<-c(my_char, "Nicole")
my_name
paste(my_name, collapse = " ")
paste("Hello", "world!", sep=" ")
paste(1:3, c("X", "Y", "Z"), sep="")
paste(LETTERS, 1:4, sep = "-")
2
1
5
x<-c(44, NA, 5, NA)
x*3
y<-rnorm(1000)
z<-rep(NA, 1000)
my_data <-sample(c(y,z), 100)
my_na<-is.na(my_data)
my_na
my_data==NA
sum(my_na)
my_data
0/0
Inf-Inf
2
1
6
x
x[1:10]
2
3
x[is.na(x)]
y<-x[!is.na(x)]
y
2
1
y[y>0]
x[x>0]
x[!is.na(x) & x>0]
x[c(3,5,7)]
x[0]
x[3000]
x[c(-2, -10)]
x[-c(2,10)]
vect<-c(foo=11, bar=2, norf=NA)
vect
names(vect)
vect2<-c(11, 2, NA)
names(vect2)<-c("foo", "bar", "norf")
identical(vect, vect2)
3
vect[2]
vect["bar"]
vect[c("foo", "bar")]
1
library(swirl)
swirl()
Nicole Kester
1
7
my_vector<-c(1:20)
my_vector<-1:20
my_vector
dim(my_vector)
length(my_vector)
dim(my_vector)<-c(4,5)
dim(my_vector)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix<-my_vector
?matrix
my_matrix2<-matrix(1:20, 4, 5)
identical(my_matrix, my_matrix2)
patients<-c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)
my_data<-data.frame(patients, my_matrix)
my_data
class(my_data)
cnames<-c("patient", "age", "weight", "bp", "rating", "test")
colnames(cnames)
colnames(my_data)<-cnames
my_data
2
0
swirl()
Nicole Kester
1
8
TRUE==TRUE
(FALSE == TRUE) == FALSE
6==7
6<7
10<=10
3
2
TRUE != FALSE
5!=7
5!=7
5!==7
!5==7
3
1
FALSE&FALSE
TRUE &c(TRUE, FALSE, FALSE)
TRUE && c(TRUE, FALSE, FALSE)
TRUE | c(TRUE, FALSE, FALSE)
TRUE || c(TRUE, FALSE, FALSE)
5>8 || 6 != 8 && 4>3.9
2
1
isTRUE(6>4)
4
identical('twins', 'twins')
2
xor(5==6, !FALSE)
3
1
ints<-sample(10)
ints
ints>5
which(ints>7)
1
any(ints)
any(ints<0)
all(ints>0)
2
2
1
9
Sys.Date()
mean(c(2, 4, 5))
library(swirl)
swirl()
Nicole Kester
2
1
9
Sys.Date()
mean(c(2, 4, 5))
library(swirl)
swirl()
Nicole Kester
1
9
Sys.Date()
mean(c(2, 4, 5))
swirl()
Nicole Kester
1
15
data(cars)
?cars
head(cars)
plot(cars)
?plot
plot(x=cars$speed, y = cars$dist)
plot(x=cars$dist, y = cars$speed)
plot(x=cars$speed, y = cars$dist, xlab= "Speed")
plot(x=cars$speed, y = cars$dist, ylab= "Stopping Distance")
plot(x=cars$speed, y = cars$dist, xlab= "Speed", ylab= "Stopping Distance")
plot(x=cars$speed, y = cars$dist, xlab= "Speed", ylab= "Stopping Distance", main= "My Plot")
plot(cars, main = "My Plot")
??subtitle
plot(cars, sub = "My Plot Subtitle")
plot(cars, col = 2)
plot(cars, xlim= c(10,15))
plot(cars, pch= 2)
data.frame(mtcars)
data(mtcars)
?boxplot
boxplot(mpg~cyl, data= mtcars)
hist(mtcars$mpg)
2
0
