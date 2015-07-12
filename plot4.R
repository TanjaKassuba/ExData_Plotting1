
plot4 <- function(){
	
	# load data (reading only the first 70,000 rows since dates 2007-02-01 and 2007-02-02 are within those)
	data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",nrows=70000)
		
	# subset data
	d <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
	
	# open png device
	png(file="plot4.png", width=480, height=480, units="px", bg="white")
	
	# prepare outline of figue
	par(mfrow = c(2, 2))
	xpositions <- c(0, which(d$Date=="2/2/2007"&d$Time=="00:00:00"), nrow(d)) # xtick positions
	
	
	### plot top left
	plot(d$Global_active_power,
		type="l",
		ylab="Global Active Power",
		xlab="",xaxt="n")
	axis(side=1, at=xpositions, labels=c("Thu","Fri","Sat"))
	
	
	### plot top right
	plot(d$Voltage,
		type="l",
		ylab="Voltage",
		xlab="datetime",xaxt="n")
	axis(side=1, at=xpositions, labels=c("Thu","Fri","Sat"))
	
	
	### plot bottom left
	
	# plot Sub_metering_1
	plot(d$Sub_metering_1,
		type="l",
		ylim=c(0,38),
		ylab="Energy sub metering",
		xlab="",xaxt="n")
		
	# add Sub_metering_2
	par(new=TRUE)
	
	plot(d$Sub_metering_2,
		type="l",col="red",
		ylim=c(0,38),
		ylab="",xlab="",axes=FALSE)
	
	# add Sub_metering_3	
	par(new=TRUE)
	
	plot(d$Sub_metering_3,
		type="l",col="blue",
		ylim=c(0,38),
		ylab="",xlab="",axes=FALSE)
	
	# add xticks/labels
	axis(side=1, at=xpositions, labels=c("Thu","Fri","Sat"))
	
	# add legend	
	legend("topright",lty=c(1,1),col=c("black","red","blue"),bty="n",
			legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	
	
	### plot bottom right
	plot(d$Global_reactive_power,
		type="l",
		ylab="Global_reactive_power",
		xlab="datetime",xaxt="n")
	axis(side=1, at=xpositions, labels=c("Thu","Fri","Sat"))
	
	
	# close png device
	dev.off()
	
}