library(sqldf)

household_data <- read.csv.sql("C:\\Users\\ASHISH BAVALIYA\\Desktop\\Coursera\\household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

household_data$DateTime <- paste(household_data$Date, household_data$Time)

household_data$DateTime <- strptime(household_data$DateTime, format = "%Y-%m-%d %H:%M:%S")

household_data$dow <- weekdays(household_data$DateTime)

household_data$dow <- substr(household_data$dow, 1, 3)

png("plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfrow = c(2,2))

with(household_data, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))

with(household_data, plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))

with(household_data, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))

with(household_data, points(DateTime, Sub_metering_2, type = "l", col = "red"))

with(household_data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, cex = 1, xjust = 1, box.col = "transparent")

with(household_data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()
