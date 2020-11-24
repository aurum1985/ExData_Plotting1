data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
str(data)

data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot 4


png("plot4.png")

par(mfrow = c(2,2), mar = c(4,4,4,4))
plot(data_sub$dt, data_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(data_sub$dt, data_sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data_sub$dt, data_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data_sub$dt, data_sub$Sub_metering_2, type = "l",  col = "red")
points(data_sub$dt, data_sub$Sub_metering_3, type = "l",  col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data_sub$dt, data_sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
