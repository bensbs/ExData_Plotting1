## Exploratory Data Analysis
## Week 1 Assignment - Plot 2

setwd("/Users/Ben/Desktop/Coursera")

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, na.strings = "?")

hpcsub1 <- subset(hpc, hpc$Date == "1/2/2007")
hpcsub2 <- subset(hpc, hpc$Date == "2/2/2007")

hpcsub <- rbind(hpcsub1,hpcsub2)

hpcsub$datetime <- paste(hpcsub$Date,hpcsub$Time)

hpcsub$datetime <- strptime(hpcsub$datetime, "%d/%m/%Y %H:%M:%S")

par(cex = 0.9, cex.main = 1)

with(hpcsub, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))