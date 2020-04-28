myURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myURL,destfile = "Power_Consumption.zip")
unzip("Power_Consumption.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)
library(dplyr)
power_consumption <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
power_consumption_2 <- mutate(power_consumption, NewDate = as.Date(Date,"%d/%m/%Y"))
power_consumption_3 <- filter(power_consumption_2,(NewDate >= as.Date("2007-02-01","%Y-%m-%d") & (NewDate <= as.Date("2007-02-02","%Y-%m-%d"))))
power_consumption_4 <- mutate(power_consumption_3, active_power = as.numeric(as.character(Global_active_power)))
png(file="plot1.png",width=480, height=480)
hist(power_consumption_4$active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", 
     xlim = c(0,8), col = "red", ylim = c(0,1200), breaks = c(0,0.5,1.0,1.5,2.0,2.5,3.0,3.5,4,4.5,5.0,5.5, 6.0, 6.5, 7.0, 7.5, 8.0), axes = FALSE)
axis(1,at = c(0,2,4,6))
axis(2,at= c(0,200,400,600,800,1000,1200))
dev.off()