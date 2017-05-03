rm(list = ls())

require(mice)

setwd("/home/sean/R/kdd/scripts/")
A2 = read.csv("20min_avg_time_A2.csv")
A3 = read.csv("20min_avg_time_A3.csv")
B1 = read.csv("20min_avg_time_B1.csv")
B3 = read.csv("20min_avg_time_B3.csv")
C1 = read.csv("20min_avg_time_C1.csv")
C3 = read.csv("20min_avg_time_C3.csv")
weather = read.csv("weather_aggr.csv")
train_avg_time = read.csv("training_20min_avg_travel_time.csv")

date_label = c(unique(substr(train_avg_time$time_window, 2, 11)))
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
index_weekday <- date_label[setdiff(-c(seq(5,91,7),seq(6,91,7),59,60,77,78,79,80,81),c(-62,-82,-83))]
index_weekend <- date_label[c(5,6,12,13,19,20,26,27,33,34,40,41,47,48,54,55,68,69,89,90)]
weekday_chart = array(NA,c(length(index_weekday),72,6),list(index_weekday,time_label,gate_id))
weekend_chart = array(NA,c(length(index_weekend),72,6),list(index_weekend,time_label,gate_id))

A2[A2 == 0] = NA
A3[A3 == 0] = NA
B1[B1 == 0] = NA
B3[B3 == 0] = NA
C1[C1 == 0] = NA
C3[C3 == 0] = NA

day_A2 = A2[which(date_label %in% index_weekday),,]
day_A3 = A3[which(date_label %in% index_weekday),,]
day_B1 = B1[which(date_label %in% index_weekday),,]
day_B3 = B3[which(date_label %in% index_weekday),,]
day_C1 = C1[which(date_label %in% index_weekday),,]
day_C3 = C3[which(date_label %in% index_weekday),,]

end_A2 = A2[which(date_label %in% index_weekend),,]
end_A3 = A3[which(date_label %in% index_weekend),,]
end_B1 = B1[which(date_label %in% index_weekend),,]
end_B3 = B3[which(date_label %in% index_weekend),,]
end_C1 = C1[which(date_label %in% index_weekend),,]
end_C3 = C3[which(date_label %in% index_weekend),,]

A2_complete.data = matrix(rep(0,5184),nrow = 72)
A3_complete.data = matrix(rep(0,5184),nrow = 72)
B1_complete.data = matrix(rep(0,5184),nrow = 72)
B3_complete.data = matrix(rep(0,5184),nrow = 72)
C1_complete.data = matrix(rep(0,5184),nrow = 72)
C3_complete.data = matrix(rep(0,5184),nrow = 72)

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
A2.data <- mice(day_A2,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  A2_complete.data <- A2_complete.data+complete(A2.data,i)
A2_complete.data <- A2_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
A3.data <- mice(day_A3,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  A3_complete.data <- A3_complete.data+complete(A3.data,i)
A3_complete.data <- A3_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
B1.data <- mice(day_B1,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  B1_complete.data <- B1_complete.data+complete(B1.data,i)
B1_complete.data <- B1_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
B3.data <- mice(day_B3,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  B3_complete.data <- B3_complete.data+complete(B3.data,i)
B3_complete.data <- B3_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
C1.data <- mice(day_C1,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  C1_complete.data <- C1_complete.data+complete(C1.data,i)
C1_complete.data <- C1_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
C3.data <- mice(day_C3,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  C3_complete.data <- C3_complete.data+complete(C3.data,i)
C3_complete.data <- C3_complete.data/100

#create big table
weekday_big_table = data.frame(matrix(NA, 61*24*6, length(weather[1,]) + 6))
weekend_big_table = data.frame(matrix(NA, 20*24*6, length(weather[1,]) + 6))
gate_id = c("A_2","A_3","B_1","B_3","C_1")
colnames(weekday_big_table) = c(colnames(weather), gate_id, "y")
colnames(weekend_big_table) = c(colnames(weather), gate_id, "y")

gate_id = c("A_2","A_3","B_1","B_3","C_1","C_3")
index_date = setdiff(c(1:91),setdiff(c(seq(5,91,7),seq(6,91,7),59,60,77,78,79,80,81),c(62,82,83)))
index_time = c(19:30,46:57)

#fill weekday big table
index = 1
for (i in index_date) {
  for (j in index_time) {
    for (k in 1:length(gate_id)) {
      weekday_big_table$date[index] = date_label[i]
      weekday_big_table$hour[index] = time_label[j]
      weekday_big_table[index,3:7] = weather[(i + 17)*8 + trunc((j - 1)/9) + 1,3:7]
      
      weekday_big_table[index,8:12] = switch(k,
                                      c(1,0,0,0,0),
                                      c(0,1,0,0,0),
                                      c(0,0,1,0,0),
                                      c(0,0,0,1,0),
                                      c(0,0,0,0,1),
                                      c(0,0,0,0,0))
      weekday_big_table$y[index] = switch(k,
                                  A2_complete.data[i,j],
                                  A3_complete.data[i,j],
                                  B1_complete.data[i,j],
                                  B3_complete.data[i,j],
                                  C1_complete.data[i,j],
                                  C3_complete.data[i,j])
      index = index + 1
    }
  }
  print(i)
}

A2_complete.data = matrix(rep(0,5184),nrow = 72)
A3_complete.data = matrix(rep(0,5184),nrow = 72)
B1_complete.data = matrix(rep(0,5184),nrow = 72)
B3_complete.data = matrix(rep(0,5184),nrow = 72)
C1_complete.data = matrix(rep(0,5184),nrow = 72)
C3_complete.data = matrix(rep(0,5184),nrow = 72)

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
A2.data <- mice(end_A2,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  A2_complete.data <- A2_complete.data+complete(A2.data,i)
A2_complete.data <- A2_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
A3.data <- mice(end_A3,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  A3_complete.data <- A3_complete.data+complete(A3.data,i)
A3_complete.data <- A3_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
B1.data <- mice(end_B1,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  B1_complete.data <- B1_complete.data+complete(B1.data,i)
B1_complete.data <- B1_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
B3.data <- mice(end_B3,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  B3_complete.data <- B3_complete.data+complete(B3.data,i)
B3_complete.data <- B3_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
C1.data <- mice(end_C1,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  C1_complete.data <- C1_complete.data+complete(C1.data,i)
C1_complete.data <- C1_complete.data/100

m = matrix(rep(0,5184),nrow = 72)
for(i in c(19:30))
  m[,i] = matrix(1,72,1)
for (i in c(46:57))
  m[,i] = matrix(1,72,1)
C3.data <- mice(end_C3,m = 100 ,predictorMatrix = m, printFlag = FALSE)
for (i in c(1:100))
  C3_complete.data <- C3_complete.data+complete(C3.data,i)
C3_complete.data <- C3_complete.data/100

#fill weekend big table
index_date = c(5,6,12,13,19,20,26,27,33,34,40,41,47,48,54,55,68,69,89,90)
index = 1
for (i in index_date) {
  for (j in index_time) {
    for (k in 1:length(gate_id)) {
      weekend_big_table$date[index] = date_label[i]
      weekend_big_table$hour[index] = time_label[j]
      weekend_big_table[index,3:7] = weather[(i + 17)*8 + trunc((j - 1)/9) + 1,3:7]
      
      weekend_big_table[index,8:12] = switch(k,
                                             c(1,0,0,0,0),
                                             c(0,1,0,0,0),
                                             c(0,0,1,0,0),
                                             c(0,0,0,1,0),
                                             c(0,0,0,0,1),
                                             c(0,0,0,0,0))
      weekend_big_table$y[index] = switch(k,
                                          A2_complete.data[i,j],
                                          A3_complete.data[i,j],
                                          B1_complete.data[i,j],
                                          B3_complete.data[i,j],
                                          C1_complete.data[i,j],
                                          C3_complete.data[i,j])
      index = index + 1
    }
  }
  print(i)
}

write.csv(weekday_big_table,"big_table_weekday.csv")
write.csv(weekend_big_table,"big_table_weekend.csv")
