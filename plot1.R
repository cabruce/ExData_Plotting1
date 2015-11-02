## Input Data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


## Data Processing
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     col="red")


## Export
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()