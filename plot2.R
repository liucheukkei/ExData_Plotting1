## Set the working directory
setwd("C:/Users/kayl/Desktop/Data exploratory analysis/Project 1")

## Read in the txt file into dataframe
data = read.table("household_power_consumption.txt",
			header = T,
			na.strings = "?",
			sep = ";")

## Convert the time and date into time and date formats
data = transform(data,
		Date = as.Date(Date, "%d/%m/%Y"),
		Time = strptime(paste(as.character(Date), " ", as.character(Time)), "%d/%m/%Y %H:%M:%S"))

## Filter out only data from 2007-02-01 to 2007-02-02
train_data = data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

## plot 2 - line graph as a PNG
png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(train_data, plot(x = Time, y = Global_active_power,
			type = "l",
			xlab = "",
			ylab = "Global Active Power (kilowatts)"))

dev.off()
