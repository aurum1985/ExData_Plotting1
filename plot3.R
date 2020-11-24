data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
str(data)

data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot 3


png("plot3.png")
plot(data_sub$dt, data_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data_sub$dt, data_sub$Sub_metering_2, type = "l",  col = "red")
points(data_sub$dt, data_sub$Sub_metering_3, type = "l",  col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = 1)
dev.off()
