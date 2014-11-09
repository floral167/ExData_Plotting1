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
png(file="./plot1.png", width=480, height=480)
hist(as.numeric(as.character(data$Global_active_power)), col="red",main="Global Active Power", xlab="Global Active Power(killowatts)", ylab="Frequency")
dev.off()
