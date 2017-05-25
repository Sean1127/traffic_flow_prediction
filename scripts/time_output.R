rm(list = ls())
setwd("kdd/scripts/")

outfile = read.csv("../submissionSamples/submission_sample_travelTime.csv")

# write avg
# am
day = read.csv("day_A2.csv")
end = read.csv("end_A2.csv")
week = c(2,3,4,5,6,7,1)
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+25]
    }
    outfile$avg_travel_time[(i-1)*6+j] = avg/length(index)
  }
}

day = read.csv("day_A3.csv")
end = read.csv("end_A3.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+25]
    }
    outfile$avg_travel_time[(i-1)*6+j+42] = avg/length(index)
  }
}

day = read.csv("day_B1.csv")
end = read.csv("end_B1.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+25]
    }
    outfile$avg_travel_time[(i-1)*6+j+84] = avg/length(index)
  }
}

day = read.csv("day_B3.csv")
end = read.csv("end_B3.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+25]
    }
    outfile$avg_travel_time[(i-1)*6+j+126] = avg/length(index)
  }
}

day = read.csv("day_C1.csv")
end = read.csv("end_C1.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+25]
    }
    outfile$avg_travel_time[(i-1)*6+j+168] = avg/length(index)
  }
}

day = read.csv("day_C3.csv")
end = read.csv("end_C3.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+25]
    }
    outfile$avg_travel_time[(i-1)*6+j+210] = avg/length(index)
  }
}

# pm
day = read.csv("day_A2.csv")
end = read.csv("end_A2.csv")
week = c(2,3,4,5,6,7,1)
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+52]
    }
    outfile$avg_travel_time[(i-1)*6+j+252] = avg/length(index)
  }
}

day = read.csv("day_A3.csv")
end = read.csv("end_A3.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+52]
    }
    outfile$avg_travel_time[(i-1)*6+j+294] = avg/length(index)
  }
}

day = read.csv("day_B1.csv")
end = read.csv("end_B1.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+52]
    }
    outfile$avg_travel_time[(i-1)*6+j+336] = avg/length(index)
  }
}

day = read.csv("day_B3.csv")
end = read.csv("end_B3.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+52]
    }
    outfile$avg_travel_time[(i-1)*6+j+378] = avg/length(index)
  }
}

day = read.csv("day_C1.csv")
end = read.csv("end_C1.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+52]
    }
    outfile$avg_travel_time[(i-1)*6+j+420] = avg/length(index)
  }
}

day = read.csv("day_C3.csv")
end = read.csv("end_C3.csv")
for (i in 1:7) {
  if (week[i] > 5) {
    infile = end
  } else {
    infile = day
  }
  
  for (j in 1:6) {
    avg = 0
    index = switch(week[i],
                   c(5,10,15,20,25,30,35,40,44,49,56,61),
                   c(1,6,11,16,21,26,31,36,41,45,50,57),
                   c(2,7,12,17,22,27,32,37,42,46,51,58),
                   c(3,8,13,18,23,28,33,38,47,52,59),
                   c(4,9,14,19,24,29,34,39,48,53,60),
                   c(1,3,5,7,9,11,13,15,17,19),
                   c(2,4,6,8,10,12,14,16,18,20))
    for (k in index) {
      avg = avg + infile[k,j+52]
    }
    outfile$avg_travel_time[(i-1)*6+j+462] = avg/length(index)
  }
}

write.csv(outfile, "travelTime.csv", row.names = FALSE)

