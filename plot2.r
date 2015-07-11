#Reads in file
input <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";", na.strings="?")

#Subsets the data for the given time frame
required_data <- subset(input, input$Date == "1/2/2007" | input$Date == "2/2/2007")

#converts date and time columns to a dateTime column
required_data$Date <- as.Date(required_data$Date, format = "%d/%m/%Y")
required_data$Weekday <- weekdays(required_data$Date, abbreviate = TRUE)

dateWithTime <- paste(required_data$Date, required_data$Time)
required_data$Datetime <- as.POSIXct(dateWithTime)


#converts Global Active Power to numeric data type
required_data$Global_active_power <- as.numeric(required_data$Global_active_power)
 
#plots histogram

plot(required_data$Datetime, required_data$Global_active_power, type = "l", ylab =  "Global Active Power (kilowatts)" , xlab = "")
 
#saves file
dev.copy(png, file = "plot2.png") 
dev.off()

