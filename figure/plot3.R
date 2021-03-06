data_all<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors = F, comment.char="", quote='\"')
## Reads the above mentioned data set
data1<- subset(data_all, Date%in% c("1/2/2007", "2/2/2007"))
## Subsets the data corresponding to the specified dates
data1$Date<- as.Date(data1$Date, format="%d/%m/%Y")
## Converts the dates into the specified format
datetime<- paste(as.Date(data1$Date), data1$Time)
## Pastes the Date and Time columns together
data1$Datetime<- as.POSIXct(datetime)
## Converts the data after pasting into POSIXct format
with(data1,{
  plot(Sub_metering_1~Datetime,type="l",
       ylab="Global Active Power (Kilowatt)", xlab="")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
})
## Creates the plot as mentioned above
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Creates a legend at topright corner
dev.copy(png, file="plot3.png", height=480, width=480)
## Copies the plot into a png file
dev.off()
## Closes the graphics device