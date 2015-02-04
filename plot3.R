
# Code for load data file and subset the properly data
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
dat <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
dat <- cbind(dat, DateTime)

# Instructions to plot figure 3
png(filename="plot3.png",
    height=480, width=480)
plot(dat$DateTime, dat$Sub_metering_1, type = "n",
     xlab="", ylab="Energy sub metering")
points(dat$DateTime, dat$Sub_metering_1, type="l")
points(dat$DateTime, dat$Sub_metering_2, type="l", col = "red")
points(dat$DateTime, dat$Sub_metering_3, type="l", col = "blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)
dev.off()

