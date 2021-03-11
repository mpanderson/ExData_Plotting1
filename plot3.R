
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
dat$DayTime

#time series plots of Sub metering overlay submeters 1,2, and 3
png("plot3.png", width=480,height=480)
with(dat,plot(dat$DayTime,dat$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
lines(dat$DayTime,dat$Sub_metering_2,type="l", col="red")
lines(dat$DayTime,dat$Sub_metering_3,type="l", col="blue")
names<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",names,lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
