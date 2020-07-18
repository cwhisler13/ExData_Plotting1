consumption_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

consumption_data$Time <- strptime(paste(consumption_data$Date, consumption_data$Time, sep = " "),
                                  format = "%Y-%m-%d %H:%M:%S")
exploratory_frame <- consumption_data[consumption_data$Date >= "2007-02-01" &
                                        consumption_data$Date <= "2007-02-02",]

png("plot2.png")

with(exploratory_frame, plot(x = Time, y = Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

dev.off()