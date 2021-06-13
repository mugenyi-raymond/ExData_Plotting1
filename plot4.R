# Reading in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subseting data
subdata <- subset(data, Date == "1/2/2007"|Date == "2/2/2007")

#Converting the Date and Time variables to  POSIXlt format
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# making the plots
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2), mar = c(4,4,2,1))

#first plot
with(subdata, plot(Time,as.numeric(Global_active_power),type = "l",
                   ylab = "Global Active Power"))
#second plot
with(subdata, plot(Time, as.numeric(Sub_metering_1), ylab = "Energy sub metering", type = "l"))
with(subdata, lines(Time, as.numeric(Sub_metering_1)))
with(subdata, lines(Time, as.numeric(Sub_metering_2), col= "red"))
with(subdata, lines(Time, as.numeric(Sub_metering_3), col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex = 0.6 )
#third plot
with(subdata, plot(Time, as.numeric(Voltage), xlab = "datetime", ylab = "Voltage",
                   type = "l"))
#fourth plot
with(subdata, plot(Time, as.numeric(Global_reactive_power), xlab = "datetime",
                   ylab = "Global_reactive_power", type = "l"))
dev.off()
