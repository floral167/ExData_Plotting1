#plot2.R
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

comp_data <- read.table(unzipedFile, sep = ";", header = T, na.strings = "?")
## get required date
comp_data[comp_data$Date %in% c("1/2/2007","2/2/2007"),] -> data
# transform the Date column to a usable date format
data$Date <- dmy_hms(paste(data$Date,data$Time," "))
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
#png(file="~/coursera/exploredata/ExData_Plotting1/figure/plot2.png", width=480, height=480)
png(file="./plot2.png", width=480, height=480)
with(data, plot(x=Date, y=Global_active_power, type="l", ylab="Global Active Power(killowatts)", xlab=""))
dev.off()


