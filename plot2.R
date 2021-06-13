
# Reading in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subseting data
subdata <- subset(data, Date == "1/2/2007"|Date == "2/2/2007")

#Converting the Date and Time variables to  POSIXlt format
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# making the plot and saving it as png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(subdata, plot(Time,as.numeric(Global_active_power),type = "l",
                   ylab = "Global Active Power(kilowatts)"))
dev.off()

