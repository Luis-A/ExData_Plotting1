
# Code for load data file and subset the properly data
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
dat <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
dat <- cbind(dat, DateTime)

# Instructions to plot figure 4
png(filename="plot4.png",
    height=480, width=480)

par(mfcol = c(2,2))
# 2 rows, 2 columns
#1 row, 1 column
plot(dat$DateTime, dat$Global_active_power, type = "l",
           xlab="", ylab="Global Active Power")
#2 row, 1 column
plot(dat$DateTime, dat$Sub_metering_1, type = "n",
     xlab="", ylab="Energy sub metering")
points(dat$DateTime, dat$Sub_metering_1, type="l")
points(dat$DateTime, dat$Sub_metering_2, type="l", col = "red")
points(dat$DateTime, dat$Sub_metering_3, type="l", col = "blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1, 
       bty = "n")  ## without border

#1 row, 2 column
plot(dat$DateTime, dat$Voltage, type = "l", 
     xlab="datetime", ylab="Voltage")

#2 row, 2 column
plot(dat$DateTime, dat$Global_reactive_power, type = "l", 
     xlab="datetime", ylab="Global_reactive_power")

#close the device
dev.off()

