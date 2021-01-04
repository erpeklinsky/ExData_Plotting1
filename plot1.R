##Read data
Data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = c("character","character",
                  "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

subsetData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]

## Plot1 - Histogram
hist(subsetData$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
