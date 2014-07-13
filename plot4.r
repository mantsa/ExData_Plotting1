##read the data
colN <- read.csv("household_power_consumption.txt",header=FALSE, sep=";", nrow=1,stringsAsFactors=FALSE)
colC <- rep("numeric",7)
dat <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
##alternative to read the data
#dat <- read.csv("household_power_consumption.txt",header=FALSE, sep=";", skip=66637,nrow=2880,stringsAsFactors=FALSE,na.strings="?")
apply(dat,2,class)
colnames(dat)<-colN
dim(dat)
head(dat)
tail(dat)

##set the data types
dat$datetime<-strptime(paste(dat$Date,dat$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
#dat$Time<-strptime(dat$Time, "%H:%M:%S")
dat[,3:6]<-apply(dat[,3:6],2,as.numeric)
dat[,7:9]<-apply(dat[,7:9],2,as.integer)
##plot the data
png("Plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
##top left plot
plot(dat$datetime,dat$Global_active_power,type="l",xlab="",ylab="Global active Power (kilowatts)")
##top right plot
plot(dat$datetime,dat$Voltage,type="l",xlab="datetime",ylab="Voltage")
##bottom left plot
plot(dat$datetime,dat$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dat$datetime,dat$Sub_metering_2,col="red")
lines(dat$datetime,dat$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##botom right plot
plot(dat$datetime,dat$Global_reactive_power,type="l",xlab="datetime",ylab="Global reactive Power (kilowatts)")
dev.off()	