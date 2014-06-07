## Plot2

householdp <-read.table("household_power_consumption.txt",sep=";",header=TRUE,
					colClasses = c('character', 'character', 'numeric', 'numeric',
								'numeric', 'numeric','numeric', 'numeric', 'numeric'),
								na.strings = '?')
## Extract the two specific dates
householdp<-householdp[householdp$Date %in% c("1/2/2007","2/2/2007"),]

## Convert caracter into Date 
householdp$Datetime<-strptime(paste(householdp$Date,householdp$Time),"%d/%m/%Y %H:%M:%S")

## Create graphic
png("plot2.png", height=480, width=480)

plot(householdp$Datetime, householdp$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
