

#############################################
# plot4.R
#
#############################################

# load data
source('get_tidy_data.R')

# open device
png(filename='plot4.png',width=480,height=480,units='px')

# partition plotting area
par(mfrow=c(2,2))

# plot to top left (Global Active Power vs Time)
plot(df$Time,as.numeric(as.character(df$Global_active_power)),ylab='Global Active Power',xlab='',type='l')

# plot to top right (Voltage vs Time)
plot(df$Time,as.numeric(as.character(df$Voltage)),xlab='datetime',ylab='Voltage',type='l')

# plot to bottom left (Energy Sub Metering vs Time)
lncol<-c('black','red','blue')

lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')

plot(df$Time,as.numeric(as.character(df$Sub_metering_1)),type='l',col=lncol[1],xlab='',ylab='Energy sub metering')

lines(df$Time,as.numeric(as.character(df$Sub_metering_2)),col=lncol[2])

lines(df$Time,as.numeric(as.character(df$Sub_metering_3)),col=lncol[3])

# plot to bottom right (Global Reactive Power vs Time)
plot(df$Time,as.numeric(as.character(df$Global_reactive_power)),xlab='datetime',ylab='Global_reactive_power',type='l')

# close device
dev.off()