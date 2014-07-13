## Week 1 | Course Project 1 | Data Exploration
## June 8, 2014

setwd("~/Documents/Coursera/Data_Exploration/Week1/Project1/Final")

lines <- grep("^[1-2]/2/2007", readLines("./household_power_consumption.txt"))

Power_Dataframe = read.table("./household_power_consumption.txt", sep = ";", 
                             skip = min(lines)-1, nrows = length(lines), na.strings = "?",
                             col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
)

Power_Dataframe$TimeStamp = strptime(paste(Power_Dataframe$Date,Power_Dataframe$Time,sep =" "),
                                     format = "%d/%m/%Y %H:%M:%S"
)

png(file = "./plot4.png")

par(mfrow = c(2,2), mar = c(2,3,2,2))

plot(Power_Dataframe$TimeStamp, Power_Dataframe$Global_active_power, type = "l",  lwd = 1,
     xlab = "", ylab = "", main = ""
)
mtext("Global Active Power", side = 2, line = 2.2, cex = 0.7)

plot(Power_Dataframe$TimeStamp, Power_Dataframe$Voltage, type = "l",  lwd = 1,
     xlab = "", ylab = "", main = ""
)
mtext("Voltage", side = 2, line = 2.2, cex = 0.7)
mtext("datetime", side = 1, line = 2.2, cex = 0.7)

plot(Power_Dataframe$TimeStamp, Power_Dataframe$Sub_metering_1, type = "l",  lwd = 1,
     xlab = "", ylab = "", main = ""
)
mtext("Energy sub metering", side = 2, line = 2.2, cex = 0.7)

lines(Power_Dataframe$TimeStamp, Power_Dataframe$Sub_metering_2, type = "l", lwd = 1, col = "red")
lines(Power_Dataframe$TimeStamp, Power_Dataframe$Sub_metering_3, type = "l", lwd = 1, col = "blue")

Legend_Text = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend = Legend_Text, cex = 0.5, col = c("black","red","blue"), lwd = 2, bty = "n")

plot(Power_Dataframe$TimeStamp, Power_Dataframe$Global_reactive_power, type = "l",  lwd = 1,
     xlab = "", ylab = "", main = ""
)
mtext("datetime", side = 1, line = 2.2, cex = 0.7)
mtext("Global_reactive_power", side = 2, line = 2.2, cex = 0.7)

dev.off()