setwd("C:\\Users\\A6TTXZZ\\Desktop\\R Scripts\\Coursera Assignments\\EDA")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata%2Fdata%2Fhousehold_power_consumption.zip")

unzip (zipfile = "exdata%2Fdata%2Fhousehold_power_consumption.zip")

file <- read.table("household_power_consumption.txt", sep=";",header = TRUE,na.strings="?")
names(file)
file$DateFmt <- as.Date(file$Date ,format="%d/%m/%Y")

file$DateTimeFmt <-  as.POSIXct(paste(file$Date,file$Time,  sep = " "),format="%d/%m/%Y %H:%M:%S")

fileSub <- subset(file, DateTimeFmt >= "2007-02-01"  & DateTimeFmt < "2007-02-03" )

fileSub$Global_active_power_kw <-  as.numeric(fileSub$Global_active_power)/1000
#Plot
#par(mar = c(4,4,1,1))
hist(fileSub$Global_active_power_kw , col = "red" , main = "Global Active Power" ,ylab = "Frequency" ,xlab = "Global Active Power (kilowatts)")

## export file
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()

