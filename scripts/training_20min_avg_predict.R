rm(list = ls())

#change working directory
setwd("/home/sean/R/kdd/scripts")

#read input file
train_avg_time = read.csv("time_old.csv")
train_avg_volumn = read.csv("volumn_old.csv")

#create chart
gate_id = c("A_2","A_3","B_1","B_3","C_1","C_3")
time_label = c("00:00","00:20", "00:40", "01:00","01:20", "01:40",
             "02:00","02:20", "02:40", "03:00","03:20", "03:40",
             "04:00","04:20", "04:40", "05:00","05:20", "05:40",
             "06:00","06:20", "06:40", "07:00","07:20", "07:40",
             "08:00","08:20", "08:40", "09:00","09:20", "09:40",
             "10:00","10:20", "10:40", "11:00","11:20", "11:40",
             "12:00","12:20", "12:40", "13:00","13:20", "13:40",
             "14:00","14:20", "14:40", "15:00","15:20", "15:40",
             "16:00","16:20", "16:40", "17:00","17:20", "17:40",
             "18:00","18:20", "18:40", "19:00","19:20", "19:40",
             "20:00","20:20", "20:40", "21:00","21:20", "21:40",
             "22:00","22:20", "22:40", "23:00","23:20", "23:40")
date_label = c(unique(substr(train_avg_time$time_window, 2, 11)))
time_chart = array(NA,c(91,72,6),list(date_label,time_label,gate_id))

#insert data
for (i in 1:length(train_avg_time[,1])) {
  date = substr(train_avg_time$time_window[i],2,11)
  time = substr(train_avg_time$time_window[i],13,17)
  gate = paste(train_avg_time$intersection_id[i],train_avg_time$tollgate_id[i],sep = "_")
  time_chart[date,time,gate] = train_avg_time$avg_travel_time[i]
}

#build non-rush hour
weekday = c("MON","TUE","WED","THU","FRI","SAT","SUN")
non_ruch_time = c(1:18,31:35,52:72)
week_avg = array(NA,c(7,72,6),list(weekday,time_label,gate_id))

for (gate in gate_id) {
  for (time in time_label) {#to build non-rush: non_ruch_time
    day = 2
    week_sum = numeric(7)
    week_num = numeric(7)
    
    for (date in date_label) {
      if (!is.na(time_chart[date,time,gate])) {
        week_num[day] = week_num[day] + 1
        week_sum[day] = week_sum[day] + time_chart[date,time,gate]
      }
      day = day + 1
      if (day == 8) day = 1
    }
    week_avg[,time,gate] = week_sum/week_num
  }
}

#data interpret
A_2 = time_chart[,,"A_2"]
aggr_A_2 = week_avg[,,"A_2"]
max_day = numeric(72)
for (i in 1:72) {
  max_day[i] = which.max(aggr_A_2[,i])
}
summary(factor(max_day))

normal_1C <- A_2[setdiff(-c(seq(5,91,7),seq(6,91,7),59,60,77,78,79,80,81),c(-62,-82,-83)),]
sun_normal_1C <- normal_1C[-c(11,13,15,16,29,41,42,44,50,51,52),]
install.packages("mice")
install.packages("randomForest")
require(mice)
require(randomForest)
mice.sun_normal_1C <- mice(sun_normal_1C, m=3,maxit=50,method="rf", seed=278)
cp_sun_normal1c <- complete(mice.sun_normal_1C,1)
cp_sun_normal1c <-complete(mice.sun_normal_1C,2)
cp_sun_normal1c <-complete(mice.sun_normal_1C,3)

#A_3 = time_chart[,,"A_3"]
#B_1 = time_chart[,,"B_1"]
#B_3 = time_chart[,,"B_3"]
#C_1 = time_chart[,,"C_1"]
#C_3 = time_chart[,,"C_3"]
