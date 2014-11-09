library(lubridate);

setwd("~/coursera/exploredata/ExData_Plotting1/")
destfile <- "./household_power_consumption.zip"
if(!file.exists(destfile)) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = destfile, method = "curl")
}

## Unzips dataset
unzipedFile <- "./household_power_consumption.txt"
#if(!file.exists(destfile)) {
if(!file.exists(unzipedFile)) {
  unzip(destfile)
}

## Reads the whole dataset since it's not that big
comp_data <- read.table(unzipedFile, sep = ";", header = T, na.strings = "?")
## get required date
comp_data[comp_data$Date %in% c("1/2/2007","2/2/2007"),] -> data

data$Date <- dmy_hms(paste(data$Date,data$Time," "))


## Creates a 2x2 grid for placing the four plots.
par(mfrow = c(2, 2))
## Creates the first plot in (1, 1)
plot(x=data$Date, y=data$Global_active_power, type="l", ylab="Global Active Power",xlab="")

## Creates the second plot in (1, 2)
plot(x=data$Date, y=data$Voltage, type="l", ylab="Voltage",xlab="Datetime")

## Creates the third plot in (2, 1)
plot(x=data$Date, y=data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x=data$Date, y=data$Sub_metering_2, type="l", col="red")
lines(x=data$Date, y=data$Sub_metering_3, type="l", col="blue")
#legend("topright", seg.len=2, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty = "n")

## Creates the fourth plot in (2, 2)
plot(x=data$Date, y=data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="Datetime")


dev.copy(png, file = "./plot4.png")
dev.off()