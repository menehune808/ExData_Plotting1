


# load data
source('get_tidy_data.R')

startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))

# open device
png(filename='plot2.png',width=480,height=480,units='px')

# plot data
plot(df$Time,as.numeric(as.character(df$Global_active_power)),xlim=c(startDay, endDay),ylab='Global Active Power (kilowatts)', xlab='', type="l")

axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

# close device
dev.off()