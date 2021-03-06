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
png("plot2.png")

# Create line graph and relable the axes
with(exploratory_frame, plot(x = Time, y = Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

dev.off()