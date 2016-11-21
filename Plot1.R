library(data.table)

rm(list=ls())

setwd("C:\\Users\\Richard\\Desktop\\Coursera\\Course - Exploratory Data Analysis\\Project 1")

df = fread("./household_power_consumption/household_power_consumption.txt", sep=";",header=TRUE)
head(df)
str(df)

subset=df[df$Date %in% c("1/2/2007", "2/2/2007"),]
head(subset)

subset$Global_active_power=as.numeric(subset$Global_active_power)

png(filename = "Plot1.png", width=480, height=480)
with(subset, hist(Global_active_power, main = "Global Active Power",
                  xlab="Global Active Power (kilowatts)",
                  ylab="Frequency", col="red"))
dev.off()

