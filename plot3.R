

# load data
source('get_tidy_data.R')

# open 
png(filename='plot3.png',width=480,height=480,units='px')

# plot data
linecol<-c('black','red','blue')

labls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')

plot(df$Time,as.numeric(as.character(df$Sub_metering_1)),type='l',col=linecol[1],xlab='',ylab='Energy sub metering')

lines(df$Time,as.numeric(as.character(df$Sub_metering_2)),col=linecol[2])

lines(df$Time,as.numeric(as.character(df$Sub_metering_3)),col=linecol[3])

# legend
legend('topright',legend=labls,col=linecol,lty='solid')

# close device
dev.off()