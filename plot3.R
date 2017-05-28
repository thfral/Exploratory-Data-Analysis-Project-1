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
png("plot3.png", width=480, height=480)
par(mfrow=c(1,1))
plot(as.numeric(power_consumption$Sub_metering_1), type = "l", ylab = "Energy Submetering", xlab="", xaxt = "n")
lines(power_consumption$Sub_metering_2, type = "l", col = "red")
lines(power_consumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"),tick = c(1, 1441, 2880))
dev.off()
