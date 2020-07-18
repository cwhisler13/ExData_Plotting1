consumption_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

consumption_data$Time <- strptime(paste(consumption_data$Date, consumption_data$Time, sep = " "),
                                  format = "%Y-%m-%d %H:%M:%S")
exploratory_frame <- consumption_data[consumption_data$Date >= "2007-02-01" &
                                        consumption_data$Date <= "2007-02-02",]

png("plot1.png")

hist(exploratory_frame$Global_active_power, col = "red", xlim = c(0,6), ylim = c(0, 1200),
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
