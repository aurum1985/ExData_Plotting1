data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
str(data)

data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot 1


png("plot1.png")
hist(data_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", breaks = 13, ylim = c(0,1200), xlim = c(0, 6))
dev.off()
