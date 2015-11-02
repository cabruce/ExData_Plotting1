## Input Data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


## Data Processing
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot
par(mfrow=c(2,2))
with(data, {
 ## upper left 
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
 ## upper right 
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  ## lower left
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ## lower right
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


## Export
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()