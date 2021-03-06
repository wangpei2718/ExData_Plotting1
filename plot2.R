setwd("C:\\Users\\����\\Documents\\����\\coursera\\ex\\exdata-data-household_power_consumption")
x<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
x$Date<-as.Date(as.character(x$Date),format="%d/%m/%Y")
y<-subset(x,x$Date=="2007-02-01")
z<-subset(x,x$Date=="2007-02-02")
m<-rbind(y,z)
m$date_time<-as.POSIXct(paste(m$Date,as.character(m$Time)))
m$Global_active_power<-as.numeric(levels(m$Global_active_power))[m$Global_active_power]
m$Global_reactive_power<-as.numeric(levels(m$Global_reactive_power))[m$Global_reactive_power]

m$Voltage<-as.numeric(levels(m$Voltage))[m$Voltage]
m$Sub_metering_1<-as.numeric(levels(m$Sub_metering_1))[m$Sub_metering_1]
m$Sub_metering_2<-as.numeric(levels(m$Sub_metering_2))[m$Sub_metering_2]

png(filename="plot2.png",width=480,height=480,units="px")
windows()
plot(m$date_time,m$Global_active_power,xlab="",ylab="Global active power(Kilowatts)",type="l",lty=1,
    )

dev.off()