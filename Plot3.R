library(data.table)

rm(list=ls())

setwd("C:\\Users\\Richard\\Desktop\\Coursera\\Course - Exploratory Data Analysis\\Project 1")

df = fread("./household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE)
head(df)
str(df)

subset=df[df$Date %in% c("1/2/2007", "2/2/2007"),]

x<-paste(subset$Date, subset$Time)
DateTime=strptime(x, "%d/%m/%Y %H:%M:%S")


subset$Sub_metering_1=as.numeric(subset$Sub_metering_1)
subset$Sub_metering_2=as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3=as.numeric(subset$Sub_metering_3)


png(filename = "Plot3.png", width=480, height=480)

plot(DateTime,subset$Sub_metering_1, type="l", xlab="",
      ylab="Energy sub metering")

lines(DateTime,subset$Sub_metering_3, type="l", xlab="",
      ylab="Energy sub metering", col="blue")

lines(DateTime,subset$Sub_metering_2, type="l", xlab="",
     ylab="Energy sub metering", col="red")

#legend you wen ti...
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=1)

dev.off()


