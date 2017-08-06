#Working Directory
WD <-getwd()
setwd(WD)

#Import Data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)

#Subset Data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert Variables
gap <- as.numeric(subData$Global_active_power)

#Generate Plot
png("plot1.png", width=504, height=504, units = "px")
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
