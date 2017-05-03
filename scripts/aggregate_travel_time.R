#remove outlier from original dataset
rm(list = ls())
require(stringr)
require(dplyr)
require(tidyr)

setwd("/home/sean/R/kdd/dataSets/training/")
trajectories <- read.csv("trajectories(table 5)_training.csv")

chartB1 <- matrix(NA, ncol = 72, nrow = 91)
chartB1 <- data.frame(chartB1)
chartB3 <- matrix(NA, ncol = 72, nrow = 91)
chartB3 <- data.frame(chartB3)
chartC1 <- matrix(NA, ncol = 72, nrow = 91)
chartC1 <- data.frame(chartC1)
chartC3 <- matrix(NA, ncol = 72, nrow = 91)
chartC3 <- data.frame(chartC3)
chartA2 <- matrix(NA, ncol = 72, nrow = 91)
chartA2 <- data.frame(chartA2)
chartA3 <- matrix(NA, ncol = 72, nrow = 91)
chartA3 <- data.frame(chartA3)

colnames(chartB1) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(chartB3) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(chartC1) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(chartC3) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(chartA2) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(chartA3) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")

setwd("/home/sean/R/kdd/scripts/")
data1 <- read.csv("training_20min_avg_travel_time.csv")
data1c <- data1[21855:25144,]
grabstr<- (substr(data1c$time_window, 2, 11))
rownames(chartB1) <- c(unique(grabstr))
rownames(chartB3) <- c(unique(grabstr))
rownames(chartC1) <- c(unique(grabstr))
rownames(chartC3) <- c(unique(grabstr))
rownames(chartA2) <- c(unique(grabstr))
rownames(chartA3) <- c(unique(grabstr))

sep_date <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==1,]$starting_time," "),'[',1),pattern="-")
sep_date <- data.frame(Reduce(rbind, sep_date))
sep_min <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==1,]$starting_time," "),'[',2),pattern=":")
sep_min <- data.frame(Reduce(rbind, sep_min))
sep_col <- lapply(str_split(trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==1,]$starting_time," "),'[',2)
sep_col <- data.frame(Reduce(rbind, sep_col))
sep_time <- bind_cols(sep_date,sep_min)
sep_time <- bind_cols(sep_time,sep_col)

colnames(sep_time) <- c("y","m","d","X1","X2", "X3","X4")
sep_time$m = as.numeric(sep_time$m)+6
sep_time$d = as.numeric(sep_time$d)
sep_time$y <- lapply(str_split(trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==1,]$starting_time," "),'[',1)
sep_time$X1 = as.numeric(sep_time$X1)-1
sep_time$X2 = as.numeric(sep_time$X2)-1
sep_time$X3 = trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==1,]$travel_time
sep_time <- data.frame(sep_time, stringsAsFactors = FALSE)
hour=0
min=0
day=19
month=7
i=1
sep_time$X4 <- as.character(sep_time$X4)
sep_time$y <- as.character(sep_time$y)
time <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
date <- unique(grabstr)

while(hour<24){
  out_time <- which(sep_time$X3 %in% boxplot(plot = FALSE,sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)$out)
  temp <- data.frame(rep(time[1],(length(sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)-length(out_time))))
  index_time <- which(sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20))
  for(j in index_time ){
    sep_time[j, 7] <- time[i]
  }
  
  i = i + 1
  if(length(out_time)!=0){
    sep_time <- sep_time[-c(out_time),]
    sep_date <- sep_date[-c(out_time),]
  }
  min = min+20
  if(min==60){
    hour=hour+1
    min=0
  }
}

mat_mean <- matrix(0, ncol = 72, nrow = 91)
mat_mean <- data.frame(mat_mean)
mat_count <- matrix(0, ncol = 72, nrow = 91)
mat_count <- data.frame(mat_count)
rownames(mat_mean) <- c(unique(grabstr))
rownames(mat_count) <- c(unique(grabstr))
colnames(mat_mean) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(mat_count) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")

for(i in 1:nrow(sep_time)){
  mat_mean[sep_time[i,1],sep_time[i,7]]=mat_mean[sep_time[i,1],sep_time[i,7]]+sep_time[i,"X3"]
  mat_count[sep_time[i,1],sep_time[i,7]] = mat_count[sep_time[i,1],sep_time[i,7]]+1
}

for(i in 1:91){
  for(j in 1:72){
    if(mat_count[i,j]!=0)mat_mean[i,j]=mat_mean[i,j]/mat_count[i,j]
    mat_mean[i,j]=as.numeric(format(round(mat_mean[i,j], 2), nsmall = 2))
  }
}

write.csv(mat_mean,"20min_avg_time_B1.csv")

sep_date <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==3,]$starting_time," "),'[',1),pattern="-")
sep_date <- data.frame(Reduce(rbind, sep_date))
sep_min <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==3,]$starting_time," "),'[',2),pattern=":")
sep_min <- data.frame(Reduce(rbind, sep_min))
sep_col <- lapply(str_split(trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==3,]$starting_time," "),'[',2)
sep_col <- data.frame(Reduce(rbind, sep_col))
sep_time <- bind_cols(sep_date,sep_min)
sep_time <- bind_cols(sep_time,sep_col)

colnames(sep_time) <- c("y","m","d","X1","X2", "X3","X4")
sep_time$m = as.numeric(sep_time$m)+6
sep_time$d = as.numeric(sep_time$d)
sep_time$y <- lapply(str_split(trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==3,]$starting_time," "),'[',1)
sep_time$X1 = as.numeric(sep_time$X1)-1
sep_time$X2 = as.numeric(sep_time$X2)-1
sep_time$X3 = trajectories[trajectories$intersection_id=="B"&trajectories$tollgate_id==3,]$travel_time
sep_time <- data.frame(sep_time, stringsAsFactors = FALSE)
hour=0
min=0
day=19
month=7
i=1
sep_time$X4 <- as.character(sep_time$X4)
sep_time$y <- as.character(sep_time$y)
time <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
date <- unique(grabstr)

while(hour<24){
  out_time <- which(sep_time$X3 %in% boxplot(plot = FALSE,sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)$out)
  temp <- data.frame(rep(time[1],(length(sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)-length(out_time))))
  index_time <- which(sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20))
  for(j in index_time ){
    sep_time[j, 7] <- time[i]
  }
  
  i = i + 1
  if(length(out_time)!=0){
    sep_time <- sep_time[-c(out_time),]
    sep_date <- sep_date[-c(out_time),]
  }
  min = min+20
  if(min==60){
    hour=hour+1
    min=0
  }
}

mat_mean <- matrix(0, ncol = 72, nrow = 91)
mat_mean <- data.frame(mat_mean)
mat_count <- matrix(0, ncol = 72, nrow = 91)
mat_count <- data.frame(mat_count)
rownames(mat_mean) <- c(unique(grabstr))
rownames(mat_count) <- c(unique(grabstr))
colnames(mat_mean) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(mat_count) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")

for(i in 1:nrow(sep_time)){
  mat_mean[sep_time[i,1],sep_time[i,7]]=mat_mean[sep_time[i,1],sep_time[i,7]]+sep_time[i,"X3"]
  mat_count[sep_time[i,1],sep_time[i,7]] = mat_count[sep_time[i,1],sep_time[i,7]]+1
}

for(i in 1:91){
  for(j in 1:72){
    if(mat_count[i,j]!=0)mat_mean[i,j]=mat_mean[i,j]/mat_count[i,j]
    mat_mean[i,j]=as.numeric(format(round(mat_mean[i,j], 2), nsmall = 2))
  }
}

write.csv(mat_mean,"20min_avg_time_B3.csv")

sep_date <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==2,]$starting_time," "),'[',1),pattern="-")
sep_date <- data.frame(Reduce(rbind, sep_date))
sep_min <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==2,]$starting_time," "),'[',2),pattern=":")
sep_min <- data.frame(Reduce(rbind, sep_min))
sep_col <- lapply(str_split(trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==2,]$starting_time," "),'[',2)
sep_col <- data.frame(Reduce(rbind, sep_col))
sep_time <- bind_cols(sep_date,sep_min)
sep_time <- bind_cols(sep_time,sep_col)

colnames(sep_time) <- c("y","m","d","X1","X2", "X3","X4")
sep_time$m = as.numeric(sep_time$m)+6
sep_time$d = as.numeric(sep_time$d)
sep_time$y <- lapply(str_split(trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==2,]$starting_time," "),'[',1)
sep_time$X1 = as.numeric(sep_time$X1)-1
sep_time$X2 = as.numeric(sep_time$X2)-1
sep_time$X3 = trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==2,]$travel_time
sep_time <- data.frame(sep_time, stringsAsFactors = FALSE)
hour=0
min=0
day=19
month=7
i=1
sep_time$X4 <- as.character(sep_time$X4)
sep_time$y <- as.character(sep_time$y)
time <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
date <- unique(grabstr)

while(hour<24){
  out_time <- which(sep_time$X3 %in% boxplot(plot = FALSE,sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)$out)
  temp <- data.frame(rep(time[1],(length(sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)-length(out_time))))
  index_time <- which(sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20))
  for(j in index_time ){
    sep_time[j, 7] <- time[i]
  }
  
  i = i + 1
  if(length(out_time)!=0){
    sep_time <- sep_time[-c(out_time),]
    sep_date <- sep_date[-c(out_time),]
  }
  min = min+20
  if(min==60){
    hour=hour+1
    min=0
  }
}

mat_mean <- matrix(0, ncol = 72, nrow = 91)
mat_mean <- data.frame(mat_mean)
mat_count <- matrix(0, ncol = 72, nrow = 91)
mat_count <- data.frame(mat_count)
rownames(mat_mean) <- c(unique(grabstr))
rownames(mat_count) <- c(unique(grabstr))
colnames(mat_mean) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(mat_count) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")

for(i in 1:nrow(sep_time)){
  mat_mean[sep_time[i,1],sep_time[i,7]]=mat_mean[sep_time[i,1],sep_time[i,7]]+sep_time[i,"X3"]
  mat_count[sep_time[i,1],sep_time[i,7]] = mat_count[sep_time[i,1],sep_time[i,7]]+1
}

for(i in 1:91){
  for(j in 1:72){
    if(mat_count[i,j]!=0)mat_mean[i,j]=mat_mean[i,j]/mat_count[i,j]
    mat_mean[i,j]=as.numeric(format(round(mat_mean[i,j], 2), nsmall = 2))
  }
}

write.csv(mat_mean,"20min_avg_time_A2.csv")

sep_date <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==3,]$starting_time," "),'[',1),pattern="-")
sep_date <- data.frame(Reduce(rbind, sep_date))
sep_min <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==3,]$starting_time," "),'[',2),pattern=":")
sep_min <- data.frame(Reduce(rbind, sep_min))
sep_col <- lapply(str_split(trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==3,]$starting_time," "),'[',2)
sep_col <- data.frame(Reduce(rbind, sep_col))
sep_time <- bind_cols(sep_date,sep_min)
sep_time <- bind_cols(sep_time,sep_col)

colnames(sep_time) <- c("y","m","d","X1","X2", "X3","X4")
sep_time$m = as.numeric(sep_time$m)+6
sep_time$d = as.numeric(sep_time$d)
sep_time$y <- lapply(str_split(trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==3,]$starting_time," "),'[',1)
sep_time$X1 = as.numeric(sep_time$X1)-1
sep_time$X2 = as.numeric(sep_time$X2)-1
sep_time$X3 = trajectories[trajectories$intersection_id=="A"&trajectories$tollgate_id==3,]$travel_time
sep_time <- data.frame(sep_time, stringsAsFactors = FALSE)
hour=0
min=0
day=19
month=7
i=1
sep_time$X4 <- as.character(sep_time$X4)
sep_time$y <- as.character(sep_time$y)
time <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
date <- unique(grabstr)

while(hour<24){
  out_time <- which(sep_time$X3 %in% boxplot(plot = FALSE,sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)$out)
  temp <- data.frame(rep(time[1],(length(sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)-length(out_time))))
  index_time <- which(sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20))
  for(j in index_time ){
    sep_time[j, 7] <- time[i]
  }
  
  i = i + 1
  if(length(out_time)!=0){
    sep_time <- sep_time[-c(out_time),]
    sep_date <- sep_date[-c(out_time),]
  }
  min = min+20
  if(min==60){
    hour=hour+1
    min=0
  }
}

mat_mean <- matrix(0, ncol = 72, nrow = 91)
mat_mean <- data.frame(mat_mean)
mat_count <- matrix(0, ncol = 72, nrow = 91)
mat_count <- data.frame(mat_count)
rownames(mat_mean) <- c(unique(grabstr))
rownames(mat_count) <- c(unique(grabstr))
colnames(mat_mean) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(mat_count) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")

for(i in 1:nrow(sep_time)){
  mat_mean[sep_time[i,1],sep_time[i,7]]=mat_mean[sep_time[i,1],sep_time[i,7]]+sep_time[i,"X3"]
  mat_count[sep_time[i,1],sep_time[i,7]] = mat_count[sep_time[i,1],sep_time[i,7]]+1
}

for(i in 1:91){
  for(j in 1:72){
    if(mat_count[i,j]!=0)mat_mean[i,j]=mat_mean[i,j]/mat_count[i,j]
    mat_mean[i,j]=as.numeric(format(round(mat_mean[i,j], 2), nsmall = 2))
  }
}

write.csv(mat_mean,"20min_avg_time_A3.csv")

sep_date <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==1,]$starting_time," "),'[',1),pattern="-")
sep_date <- data.frame(Reduce(rbind, sep_date))
sep_min <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==1,]$starting_time," "),'[',2),pattern=":")
sep_min <- data.frame(Reduce(rbind, sep_min))
sep_col <- lapply(str_split(trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==1,]$starting_time," "),'[',2)
sep_col <- data.frame(Reduce(rbind, sep_col))
sep_time <- bind_cols(sep_date,sep_min)
sep_time <- bind_cols(sep_time,sep_col)

colnames(sep_time) <- c("y","m","d","X1","X2", "X3","X4")
sep_time$m = as.numeric(sep_time$m)+6
sep_time$d = as.numeric(sep_time$d)
sep_time$y <- lapply(str_split(trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==1,]$starting_time," "),'[',1)
sep_time$X1 = as.numeric(sep_time$X1)-1
sep_time$X2 = as.numeric(sep_time$X2)-1
sep_time$X3 = trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==1,]$travel_time
sep_time <- data.frame(sep_time, stringsAsFactors = FALSE)
hour=0
min=0
day=19
month=7
i=1
sep_time$X4 <- as.character(sep_time$X4)
sep_time$y <- as.character(sep_time$y)
time <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
date <- unique(grabstr)

while(hour<24){
  out_time <- which(sep_time$X3 %in% boxplot(plot = FALSE,sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)$out)
  temp <- data.frame(rep(time[1],(length(sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)-length(out_time))))
  index_time <- which(sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20))
  for(j in index_time ){
    sep_time[j, 7] <- time[i]
  }
  
  i = i + 1
  if(length(out_time)!=0){
    sep_time <- sep_time[-c(out_time),]
    sep_date <- sep_date[-c(out_time),]
  }
  min = min+20
  if(min==60){
    hour=hour+1
    min=0
  }
}

mat_mean <- matrix(0, ncol = 72, nrow = 91)
mat_mean <- data.frame(mat_mean)
mat_count <- matrix(0, ncol = 72, nrow = 91)
mat_count <- data.frame(mat_count)
rownames(mat_mean) <- c(unique(grabstr))
rownames(mat_count) <- c(unique(grabstr))
colnames(mat_mean) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(mat_count) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")

for(i in 1:nrow(sep_time)){
  mat_mean[sep_time[i,1],sep_time[i,7]]=mat_mean[sep_time[i,1],sep_time[i,7]]+sep_time[i,"X3"]
  mat_count[sep_time[i,1],sep_time[i,7]] = mat_count[sep_time[i,1],sep_time[i,7]]+1
}

for(i in 1:91){
  for(j in 1:72){
    if(mat_count[i,j]!=0)mat_mean[i,j]=mat_mean[i,j]/mat_count[i,j]
    mat_mean[i,j]=as.numeric(format(round(mat_mean[i,j], 2), nsmall = 2))
  }
}

write.csv(mat_mean,"20min_avg_time_C1.csv")

sep_date <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==3,]$starting_time," "),'[',1),pattern="-")
sep_date <- data.frame(Reduce(rbind, sep_date))
sep_min <- str_split(string=lapply(str_split(trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==3,]$starting_time," "),'[',2),pattern=":")
sep_min <- data.frame(Reduce(rbind, sep_min))
sep_col <- lapply(str_split(trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==3,]$starting_time," "),'[',2)
sep_col <- data.frame(Reduce(rbind, sep_col))
sep_time <- bind_cols(sep_date,sep_min)
sep_time <- bind_cols(sep_time,sep_col)

colnames(sep_time) <- c("y","m","d","X1","X2", "X3","X4")
sep_time$m = as.numeric(sep_time$m)+6
sep_time$d = as.numeric(sep_time$d)
sep_time$y <- lapply(str_split(trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==3,]$starting_time," "),'[',1)
sep_time$X1 = as.numeric(sep_time$X1)-1
sep_time$X2 = as.numeric(sep_time$X2)-1
sep_time$X3 = trajectories[trajectories$intersection_id=="C"&trajectories$tollgate_id==3,]$travel_time
sep_time <- data.frame(sep_time, stringsAsFactors = FALSE)
hour=0
min=0
day=19
month=7
i=1
sep_time$X4 <- as.character(sep_time$X4)
sep_time$y <- as.character(sep_time$y)
time <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
date <- unique(grabstr)

while(hour<24){
  out_time <- which(sep_time$X3 %in% boxplot(plot = FALSE,sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)$out)
  temp <- data.frame(rep(time[1],(length(sep_time[sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20),]$X3)-length(out_time))))
  index_time <- which(sep_time$X1==hour&sep_time$X2>=min & sep_time$X2<(min+20))
  for(j in index_time ){
    sep_time[j, 7] <- time[i]
  }
  
  i = i + 1
  if(length(out_time)!=0){
    sep_time <- sep_time[-c(out_time),]
    sep_date <- sep_date[-c(out_time),]
  }
  min = min+20
  if(min==60){
    hour=hour+1
    min=0
  }
}

mat_mean <- matrix(0, ncol = 72, nrow = 91)
mat_mean <- data.frame(mat_mean)
mat_count <- matrix(0, ncol = 72, nrow = 91)
mat_count <- data.frame(mat_count)
rownames(mat_mean) <- c(unique(grabstr))
rownames(mat_count) <- c(unique(grabstr))
colnames(mat_mean) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")
colnames(mat_count) <- c("00:00","00:20", "00:40", "01:00","01:20", "01:40", "02:00","02:20", "02:40", "03:00","03:20", "03:40", "04:00","04:20", "04:40", "05:00","05:20", "05:40", "06:00","06:20", "06:40", "07:00","07:20", "07:40", "08:00","08:20", "08:40", "09:00","09:20", "09:40", "10:00","10:20", "10:40", "11:00","11:20", "11:40", "12:00","12:20", "12:40", "13:00","13:20", "13:40", "14:00","14:20", "14:40", "15:00","15:20", "15:40", "16:00","16:20", "16:40", "17:00","17:20", "17:40", "18:00","18:20", "18:40", "19:00","19:20", "19:40", "20:00","20:20", "20:40", "21:00","21:20", "21:40", "22:00","22:20", "22:40", "23:00","23:20", "23:40")

for(i in 1:nrow(sep_time)){
  mat_mean[sep_time[i,1],sep_time[i,7]]=mat_mean[sep_time[i,1],sep_time[i,7]]+sep_time[i,"X3"]
  mat_count[sep_time[i,1],sep_time[i,7]] = mat_count[sep_time[i,1],sep_time[i,7]]+1
}

for(i in 1:91){
  for(j in 1:72){
    if(mat_count[i,j]!=0)mat_mean[i,j]=mat_mean[i,j]/mat_count[i,j]
    mat_mean[i,j]=as.numeric(format(round(mat_mean[i,j], 2), nsmall = 2))
  }
}

write.csv(mat_mean,"20min_avg_time_C3.csv")

