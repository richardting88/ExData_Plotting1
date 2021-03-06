library(data.table)

rm(list=ls())

setwd("C:\\Users\\Richard\\Desktop\\Coursera\\Course - Exploratory Data Analysis\\Project 1")

df = fread("./household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE)
head(df)
str(df)

subset=df[df$Date %in% c("1/2/2007", "2/2/2007"),]

x<-paste(subset$Date, subset$Time)
DateTime=strptime(x, "%d/%m/%Y %H:%M:%S")
day=weekdays(DateTime)

subset$Global_active_power=as.numeric(subset$Global_active_power)

png(filename = "Plot2.png", width=480, height=480)
plot(DateTime,subset$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()


