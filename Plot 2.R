#Read in file
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)
#Reduce to date range we want
data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data$newtime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Create png device
png("plot2.png", width=480, height=480)

#Plot Chart
plot(data$newtime, data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

#Close plot device
dev.off()