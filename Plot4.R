library(data.table)

rm(list=ls())

setwd("C:\\Users\\Richard\\Desktop\\Coursera\\Course - Exploratory Data Analysis\\Project 1")

df = fread("./household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE)
head(df)
str(df)

subset=df[df$Date %in% c("1/2/2007", "2/2/2007"),]

x<-paste(subset$Date, subset$Time)
DateTime=strptime(x, "%d/%m/%Y %H:%M:%S")

#Top left chart
subset$Global_active_power=as.numeric(subset$Global_active_power)

#Top right chart
subset$Voltage=as.numeric(subset$Voltage)

#Bottom Left Chart
subset$Sub_metering_1=as.numeric(subset$Sub_metering_1)
subset$Sub_metering_2=as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3=as.numeric(subset$Sub_metering_3)

#Bottom Right Chart
subset$Global_reactive_power=as.numeric(subset$Global_reactive_power)


png(filename = "Plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#Top left chart
plot(DateTime,subset$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

#Top right chart
plot(DateTime,subset$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

#Bottom Left Chart
plot(DateTime,subset$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")

lines(DateTime,subset$Sub_metering_3, type="l", xlab="",
      ylab="Energy sub metering", col="blue")

lines(DateTime,subset$Sub_metering_2, type="l", xlab="",
      ylab="Energy sub metering", col="red")

#legend
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       bty="n", cex=0.8)

#Bottom Right Chart
plot(DateTime,subset$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")


dev.off()

