#read in data
dat<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
#Format the date variable
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
#combine date and time variables and format to be POSIXlt
dat$DayTime<-as.POSIXlt(paste(dat$Date,dat$Time))
#select only Feb 1 and 2 of 2007
dat<-dat[which(dat$Date=="2007-02-01"|dat$Date=="2007-02-02"),]
#have a look at the varaible names
names(dat)

#plot histogram of Global Active Power (kw) save as PNG
png("plot1.png", width=480,height=480)
hist(as.numeric(dat$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
