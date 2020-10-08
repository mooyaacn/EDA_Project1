#Exploratory Data Analysis
household_power_consumption <- read.csv("~/Desktop/Statistics & Measurement/Data Science/household_power_consumption.txt", sep=";")
View(household_power_consumption)
install.packages("tidyverse")
library(tidyverse)
summary(household_power_consumption$Date)
household_power_consumption$Date<-as.Date(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption$Global_active_power<-as.numeric(household_power_consumption$Global_active_power)
household_power_consumption$Global_reactive_power<-as.numeric(household_power_consumption$Global_reactive_power)
household_power_consumption$Sub_metering_1<-as.numeric(household_power_consumption$Sub_metering_1)
household_power_consumption$Sub_metering_2<-as.numeric(household_power_consumption$Sub_metering_2)
household_power_consumption$Voltage<-as.numeric(household_power_consumption$Voltage)
hpt.2days<-household_power_consumption %>%
  filter(Date=="2007-02-01"|
           Date=="2007-02-02") 
View(hpt.2days)
hpt.2days$datetime<-strptime(paste(hpt.2days$Date, hpt.2days$Time), "%Y-%m-%d %H:%M:%S")
#plot4
png(filename="~/Desktop/Statistics & Measurement/Data Science/Plot4.png")
par(mfrow=c(2,2))
dt.gap<-plot(x=hpt.2days$datetime, y=hpt.2days$Global_active_power,
             xlab="",
             ylab="Global Activie Power(kilowatts)",  type="l")
dt.v<-plot(x=hpt.2days$datetime, y=hpt.2days$Voltage, type="l", 
           xlab="datetime",
           ylab="Voltage")
dt.sm<-plot(x=hpt.2days$datetime, y=hpt.2days$Sub_metering_1, type="l", 
            xlab="",
            ylab="Energy sub metering")
lines(x=hpt.2days$datetime, y=hpt.2days$Sub_metering_2, col="red")
lines(x=hpt.2days$datetime, y=hpt.2days$Sub_metering_3, col="blue")
dt.grp<-plot(x=hpt.2days$datetime, y=hpt.2days$Global_reactive_power, type="l", 
             xlab="datetime",
             ylab="Global_reactive_power")
dev.off()