##PLOT 3

#Read table
hpc <- read.table("household_power_consumption.txt", 
                  header=TRUE, sep=";", na.strings='?', check.names=FALSE, stringsAsFactors=F, comment.char="", quote='\"')
#Format date
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#Subset data
hpc_new <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Date conversion
datetime <- paste(as.Date(hpc_new$Date), hpc_new$Time)
hpc_new$Datetime <- as.POSIXct(datetime)

#Plot 3
with(hpc_new, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()