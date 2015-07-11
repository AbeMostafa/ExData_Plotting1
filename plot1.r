
#Reads in file
input <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";", na.strings="?")

#Subsets the data for the given time frame
required_data <- subset(input, input$Date == "1/2/2007" | input$Date == "2/2/2007")

#converts data to date
required_data$Date <- as.Date(required_data$Date, format = "%d/%m/%Y")

#converts Global Active Power to numeric data type
required_data$Global_active_power <- as.numeric(required_data$Global_active_power)

#plots histogram
hist(required_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#saves file
dev.copy(png, file = "plot1.png") 
dev.off()
