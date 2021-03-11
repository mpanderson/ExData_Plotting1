
#read in data
dat<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
#Format the date variable
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
#select only Feb 1 and 2 of 2007
dat<-dat[which(dat$Date=="2007-02-01"|dat$Date=="2007-02-02"),]
#combine date and time variables and format to be POSIXlt
dat$DayTime<-as.POSIXlt(paste(dat$Date,dat$Time))

#have a look at the varaible names
names(dat)
dim(dat)
dat$DayTime

#4 time series plots in a 2x2 matrix 
png("plot4.png", width=480,height=480)
par(mfrow=c(2,2))
with(dat,plot(dat$DayTime,dat$Global_active_power,type="l",ylab="Global Active Power",xlab=""))
with(dat,plot(dat$DayTime,dat$Voltage,type="l",ylab="Voltage",xlab="datetime"))
with(dat,plot(dat$DayTime,dat$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
lines(dat$DayTime,dat$Sub_metering_2,type="l", col="red")
lines(dat$DayTime,dat$Sub_metering_3,type="l", col="blue")
names<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",names,lty=c(1,1,1),bty="n",col=c("black","red","blue"))
with(dat,plot(dat$DayTime,dat$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime"))
dev.off()
