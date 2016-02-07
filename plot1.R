## Exploratory Data Analysis
## Week 1 Assignment - Plot 2

library(data.table)

## read in data "?" as null

hpc <- fread("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, na.strings = "?")

## subset by dates

hpcsub1 <- hpc[hpc$Date == "1/2/2007"]
hpcsub2 <- hpc[hpc$Date == "2/2/2007"]

## combine the two date subsets

hpcsub <- rbind(hpcsub1,hpcsub2)

## plot histogram

par(cex = 0.9, cex.main = 1)
with(hpcsub, hist(as.numeric(Global_active_power),
                  col = "red", 
                  main = "Global Active Power",
                  xlab = "Global Active Power (kilowatts)",
                  ylab = "Frequency",
                  ))


