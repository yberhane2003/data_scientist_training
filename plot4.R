#after downloading and extracting data file read it in R
hp_consumption <- read.csv("C:/coursera/temp/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

# check class of Date and Time variable
class(hp_consumption$Date) #Factor
class(hp_consumption$Time) #Factor

head (hp_consumption)
#make copy of datset
hp_consumption4 <- hp_consumption

#create new DateTime variable of class POSIXct by combining Date and Time variables 
hp_consumption4$DateTime <- as.POSIXct(paste(hp_consumption4$Date, hp_consumption4$Time), format="%d/%m/%Y %H:%M:%S")
class(hp_consumption4$DateTime)
#[1] "POSIXct" "POSIXt"

head (hp_consumption4)
#subsetdataset to date between 2007-02-01 and 2007-02-02
hp_2daysconsumption <-subset(hp_consumption4, DateTime >= as.POSIXct('2007-02-01 00:00:00')) 
hp_2daysconsumption <-subset(hp_2daysconsumption, DateTime <= as.POSIXct('2007-02-02 23:59:59')) 

tail(hp_2daysconsumption)

#check class of variables
str(hp_2daysconsumption)


#change Global_active_power from factor to numeric
hp_2daysconsumption$Global_active_power <- as.numeric(as.character(hp_2daysconsumption$Global_active_power))

#change Sub_metering_1 from factor to numeric 
hp_2daysconsumption$Sub_metering_1 <- as.numeric(as.character(hp_2daysconsumption$Sub_metering_1))

#change Sub_metering_2 from factor to numeric 
hp_2daysconsumption$Sub_metering_2 <- as.numeric(as.character(hp_2daysconsumption$Sub_metering_2))

#change Sub_metering_3 from factor to numeric 
hp_2daysconsumption$Sub_metering_3 <- as.numeric(as.character(hp_2daysconsumption$Sub_metering_3))

#change voltage from factor to numeric 
hp_2daysconsumption$Voltage <- as.numeric(as.character(hp_2daysconsumption$Voltage))

#change Global_reactive_power from factor to numeric
hp_2daysconsumption$Global_reactive_power <- as.numeric(as.character(hp_2daysconsumption$Global_reactive_power))

#plot4
par(mfrow = c(2,2))
plot (hp_2daysconsumption$DateTime,hp_2daysconsumption$Global_active_power,type="o", pch = '',xlab="",ylab="Global Active Power")

plot(hp_2daysconsumption$DateTime, hp_2daysconsumption$Voltage, type="o", pch = '',xlab="datetime",ylab="Voltage")

plot (hp_2daysconsumption$DateTime, hp_2daysconsumption$Sub_metering_1,type="o", col="grey", pch = '',xlab="",ylab="Energy sub metering")
lines (hp_2daysconsumption$DateTime, hp_2daysconsumption$Sub_metering_2,type="o", col="red", pch = '')
lines (hp_2daysconsumption$DateTime, hp_2daysconsumption$Sub_metering_3,type="o", col="blue", pch = '')
legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('grey','red','blue'), lty=1,lwd=1.5, bty = "n", xjust=0) 

plot (hp_2daysconsumption$DateTime,hp_2daysconsumption$Global_reactive_power,type="o", pch = '',xlab="datetime",ylab="Global_reactive_power")

#export plot to file of type png
dev.copy(png, file = "C:/coursera/data_scientist_training/figure/Plot4.png", width = 480, height = 480) 
dev.off()