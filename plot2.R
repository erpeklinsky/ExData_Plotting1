##Read data
Data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = c("character","character",
                  "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))


##subset data based on dates needed
subsetData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]

##Format date to type date 
subsetData$Date <- as.Date(subsetData$Date, "%d/%m/%Y")

##create a combined date and time column and add to the subset data 
DateTime <- paste(subsetData$Date, subsetData$Time)
DateTime <- setNames(DateTime, "DateTime")
subsetData <- cbind(DateTime, subsetData)
subsetData$DateTime <- as.POSIXct(DateTime)

##Plot2

plot(subsetData$Global_active_power~subsetData$DateTime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()