power <- read.table("./household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE,dec = ".")
power_subset<- power[power$Date %in% c("1/2/2007","2/2/2007"),]
power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)
## as instructed,we can use strptime function
dateandtime <- strptime(paste(power_subset$Date, power_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub_metering_1 <- as.numeric(power_subset$Sub_metering_1)
Sub_metering_2 <- as.numeric(power_subset$Sub_metering_2)
Sub_metering_3 <- as.numeric(power_subset$Sub_metering_3)

power_subset$Global_reactive_power <- as.numeric(power_subset$Global_reactive_power)
power_subset$Voltage <- as.numeric(power_subset$Voltage)

## Initialize graphic device
## now we will save the plots in png file
png("plot4.png", width = 480, height = 480)
## Using par function we can decide how our plots should be shown.
par(mfrow = c(2,2))

## topleft plot
plot(dateandtime, power_subset$Global_active_power, type = "l", xlab = " ", ylab = "Global_active_power(kilowatts)")

## topright plot
plot(dateandtime, power_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## bottomleft plot
plot(dateandtime, Sub_metering_1, col = "red", type="l", ylab="Energy Sub metering", xlab="")
lines(dateandtime, Sub_metering_2, type="l", col="green")
lines(dateandtime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, lty=1, col=c("red", "green", "blue"))

## bottomright plot
plot(dateandtime, power_subset$Global_reactive_power, type = "l", xlab = "Global_reactive_power", ylab = "datetime")

dev.off()
