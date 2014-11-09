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
#data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
png(file="./plot3.png", width=480, height=480)

with(data, plot(x=Date, y=Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(x=Date, y=Sub_metering_2, type="l", col="red"))
with(data, lines(x=Date, y=Sub_metering_3, type="l", col="blue"))
legend("topright", seg.len=2, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
