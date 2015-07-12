
plot2 <- function(){
	
	# load data (reading only the first 70,000 rows since dates 2007-02-01 and 2007-02-02 are within those)
	data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",nrows=70000)
		
	# subset data
	d <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
	
	# open png device
	png(file="plot2.png", width=480, height=480, units="px", bg="white")
	
	# create plot
	plot(d$Global_active_power,
		type="l",
		ylab="Global Active Power (kilowatts)",
		xlab="",xaxt="n")
	
	# add xticks/labels
	axis(side=1,
		at=c(0, which(d$Date=="2/2/2007"&d$Time=="00:00:00"), nrow(d)),
		labels=c("Thu","Fri","Sat"))
	
	# close png device
	dev.off()
	
}