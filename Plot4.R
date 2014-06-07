## Plot4

householdp <-read.table("household_power_consumption.txt",sep=";",header=TRUE,
					colClasses = c('character', 'character', 'numeric', 'numeric',
								'numeric', 'numeric','numeric', 'numeric', 'numeric'),
								na.strings = '?')
## Extract the two specific dates
householdp<-householdp[householdp$Date %in% c("1/2/2007","2/2/2007"),]

## Convert caracter into Date 
householdp$Datetime<-strptime(paste(householdp$Date,householdp$Time),"%d/%m/%Y %H:%M:%S")

## Create graphic

png("plot4.png", height=480, width=480)

par(mfrow=c(2,2))

## Graph 1

plot(householdp$Datetime, householdp$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Graph 2
plot(householdp$Datetime,householdp$Voltage, type="l", xlab="datetime",ylab="Voltage")

## Graph 3
plot(householdp$Datetime,householdp$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(householdp$Datetime,householdp$Sub_metering_2,col="red")
lines(householdp$Datetime,householdp$Sub_metering_3,col="blue")

## Insert the legend at the top left.
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Graph 4
plot(householdp$Datetime,householdp$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")



dev.off()
