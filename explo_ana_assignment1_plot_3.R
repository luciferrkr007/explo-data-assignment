##reading the file
 datafile <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, comment.char = "", quote = '\"')
datafile1 <- subset( datafile, Date %in% c("1/2/2007", "2/2/2007"))
datafile1$Date <- as.Date(datafile1$Date, format = "%d/%m/%y")
datetime <- paste(as.Date(datafile1$Date), datafile1$Time)
datafile1$Datatime <- as.POSIXct(datetime)

## graph3
 png( "plot3.png", width = 480, height = 480)
with(datafile1, {
  plot(Sub_metering_1~Datatime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datatime,col='Red')
  lines(Sub_metering_3~Datatime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()