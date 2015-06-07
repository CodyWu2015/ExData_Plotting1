if(!file.exists("data"))
{
  dir.create("data")
}
if(!file.exists("./data/household_power_consumption.zip"))
{
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile="./data/household_power_consumption.zip", method="curl")
}

if(!file.exists("./data/household_power_consumption.txt"))
{
  unzip("data/household_power_consumption.zip", exdir="data")
}

a <- read.csv("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric", 7)))
a$Date <- as.Date(a$Date, format="%d/%m/%Y")
a <- subset(a, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
a$Time <- strptime(paste(a$Date, a$Time), "%Y-%m-%d %H:%M:%S")
png(file="plot2.png", width=480, height=480)
with(a, plot(Time, Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
