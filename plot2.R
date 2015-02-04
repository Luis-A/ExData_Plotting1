# Code for load data file and subset the properly data
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
dat <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
dat <- cbind(dat, DateTime)

# Instructions to plot figure 2
png(filename="plot2.png",
    height=480, width=480)
plot(dat$DateTime, dat$Global_active_power, type = "l",
     xlab="", ylab="Global Active Poser (kilowatts)")
dev.off()


