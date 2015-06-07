a <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric", 7)))
a$Date <- as.Date(a$Date, format="%d/%m/%Y")
a <- subset(a, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
a$Time <- strptime(paste(a$Date, a$Time), "%Y-%m-%d %H:%M:%S")
png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with(a, {
     plot(Time, Global_active_power,type="l", ylab="Global Active Power", xlab="")
     plot(Time, Voltage,type="l", xlab="datetime")
     plot(Time,  Sub_metering_1, type="l", ylab="Energy sub metering",  xlab="")
     lines(Time, Sub_metering_2, col="red")
     lines(Time, Sub_metering_3, col="blue")
     legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     plot(Time, Global_reactive_power,type="l", xlab="datetime")
})

dev.off()
