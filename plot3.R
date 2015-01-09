##=============================
## Energy sub metering - PLOT 3
##=============================

## reading household_power_consumption.txt as data frame
data.pwr <- as.data.frame(read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?"))
head(data.pwr)

## converting Date column to Date class
data.pwr$Date <- as.Date(data.pwr$Date, "%d/%m/%Y")
data.pwr[order(data.pwr$Date ),]
## creating data frame for selected time period
data.pwr.dates <- subset(data.pwr, Date >= as.Date("01/02/2007", "%d/%m/%Y") & Date <= as.Date("02/02/2007", "%d/%m/%Y"))
head(data.pwr.dates)

## adding date/time column
date.time <- paste(data.pwr.dates$Date, data.pwr.dates$Time)
days <- strptime(date.time, "%Y-%m-%d %H:%M:%S")
## setting days to be displayed in English
Sys.setlocale("LC_TIME", "English")
data.pwr.dates[, "Days"] <- as.POSIXct(days)

## creating plot
png("plot3.png")
plot(data.pwr.dates$Days, data.pwr.dates$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(data.pwr.dates$Days,data.pwr.dates$Sub_metering_1, col = "black")
lines(data.pwr.dates$Days,data.pwr.dates$Sub_metering_2, col = "red")
lines(data.pwr.dates$Days,data.pwr.dates$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()
