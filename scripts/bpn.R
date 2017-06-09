setwd("kdd/scripts/")
data<-read.csv("big_table_weekday.csv")
require(neuralnet) # for neuralnet(), nn model
require(nnet)      # for class.ind()
require(caret)     # for train(), tune parameters
#head(class.ind(test$y))
#test <- cbind(test, class.ind(test$y))
#head(test)
#install.packages('quantmod')
#install.packages('memoise')
library(DMwR)
library(nnet)
library(reshape)
library(devtools)
library(scales)
library(ggplot2)
library(ggplot)
#install.packages('ggplot')

#formula.bpn <- data$y~data$x1+data$x2+data$x3
data2<-data[1:6047,]
smp.size <- floor(0.8*nrow(data2)) 
set.seed(131)
# 從原始資料裡面，抽出train set所需要的資料筆數(data size)
train.ind <- sample(seq_len(nrow(data2)), smp.size)
# 分成train/test
#rm(train)
#rownames(train3) <- 1:7027
train <- rbind(data2[sort(train.ind), ])
testfortest <- data2[-train.ind, ]
# tune parameters
nnetM <- nnet(formula = y~pressure+wind_direction+wind_speed+rel_humidity+precipitation+A_2+A_3+B_1+B_3+C_1, linout = T, size = 2, decay = 0.001, maxit = 1000, trace = T, data = train)
#plot(nnetM, wts.only = F)
#nnetM <- nnet(formula = y~pressure+wind_direction+wind_speed+rel_humidity+precipitation+A_2+A_3+B_1+B_3+C_1, linout = T, size = 2, decay = 0.001, maxit = 1000, trace = T, data = train)
prediction <- predict(nnetM, testfortest)
plot.nnet(nnetM)
#nnetM
cm <-data.frame(x = testfortest$date, y = prediction)
#cm
#write.csv(cm,"rrrrr.csv")
data(iris)