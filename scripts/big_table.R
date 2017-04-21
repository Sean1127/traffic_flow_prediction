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

write.csv(big_table, "big_table.csv",col.names = FALSE)