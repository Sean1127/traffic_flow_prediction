rm(list = ls())

#build avg time chart
setwd("/home/sean/R/kdd/scripts")
train_avg_time = read.csv("training_20min_avg_travel_time.csv")

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

#seperate weekday
index_weekday <- date_label[setdiff(-c(seq(5,91,7),seq(6,91,7),59,60,77,78,79,80,81),c(-62,-82,-83))]
index_weekend <- date_label[c(5,6,12,13,19,20,26,27,33,34,40,41,47,48,54,55,68,69,89,90)]
weekday_chart = array(NA,c(length(index_weekday),72,6),list(index_weekday,time_label,gate_id))
weekend_chart = array(NA,c(length(index_weekend),72,6),list(index_weekend,time_label,gate_id))

weekday_chart = time_chart[which(date_label %in% index_weekday),,]
weekend_chart = time_chart[which(date_label %in% index_weekend),,]

save(weekday_chart,file = "weekday.RData")
save(weekend_chart,file = "weekend.RData")
