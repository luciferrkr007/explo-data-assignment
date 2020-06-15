
##reading the file
 datafile <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, comment.char = "", quote = '\"')
datafile1 <- subset( datafile, Date %in% c("1/2/2007", "2/2/2007"))
datafile1$Date <- as.Date(datafile1$Date, format = "%d/%m/%y")
datetime <- paste(as.Date(datafile1$Date), datafile1$Time)
datafile1$Datatime <- as.POSIXct(datetime)

## graph2
png("plot2.png", width = 480, height = 480)
with(datafile1, plot(Global_active_power ~ Datatime, type = "l", ylab = "Global Active Power (kilowats)", xlab = "" ))
dev.off()