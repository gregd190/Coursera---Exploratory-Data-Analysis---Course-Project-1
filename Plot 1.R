#Read in file
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE)
#Reduce to date range we want
data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Create png device
png("plot1.png", width=480, height=480)

#Plot histogram
hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Close plot device
dev.off()