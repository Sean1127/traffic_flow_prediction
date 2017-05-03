setwd("/home/sean/R/kdd/scripts/")
temp = read.csv("normal.csv")
temp = big_table

# new big table
normal = data.frame(matrix(NA, length(temp[,1])/3, length(temp[1,]) - 2))
colnames(normal) = colnames(temp)[3:17]
normal$date = character(length(normal$date))
normal$hour = character(length(normal$hour))
hour = c("06:00","06:20", "06:40", "07:00","07:20", "07:40",
         "08:00","08:20", "08:40", "09:00","09:20", "09:40",
         "15:00","15:20", "15:40", "16:00","16:20", "16:40",
         "17:00","17:20", "17:40", "18:00","18:20", "18:40")
j = 1
for (i in 1:length(temp[,1])){
  if (is.element(temp$hour[i], hour)){
    normal$date[j] = toString(temp$date[i])
    normal$hour[j] = toString(temp$hour[i])
    normal[j,3:15] = temp[i,5:17]
    j = j + 1
  }
}

# stepwise
fit <- lm(y~date+hour+pressure+sea_pressure+wind_direction+wind_speed+temperature+rel_humidity+precipitation+A_2+A_3+B_1+B_3+C_1,big_table)
step <- step(fit, direction="both")
summary(step)
step$anova

#