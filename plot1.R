
plot1 <- function(){
	
	# load data (reading only the first 70,000 rows since dates 2007-02-01 and 2007-02-02 are within those)
	data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",nrows=70000)
	
	# subset data
	d <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
	
	# open png device
	png(file="plot1.png", width=480, height=480, units="px", bg="white")
	
	# plot histogram
	hist(d$Global_active_power, 
		col="red", 
		xlab="Global Active Power (kilowatts)", 
		main="Global Active Power")
	
	# close png devive
	dev.off()
	
}