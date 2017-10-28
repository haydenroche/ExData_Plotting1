##Creating Dat Plot #3##
setwd("/Users/hroche/Coursera/Coursera")
filedata <- "household_power_consumption.txt"
raw_data <- read.table(filedata, header=T, sep=";", na.strings="?")
clean_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]
RightTime <-strptime(paste(clean_data$Date, clean_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
wrapped_up <- cbind(RightTime, clean_data)
createcolumns <- c("black", "red", "blue")

png("plot3.png", width = 480, height = 480)
Legend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(wrapped_up$RightTime, wrapped_up$Sub_metering_1, type="l", col=createcolumns[1], xlab="", ylab="Energy sub metering")
lines(wrapped_up$RightTime, wrapped_up$Sub_metering_2, col=createcolumns[2])
lines(wrapped_up$RightTime, wrapped_up$Sub_metering_3, col=createcolumns[3])
legend("topright", legend = Legend, col = createcolumns)
dev.off()