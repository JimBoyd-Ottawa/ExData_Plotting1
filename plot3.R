
power_consumption_6 <- mutate(power_consumption_5, sub_meter_1 = as.numeric(as.character(Sub_metering_1)), 
                               sub_meter_2 = as.numeric(as.character(Sub_metering_2)), 
                               sub_meter_3 = as.numeric(as.character(Sub_metering_3)))
png(file="plot3.png",width=480, height=480)
with(power_consumption_6,plot(Date_Time,sub_meter_1,ylab = "Energy sub metering", type = "l", xlab = "", col = "black", frame.plot = TRUE,
                  ylim = c(0,38), xlim = c(ymd_hms("2007-02-01 00:00:00"),ymd_hms("2007-02-03 00:00:00"))))
##                  , par(yaxp = c(0,30,4) )))
with(power_consumption_6,lines(Date_Time,sub_meter_2, col = "red"))
with(power_consumption_6,lines(Date_Time,sub_meter_3, col = "blue"))
##axis(1, tick = TRUE)
##axis(2,at= c(0,10,20,30))
##axis(3, tick = FALSE, labels = FALSE)
##axis(4, tick = FALSE, labels = FALSE)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
## axis(1)
dev.off()
