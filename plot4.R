# Download and unzip files
file_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(file_URL, destfile = "consumption.zip")
unzip("consumption.zip")

# Read in data
consumption_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Change class of date to date
consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")

# Change class of time to time
consumption_data$Time <- strptime(paste(consumption_data$Date, consumption_data$Time, sep = " "),
                                  format = "%Y-%m-%d %H:%M:%S")
# Narrow down to relevant dates
exploratory_frame <- consumption_data[consumption_data$Date >= "2007-02-01" &
                                        consumption_data$Date <= "2007-02-02",]

# Open png graphics device. Note 480 px x 480 px is default size.
png("plot4.png")
# Create 2x2 plot that fills by row first
par(mfrow = c(2,2))
# Recreate plot 1 with minor tweaks
with(exploratory_frame, plot(x = Time, y = Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))
# Add the voltage plot for the first time.
with(exploratory_frame, plot(x = Time, y = Voltage, xlab = "datetime", type = "l"))

# Recreate plot 3 with minor tweaks (remove legend box)
with(exploratory_frame, plot(x = Time, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black"))
lines(x = exploratory_frame$Time, y = exploratory_frame$Sub_metering_2, col = "red")
lines(x = exploratory_frame$Time, y = exploratory_frame$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# Create the plot for global reactive power.
with(exploratory_frame, plot(x = Time, y = Global_reactive_power, xlab = "datetime", type = "l"))

# Turn off graphics device.
dev.off()