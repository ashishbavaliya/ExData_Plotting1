library(sqldf)

household_data <- read.csv.sql("C:\\Users\\ASHISH BAVALIYA\\Desktop\\Coursera\\household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")

household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

household_data$DateTime <- paste(household_data$Date, household_data$Time)

household_data$DateTime <- strptime(household_data$DateTime, format = "%Y-%m-%d %H:%M:%S")

household_data$dow <- weekdays(household_data$DateTime)

with(household_data, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",col = "red", main = "Global Active Power"))

dev.copy(png, file = "plot1.png")

dev.off()
