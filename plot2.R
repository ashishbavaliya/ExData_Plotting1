library(sqldf)

household_data <- read.csv.sql("C:\\Users\\ASHISH BAVALIYA\\Desktop\\Coursera\\household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

household_data$DateTime <- paste(household_data$Date, household_data$Time)

household_data$DateTime <- strptime(household_data$DateTime, format = "%Y-%m-%d %H:%M:%S")

household_data$dow <- weekdays(household_data$DateTime)

household_data$dow <- substr(household_data$dow, 1, 3)

with(household_data, plot(DateTime, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")

dev.off()
