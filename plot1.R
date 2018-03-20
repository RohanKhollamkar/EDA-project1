power <- read.table("./household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE,dec = ".")
power_subset<- power[power$Date %in% c("1/2/2007","2/2/2007"),]

power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)

## Initialize graphic device
## now we will save the plot in png file
png("plot1.png",width = 480, height = 480)
hist(power_subset$Global_active_power,col = "red",xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()