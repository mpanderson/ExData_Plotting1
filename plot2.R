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

#time series plot of Global Active Power save as PNG
png("plot2.png", width=480,height=480)
with(dat,plot(dat$DayTime,dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()