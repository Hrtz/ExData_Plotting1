##=====================
## Four graphs - PLOT 4
##=====================

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
png("plot4.png")
par(mfrow = c(2, 2), pty = "m")
## graph no1
plot(data.pwr.dates$Days, data.pwr.dates$Global_active_power, ylab = "Global Active Power", xlab = "", type = "n", cex.axis = 0.9, cex.lab = 0.9)
lines(data.pwr.dates$Days,data.pwr.dates$Global_active_power)

## graph no2
plot(data.pwr.dates$Days, data.pwr.dates$Voltage, ylab = "Voltage", xlab = "datetime", type = "n", cex.axis = 0.9, cex.lab = 0.9)
lines(data.pwr.dates$Days,data.pwr.dates$Voltage)

## graph no3
plot(data.pwr.dates$Days, data.pwr.dates$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n", cex.axis = 0.9, cex.lab = 0.9)
lines(data.pwr.dates$Days,data.pwr.dates$Sub_metering_1, col = "black")
lines(data.pwr.dates$Days,data.pwr.dates$Sub_metering_2, col = "red")
lines(data.pwr.dates$Days,data.pwr.dates$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n", cex = 0.9)

## graph no4
plot(data.pwr.dates$Days, data.pwr.dates$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n", cex.axis = 0.9, cex.lab = 0.9)
lines(data.pwr.dates$Days,data.pwr.dates$Global_reactive_power)

dev.off()
