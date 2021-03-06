powDat<-read.table("household_power_consumption.txt", header=T, sep=";")
day1<-subset(powDat, Date=="1/2/2007")
day2<-subset(powDat, Date=="2/2/2007")
plotDat<-rbind(day1,day2)
library(lubridate)
datetime<-dmy(as.vector(plotDat[,1]))+hms(as.vector(plotDat[,2]))
plotDat<-cbind(plotDat,datetime)
png('Plot4.png')
par(mfcol=c(2,2))
plot(plotDat$datetime,as.numeric(plotDat$Global_active_power)/500, type="n",xlab="",ylab="Global Active Power (Killowatts)")
lines(plotDat$datetime, as.numeric(plotDat$Global_active_power)/500,  lwd=1.5)
plot(plotDat$datetime,as.numeric(plotDat$Sub_metering_1), type="n",xlab="",ylab="Energy sub metering")
lines(plotDat$datetime, as.numeric(plotDat$Sub_metering_1))
lines(plotDat$datetime, as.numeric(plotDat$Sub_metering_2),  col="red")
lines(plotDat$datetime, as.numeric(plotDat$Sub_metering_3), col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))
plot(plotDat$datetime,plotDat$Voltage, type="n",xlab="datetime",ylab="Voltage")
lines(plotDat$datetime, plotDat$Voltage,  lwd=1.5)
plot(plotDat$datetime,plotDat$Global_reactive_power, type="n",xlab="datetime",ylab="Global_reactive_power")
lines(plotDat$datetime, plotDat$Global_reactive_power,  lwd=1.5)
dev.off()