##Creating Dat Plot #2## 
setwd("/Users/hroche/Coursera/Coursera")
filedata <- "household_power_consumption.txt"
raw_data <- read.table(filedata, header=T, sep=";", na.strings="?")
clean_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]
RightTime <-strptime(paste(clean_data$Date, clean_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
 wrapped_up <- cbind(RightTime, clean_data)

png("plot2.png", width = 480, height = 480)
plot(wrapped_up$RightTime, wrapped_up$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

