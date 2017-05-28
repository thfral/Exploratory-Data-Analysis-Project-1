library(lubridate)

# Download the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")

# Unzip
unzip("household_power_consumption.zip", overwrite = TRUE) 

# Load features
power_consumption <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")

# Convert Dates
power_consumption$Date <- dmy(power_consumption$Date)
power_consumption$Time <- hms(power_consumption$Time)

# Filter Dates
dates <- c(ymd('2007-02-01'),ymd('2007-02-02'))
power_consumption <- subset(power_consumption, power_consumption$Date %in% dates)

# Plot Chart
png("plot2.png", width=480, height=480)
par(mfrow=c(1,1))
plot(power_consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt = "n")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()
