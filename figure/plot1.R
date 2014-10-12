read.csv(file="~/coursera//exploredata/household_power_consumption.txt", sep=";", header=T) ->comp_data
comp_data[comp_data$Date %in% c("1/2/2007","2/2/2007"),] -> data
data[data$Global_active_power!="?",]->cleaned
png(file="~/coursera/exploredata/ExData_Plotting1/figure/plot1.png", width=480, height=480)
hist(as.numeric(as.character(cleaned$Global_active_power)), col="red",main="Global Active Power", xlab="Global Active Power(killowatts)", ylab="Frequency")
dev.off()
