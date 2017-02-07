x <- read.csv("ppds.csv",header=FALSE)
names(x) <- c("User_Name","ppd")
x
y <- x[order(-x$ppd),]

head(y,100)
