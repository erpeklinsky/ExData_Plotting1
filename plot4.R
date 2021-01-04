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

##Plot4

par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(0,0,2,0))
with(subsetData, {
  plot(Global_active_power~DateTime, type="l", 
            ylab="Global Active Power", xlab="")
 
 plot(Voltage~DateTime, type = "l", ylab = "Voltage",
       xlab = "datetime")
  
  plot(Sub_metering_1~DateTime, type="l", col = "black", 
       ylab="Energy sub metering", xlab="")
  points(Sub_metering_2~DateTime, type="l", col = "red")
  points(Sub_metering_3~DateTime, type="l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), lwd= c(1,1,1),cex = 0.8, bty = "n",
         c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~DateTime, type = "l", 
       ylab = "Global_reactive_power", xlab = "datetime")
  
})

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()