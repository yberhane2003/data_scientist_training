#after downloading and extracting data file read it in R
hp_consumption <- read.csv("C:/coursera/temp/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")

# check class of Date and Time variable
class(hp_consumption$Date) #Factor
class(hp_consumption$Time) #Factor

#check data
head (hp_consumption)

#make copy of datset
hp_consumption2 <- hp_consumption

#create new DateTime variable of class POSIXct by combining Date and Time variables 
hp_consumption2$DateTime <- as.POSIXct(paste(hp_consumption2$Date, hp_consumption2$Time), format="%d/%m/%Y %H:%M:%S")
class(hp_consumption2$DateTime)
#[1] "POSIXct" "POSIXt"

head (hp_consumption2)

#subset dataset to date between "2007-02-01" and "2007-02-02"
hp_2daysconsumption <-subset(hp_consumption2, DateTime >= as.POSIXct('2007-02-01 00:00:00')) 
hp_2daysconsumption <-subset(hp_2daysconsumption, DateTime <= as.POSIXct('2007-02-02 23:59:59')) 

tail(hp_2daysconsumption)

#check class of variables
str(hp_2daysconsumption)


#change Global_active_power from factor to numeric
hp_2daysconsumption$Global_active_power <- as.numeric(as.character(hp_2daysconsumption$Global_active_power))

#subset dataset to date between "2007-02-01" and "2007-02-02"
par(mfrow = c(1,1))
plot (hp_2daysconsumption$DateTime,hp_2daysconsumption$Global_active_power,type="o", pch = '',xlab="",ylab="Global Active Power(kilowatts)")

#export plot to file of type png
dev.copy(png, file = "C:/coursera/data_scientist_training/figure/Plot2.png", width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()