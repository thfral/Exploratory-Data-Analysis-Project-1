library(lubridate)

# Download the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")

# Unzip
unzip("household_power_consumption.zip", overwrite = TRUE) 

# Load features
power_consumption <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?", dec=".",stringsAsFactors=FALSE)

# Convert Dates
power_consumption$Date <- dmy(power_consumption$Date)
power_consumption$Time <- hms(power_consumption$Time)

# Filter Dates
dates <- c(ymd('2007-02-01'),ymd('2007-02-02'))
power_consumption <- subset(power_consumption, power_consumption$Date %in% dates)

# Plot Chart
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2)) 

# Plot 1
plot(power_consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2, xaxt = "n")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"),tick = c(1, 1441, 2880))

# Plot 2
plot(power_consumption$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="", xaxt = "n")
lines(power_consumption$Sub_metering_2, type="l", col="red")
lines(power_consumption$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty="o")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"),tick = c(1, 1441, 2880))

# Plot 3
plot(power_consumption$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt = "n")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"),tick = c(1, 1441, 2880))

# Plot 4
plot(power_consumption$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt = "n")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"),tick = c(1, 1441, 2880))
dev.off()
