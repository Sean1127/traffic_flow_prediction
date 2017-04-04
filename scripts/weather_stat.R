rm(list = ls())
setwd("/home/sean/R/kdd/dataSets/training/")

weather_file = read.csv("weather (table 7)_training_update.csv")
weather_file$date = as.character(weather_file$date)
weather = data.frame(matrix(NA,108*8,length(weather_file)))
colnames(weather) = colnames(weather_file)

date = c(unique(as.character(weather_file$date)))
hour = c(0,3,6,9,12,15,18,21)

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
