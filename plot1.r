##read the data
colN <- read.csv("household_power_consumption.txt",header=FALSE, sep=";", nrow=1,stringsAsFactors=FALSE)
colC <- rep("numeric",7)
dat <- read.csv("household_power_consumption.txt",header=FALSE, sep=";", skip=66637,nrow=2880,stringsAsFactors=FALSE,na.strings="?")
apply(dat,2,class)
colnames(dat)<-colN
dim(dat)
head(dat)
tail(dat)

##set the data types
dat$Date<-strptime(dat$Date, "%d/%m/%Y")
#dat$Time<-strptime(dat$Time, "%H:%M:%S")
dat[,3:6]<-apply(dat[,3:6],2,as.numeric)
dat[,7:9]<-apply(dat[,7:9],2,as.integer)
##plot the data
png("Plot1.png", width=480, height=480, units="px")
hist(dat$Global_active_power,col="red",main="Global active power", xlab = "Global active power (kolowatts)")
dev.off()