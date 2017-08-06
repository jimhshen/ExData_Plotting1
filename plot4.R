#Working Directory
WD <-getwd()
setwd(WD)

#Import Data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)

#Subset Data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert Variables
dt <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sm1 <- as.numeric(subData$Sub_metering_1)
sm2 <- as.numeric(subData$Sub_metering_2)
sm3 <- as.numeric(subData$Sub_metering_3)
gap <- as.numeric(subData$Global_active_power)
grp  <- as.numeric(subData$Global_reactive_power)
volt <- as.numeric(subData$Voltage)

#Plot
png("plot4.png", width=504, height=504, units = "px")
par(mfrow = c(2, 2))

#Top Left
plot(dt, gap, type="l", xlab="", ylab="Global Active Power")

#Top Right
plot(dt, volt, type="l", xlab="datetime", ylab="Voltage")

#Bottom Left
plot(dt, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Bottom Right
plot(dt, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
