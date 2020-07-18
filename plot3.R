consumption_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

consumption_data$Time <- strptime(paste(consumption_data$Date, consumption_data$Time, sep = " "),
                                  format = "%Y-%m-%d %H:%M:%S")
exploratory_frame <- consumption_data[consumption_data$Date >= "2007-02-01" &
                                        consumption_data$Date <= "2007-02-02",]


png("plot3.png")
with(exploratory_frame, plot(x = Time, y = Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col = "black"))
lines(x = exploratory_frame$Time, y = exploratory_frame$Sub_metering_2, col = "red")
lines(x = exploratory_frame$Time, y = exploratory_frame$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()