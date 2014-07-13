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
png("Plot2.png", width=480, height=480, units="px")
plot(dat$datetime,dat$Global_active_power,type="l",xlab="",ylab="Global active Power (kilowatts)")
dev.off()	