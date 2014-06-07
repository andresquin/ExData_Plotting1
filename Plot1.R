## Plot1
## I will use colClasses to chnage from factor to numeric in readtable , It might work 
## also with fread

householdp <-read.table("household_power_consumption.txt",sep=";",header=TRUE,
					colClasses = c('character', 'character', 'numeric', 'numeric',
								'numeric', 'numeric','numeric', 'numeric', 'numeric'),
								na.strings = '?')

## Convert caracter into Date 
householdp$Date <- as.Date(householdp$Date, "%d/%m/%Y")

## Extract the two specific dates

householdp <-householdp[householdp$Date >= as.Date("2007-02-01") & householdp$Date<=as.Date("2007-02-02"), ]

## Create histogram

png("plot1.png", height=480, width=480)

hist(householdp$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()
