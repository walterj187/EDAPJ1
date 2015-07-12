setwd("C:\\Users\\Walter\\Box Sync\\School Stuff\\Coursera\\EDA\\PJ1")

my.data.frame <- read.table("household_power_consumption.txt", header = TRUE,sep = ";",stringsAsFactors=FALSE, dec=".")
subsetdata <- my.data.frame[my.data.frame$Date %in% c("1/2/2007","2/2/2007") ,]

summary(subsetdata)
str(subsetdata)

subsetdata$gap <- as.numeric(subsetdata$Global_active_power)
subsetdata$datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subsetdata$subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subsetdata$subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subsetdata$subMetering3 <- as.numeric(subsetdata$Sub_metering_3)
subsetdata$globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
subsetdata$voltage <- as.numeric(subsetdata$Voltage)

#Plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(subsetdata$datetime, subsetdata$gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(subsetdata$datetime, subsetdata$voltage, type="l", xlab="datetime", ylab="Voltage")

plot(subsetdata$datetime, subsetdata$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subsetdata$datetime, subsetdata$subMetering2, type="l", col="red")
lines(subsetdata$datetime, subsetdata$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(subsetdata$datetime, subsetdata$globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()