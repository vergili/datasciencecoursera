#
#R code for Week1 project  plot 2 


data <- read.csv("data/household_power_consumption.txt",sep=";",header=TRUE)


data2 = subset(data, as.Date(data$Date,format="%d/%m/%Y")=="2007-2-2" | 
                 as.Date(data$Date,format="%d/%m/%Y")=="2007-2-1")


k = as.POSIXlt(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

plot(k, as.numeric(as.character(data2$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width=480, height=480, units="px")
dev.off() 
