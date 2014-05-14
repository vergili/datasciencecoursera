
#Plot-1 R code
#===========================================================


data <- read.csv("data/household_power_consumption.txt",sep=";",header=TRUE)

data2 = subset(data, as.Date(data$Date,format="%d/%m/%Y")=="2007-2-2" | 
                 as.Date(data$Date,format="%d/%m/%Y")=="2007-2-1")

hist( as.numeric(as.character(data2$Global_active_power)),
      main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)")


dev.copy(png, file = "plot1.png", width=480, height=480, units="px")
dev.off() 

