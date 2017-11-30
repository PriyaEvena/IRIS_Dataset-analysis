library("datasets")
d<-iris
attach(iris)
View(d)
summary(d)
str(d)
plot(iris[,2], iris[,1],pch = 19, 
     main = "Iris Data Set",
     xlab = names(iris[,2]),
     ylab = names(iris[,1]),
     cex = 1.1)

Iris.lm1 <- lm(Sepal.Length ~ Sepal.Width)
summaryTable <- data.frame(n = tapply(Sepal.Length, Sepal.Width, length), 
                           mean = tapply(Sepal.Length, Sepal.Width, mean),
                           sd = tapply(Sepal.Length, Sepal.Width, sd))
View(summaryTable)
#write.csv(summaryTable, "SepalLength-SepalWidth.csv")
summary(Iris.lm1)
names(iris[2])

abline(Iris.lm1, col = 9, lwd = 4)

par(mfrow=c(2,2))
plot(Iris.lm1)
