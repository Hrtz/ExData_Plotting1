##=============================
## Global active power - PLOT 1
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

## creating histogram
png("plot1.png")
hist(data.pwr.dates$Global_active_power, breaks = 12, col = "red", main = "Global active power", xlab = "Global active power (kilowatts)")

dev.off()
