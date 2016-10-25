setwd("D:/AAnalytics/Coursera/Data Science - Johns Hopkins/EDA/Week1")
library(dplyr)
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


# Plot 1
hist(hpc_new$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
              ylab="Frequency", col="Red")

# Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()