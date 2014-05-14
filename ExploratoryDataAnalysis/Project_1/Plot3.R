#
#R code for Week1 project  plot 3


data <- read.csv("data/household_power_consumption.txt",sep=";",header=TRUE)


data2 = subset(data, as.Date(data$Date,format="%d/%m/%Y")=="2007-02-02" | 
                 as.Date(data$Date,format="%d/%m/%Y")=="2007-02-01")


k = as.POSIXlt(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

with(data2, plot(k, as.numeric(as.character(data2$Sub_metering_1)) , type="l", col="black",
                 ylab="Energy Sub Metering", xlab=""))
with(data2, points(k, as.numeric(as.character(data2$Sub_metering_2)) , type="l", col="red"))
with(data2, points(k, as.numeric(as.character(data2$Sub_metering_3)) , type="l", col="blue"))

legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub Metering 1", 
                  "Sub Metering 2","Sub Metering 3"),cex=0.7)

dev.copy(png, file = "plot3.png", width=480, height=480, units="px")
dev.off() 


