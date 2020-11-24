data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
str(data)

data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot 2


png("plot2.png")
plot(data_sub$dt, data_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


