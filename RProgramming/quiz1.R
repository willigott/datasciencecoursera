data = read.csv('hw1_data.csv')
#11
colnames(data)
#12
data[1:2,]
#13
nrow(data)
#14
tail(data,2)
#15
data$Ozone[47]
#16
length(which(is.na(data$Ozone)==T))
#or
table(is.na(data$Ozone))
#17
mean(data$Ozone[is.na(data$Ozone) != T])
#18
extrData <- data[data$Ozone >= 31 & data$Temp > 90,]
mean(extrData$Solar.R[is.na(extrData$Solar.R) != T])
#19
mean(data$Temp[data$Month==6])
#20
max(data$Ozone[data$Month==5 & is.na(data$Ozone) ==F])