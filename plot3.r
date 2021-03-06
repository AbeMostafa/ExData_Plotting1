#Reads in file
input <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";", na.strings="?")

#Subsets the data for the given time frame
required_data <- subset(input, input$Date == "1/2/2007" | input$Date == "2/2/2007")

#converts date and time columns to a dateTime column
required_data$Date <- as.Date(required_data$Date, format = "%d/%m/%Y")
required_data$Weekday <- weekdays(required_data$Date, abbreviate = TRUE)

dateWithTime <- paste(required_data$Date, required_data$Time)
required_data$Datetime <- as.POSIXct(dateWithTime)


#converts Global Sub_metering 1-3 to numeric data type
required_data$Sub_metering_1 <- as.numeric(required_data$Sub_metering_1)
required_data$Sub_metering_2 <- as.numeric(required_data$Sub_metering_2)
required_data$Sub_metering_3 <- as.numeric(required_data$Sub_metering_3)

#plots histogram and legend
with(required_data, plot(required_data$Datetime, required_data$Sub_metering_1 ,type = "l", xlab = "", ylab = "Energy sub metering"))
with(required_data, lines(required_data$Datetime, required_data$Sub_metering_2, col = "red"))
with(required_data, lines(required_data$Datetime, required_data$Sub_metering_3, col = "blue"))
legend("topright", lty =c(1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"))


#saves file
dev.copy(png, file = "plot3.png") 
dev.off()

