rm(list = ls())

#build weather chart
setwd("/home/sean/R/kdd/dataSets/training/")
weather_file = read.csv("weather (table 7)_training_update.csv")

weather_file$date = as.character(weather_file$date)
weather = data.frame(matrix(NA,108*8,length(weather_file)))
colnames(weather) = colnames(weather_file)

date = c(unique(as.character(weather_file$date)))
hour = c(0,3,6,9,12,15,18,21)

#fill chart
for (i in 1:length(date)) {
  for (j in 1:length(hour)) {
    index = intersect(which(weather_file$date %in% date[i]),
                      which(weather_file$hour %in% hour[j]))
    if (length(index) == 1) {
      weather[(i - 1) * 8 + j,] = weather_file[index,]
    } else {
      weather$date[(i - 1) * 8 + j] = date[i]
      weather$hour[(i - 1) * 8 + j] = hour[j]
    }
  }
}

#fill missing value
for (i in 1:(length(weather[,1]) - 1)) {
  j = i + 1
  while (j <= length(weather[,1]) && is.na(weather$pressure[j])) {
    j = j + 1
  }
  if ((i + 1) != j) {
    for (k in (i + 1):(j - 1)) {
      date_k = weather$date[k]
      hour_k = weather$hour[k]
      
      weather[k,] = (as.numeric(weather[i,]) * (j - k) +
                       as.numeric(weather[j,]) * (k - i))/(j - i)
      
      weather$date[k] = date_k
      weather$hour[k] = hour_k
    }
  }
}

#build avg time chart
setwd("/home/sean/R/kdd/scripts")
train_avg_time = read.csv("training_20min_avg_travel_time.csv")
train_avg_volumn = read.csv("training_20min_avg_volume.csv")

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

#create big table
big_table = data.frame(matrix(NA, 91*72*6, length(weather[1,]) + 6))
gate_id = c("A_2","A_3","B_1","B_3","C_1")
colnames(big_table) = c(colnames(weather), gate_id, "y")
gate_id = c("A_2","A_3","B_1","B_3","C_1","C_3")

#fill big table
index = 1
for (i in 1:length(date_label)) {
  for (j in 1:length(time_label)) {
    for (k in 1:length(gate_id)) {
      big_table$date[index] = date_label[i]
      big_table$hour[index] = time_label[j]
      big_table[index,3:9] = weather[(i + 17)*8 + trunc((j - 1)/9) + 1,3:9]
      big_table[index,10:14] = c(if(k == 1) 1 else 0,
                                 if(k == 2) 1 else 0,
                                 if(k == 3) 1 else 0,
                                 if(k == 4) 1 else 0,
                                 if(k == 5) 1 else 0)
      big_table$y[index] = time_chart[i,j,gate_id[k]]
      index = index + 1
    }
  }
  print(i)
}

write.csv(big_table, "training_big_table.csv")
