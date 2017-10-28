##Creating Dat Plot 4##
setwd("/Users/hroche/Coursera/Coursera")
filedata <- "household_power_consumption.txt"
raw_data <- read.table(filedata, header=T, sep=";", na.strings="?")
clean_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]
RightTime <-strptime(paste(clean_data$Date, clean_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
wrapped_up <- cbind(RightTime, clean_data)
createcolumns <- c("black", "red", "blue")

png("plot4.png", width = 640, height = 640)
Legend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
par(mfrow=c(2,2))
plot(wrapped_up$RightTime, wrapped_up$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(wrapped_up$RightTime, wrapped_up$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(wrapped_up$RightTime, wrapped_up$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(wrapped_up$RightTime, wrapped_up$Sub_metering_2, type = "l", col = "red")
  lines(wrapped_up$RightTime, wrapped_up$Sub_metering_3, type = "l", col = "blue")
plot(wrapped_up$RightTime, wrapped_up$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")  
dev.off()