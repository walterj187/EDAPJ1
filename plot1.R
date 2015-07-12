setwd("C:\\Users\\Walter\\Box Sync\\School Stuff\\Coursera\\EDA\\PJ1")

my.data.frame <- read.table("household_power_consumption.txt", header = TRUE,sep = ";",stringsAsFactors=FALSE, dec=".")
subsetdata <- my.data.frame[my.data.frame$Date %in% c("1/2/2007","2/2/2007") ,]

summary(subsetdata)
str(subsetdata)

subsetdata$gap <- as.numeric(subsetdata$Global_active_power)
subsetdata$datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot1
png("plot1.png", width=480, height=480)
hist(subsetdata$gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
