
# Reading in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subseting data
subdata <- subset(data, Date == "1/2/2007"|Date == "2/2/2007")

#Making the plot and saving it as png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(subdata$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)",
     main = "Global Active Power")
dev.off()




