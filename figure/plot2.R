#plot2.R
library(lubridate);

read.csv(file="~/coursera//exploredata/household_power_consumption.txt", sep=";", header=T) ->comp_datacomp_data[comp_data$Date %in% c("1/2/2007","2/2/2007"),] -> data

data[data$Global_active_power!="?",]->cleaned
#write.table(file="~/coursera/exploredata/cleaned.csv", sep=",", cleaned, row.names=F)
#read.csv(file="~/coursera//exploredata/cleaned.csv", sep=",", header=T) ->cleaned
cleaned$l_Date <- dmy_hms(paste(cleaned$Date,cleaned$Time," "))
cleaned$Global_active_power<-as.numeric(as.character(cleaned$Global_active_power))
png(file="~/coursera/exploredata/ExData_Plotting1/figure/plot2.png", width=480, height=480)
with(cleaned, plot(x=l_Date, y=Global_active_power, type="l", ylab="Global Active Power(killowatts)", xlab=""))
dev.off()


