#Read in file
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)
#Reduce to date range we want
data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data$newtime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Create png device
png("plot3.png", width = 480, height =480)

#Plot Chart
plot(data$newtime, as.numeric(data$Sub_metering_1), type = 'l', xlab = "", ylab = "Energy sub metering")
points(data$newtime, as.numeric(data$Sub_metering_2), type = 'l', col = "red")
points(data$newtime, as.numeric(data$Sub_metering_3),  type = 'l', col = "blue")

legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)

#Close plot device
dev.off()
