power <- read.table("./household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE,dec = ".")
power_subset<- power[power$Date %in% c("1/2/2007","2/2/2007"),]
power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)

## as instructed, we can use strptime function
dateandtime <- strptime(paste(power_subset$Date, power_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Initialize graphic device
## now we will save the plot in png file
png("plot2.png", width= 480, height = 480)
plot(dateandtime, power_subset$Global_active_power, type = "l", xlab = " ", ylab = "Global_active_power(kilowatts)")
dev.off()
