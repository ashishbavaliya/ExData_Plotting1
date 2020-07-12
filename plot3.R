library(sqldf)

household_data <- read.csv.sql("C:\\Users\\ASHISH BAVALIYA\\Desktop\\Coursera\\household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

household_data$DateTime <- paste(household_data$Date, household_data$Time)

household_data$DateTime <- strptime(household_data$DateTime, format = "%Y-%m-%d %H:%M:%S")

household_data$dow <- weekdays(household_data$DateTime)

household_data$dow <- substr(household_data$dow, 1, 3)

with(household_data, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

with(household_data, points(DateTime, Sub_metering_2, type = "l", col = "red"))

with(household_data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

dev.copy(png, file = "plot3.png")

dev.off()
