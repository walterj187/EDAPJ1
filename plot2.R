setwd("C:\\Users\\Walter\\Box Sync\\School Stuff\\Coursera\\EDA\\PJ1")

my.data.frame <- read.table("household_power_consumption.txt", header = TRUE,sep = ";",stringsAsFactors=FALSE, dec=".")
subsetdata <- my.data.frame[my.data.frame$Date %in% c("1/2/2007","2/2/2007") ,]

summary(subsetdata)
str(subsetdata)

subsetdata$gap <- as.numeric(subsetdata$Global_active_power)
subsetdata$datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

#Plot2
png("plot2.png", width=480, height=480)
plot(subsetdata$datetime, subsetdata$gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 

