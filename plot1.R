
# Code for load data file and subset the properly data
dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
dat <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
dat <- cbind(dat, DateTime)

# Instructions to plot figure 1
png(filename="plot1.png",
    height=480, width=480)
hist(dat$Global_active_power, 
     main="Global Active Power", 
     col="red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

