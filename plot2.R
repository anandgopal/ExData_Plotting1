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

png(file = "./plot2.png")
plot(Power_Dataframe$TimeStamp, Power_Dataframe$Global_active_power, type = "l",  lwd = 2,
     xlab = "", ylab = "Global Active Power (kilowatts)", main = ""
)
dev.off()
