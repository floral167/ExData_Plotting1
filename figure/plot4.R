library(lubridate);

read.csv(file="~/coursera//exploredata/household_power_consumption.txt", sep=";", header=T) ->comp_datacomp_data[comp_data$Date %in% c("1/2/2007","2/2/2007"),] -> data

data[data$Global_active_power!="?",]->cleaned
#write.table(file="~/coursera/exploredata/cleaned.csv", sep=",", cleaned, row.names=F)
#read.csv(file="~/coursera//exploredata/cleaned.csv", sep=",", header=T) ->cleaned
cleaned$l_Date <- dmy_hms(paste(cleaned$Date,cleaned$Time," "))
#cleaned$Global_active_power<-as.numeric(as.character(cleaned$Global_active_power))
par(mfrow=c(2,2), mar=c(4,4,2,2), oma = c(0, 0, 2, 0))
#png(file="~/coursera/exploredata/ExData_Plotting1/figure/plot4.png", width=480, height=480)
plot(x=cleaned$l_Date, y=cleaned$Global_active_power, type="l", ylab="Global Active Power",xlab="")
plot(x=cleaned$l_Date, y=cleaned$Voltage, type="l", ylab="Voltage",xlab="Datetime")
plot(x=cleaned$l_Date, y=cleaned$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x=cleaned$l_Date, y=cleaned$Sub_metering_2, type="l", col="red")
lines(x=cleaned$l_Date, y=cleaned$Sub_metering_3, type="l", col="blue")
legend("topright", seg.len=2, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x=cleaned$l_Date, y=cleaned$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="Datetime")
dev.copy(png, file = "~/coursera/exploredata/ExData_Plotting1/figure/plot4.png")
dev.off()