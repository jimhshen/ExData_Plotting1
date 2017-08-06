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

#Plot
png("plot3.png", width=504, height=504, units = "px")
plot(dt, sm1, type="l", xlab = "", ylab="Energy sub metering")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
