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

## plot 4 - four graphs as a PNG
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

## top left - codes borrowed from plot 2
with(train_data, plot(x = Time, y = Global_active_power,
			type = "l",
			xlab = "",
			ylab = "Global Active Power"))

## top right - new graph
with(train_data, plot(x = Time, y = Voltage,
			type = "l",
			xlab = "datetime",
			ylab = "Voltage"))

## bottom left - borrowed from plot 3
with(train_data, plot(x = Time, y = Sub_metering_1,
			type = "l",
			xlab = "",
			ylab = "Energy sub metering",
			col = "darkgreen"))
with(train_data, lines(x = Time, y = Sub_metering_2,			
			col = "red"))
with(train_data, lines(x = Time, y = Sub_metering_3,			
			col = "blue"))
legend("topright", lty = 1, bty = "n",
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col = c("darkgreen", "red", "blue"))

## bottom right - new graph
with(train_data, plot(x = Time, y = Global_reactive_power,
			type = "l",
			xlab = "datetime",
			ylab = "Global_reactive_power",
			ylim = c(0, 0.5)))

dev.off()