# download data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
# set paramneters
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0) )
# plot graph 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# plot graph 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# graph 3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright",  col=c("black", "red", "blue"), lty=1,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5,bty= "n",y.intersp=0.25)
# plot graph 4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
# create png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

