setwd("C:\\Users\\ฑฆมี\\Documents\\ณ๖น๚\\coursera\\ex\\exdata-data-household_power_consumption")
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

png(filename="plot3.png",width=480,height=480,units="px")
windows()
plot(m$date_time,m$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",lty=1)
lines(m$date_time,m$Sub_metering_2,type="l",lty=1,col="red")
lines(m$date_time,m$Sub_metering_3,type="l",lty=1,col="blue")

legend("topright",legend=c("sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1:1:1))

dev.off()
