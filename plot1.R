##Creating Dat Plot #1##
setwd("/Users/hroche/Coursera/Coursera")
filedata <- "household_power_consumption.txt"
raw_data <- read.table(filedata, header=T, sep=";", na.strings="?")
clean_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]
RightTime <-strptime(paste(clean_data$Date, clean_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
wrapped_up <- cbind(RightTime, clean_data)

png("plot1.png", width = 480, height = 480)
hist(wrapped_up$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
