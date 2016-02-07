## Exploratory Data Analysis
## Week 1 Assignment - Plot 4

setwd("/Users/Ben/Desktop/Coursera")

## read in data "?" as NA

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, na.strings = "?")

## combine the two date subsets

hpcsub1 <- subset(hpc, hpc$Date == "1/2/2007") 
hpcsub2 <- subset(hpc, hpc$Date == "2/2/2007")

hpcsub <- rbind(hpcsub1,hpcsub2) ## recombine date subsets

hpcsub$datetime <- paste(hpcsub$Date,hpcsub$Time) ## combine Date and Time variables

hpcsub$datetime <- strptime(hpcsub$datetime, "%d/%m/%Y %H:%M:%S") ##convert this to POSIXlt

par(mfrow=c(2,2), omi = c(0.1,0.1, 0.1, 0.1), cex = 0.7) ## specify 2x2 plot and reduce text size


## plot 1

with(hpcsub, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))

## plot 2

with(hpcsub, plot(datetime, Voltage, type = "l"))?

## plot 3

plot(hpcsub$datetime, hpcsub$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "datetime")
par(new = TRUE)
plot(hpcsub$datetime, hpcsub$Sub_metering_2, type = "l", col = "red", ylim = c(0,40), xaxt="n", yaxt = "n", xlab = "", ylab = "")
par(new = TRUE)
plot(hpcsub$datetime, hpcsub$Sub_metering_3, type = "l", col = "blue", ylim = c(0,40), xaxt="n", yaxt = "n", xlab = "", ylab = "")

## add legend

legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lwd = 1, cex = 0.8)

## plot 4
        
with(hpcsub, plot(datetime, Global_reactive_power, type = "l"))