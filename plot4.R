power_consumption_7 <- mutate(power_consumption_6, voltage = as.numeric(as.character(Voltage)), 
                              global_reactive_power = as.numeric(as.character(Global_reactive_power)))
png(file="plot4.png",width=480, height=480)
##
## set up the panels
##
par(mfcol = c(2,2))
##
## create the first plot
##
with(power_consumption_7, {
    plot(Date_Time,active_power,ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")
##
## create the second plot
##
    plot(Date_Time,sub_meter_1,ylab = "Energy sub metering", type = "l", xlab = "", col = "black", frame.plot = TRUE,
                              ylim = c(0,38), xlim = c(ymd_hms("2007-02-01 00:00:00"),ymd_hms("2007-02-03 00:00:00")))
    lines(Date_Time,sub_meter_2, col = "red")
    lines(Date_Time,sub_meter_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
## 
## create the third plot
##
    plot(Date_Time,voltage,ylab = "Voltage", type = "l", xlab = "datetime",
                              ylim = c(233,247), xlim = c(ymd_hms("2007-02-01 00:00:00"),ymd_hms("2007-02-03 00:00:00")))
##
## create the fourth plot
##
     plot(Date_Time,global_reactive_power,ylab = "Global_reactive_power", type = "l", xlab = "datetime",
                              ylim = c(0.0,0.5), xlim = c(ymd_hms("2007-02-01 00:00:00"),ymd_hms("2007-02-03 00:00:00")))
    })
dev.off()