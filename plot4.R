### source read_data.R file to load the data into environment
source("read_data.R")

###Setting background to transparent
par(bg = "transparent")

#### Create Plot4
par(mfrow = c(2, 2))

with(data, hist(global_active_power, 
                main = NULL,
                xlab = "Global Active Power (kilowatts)",
                col = "red"))

with(data, plot(datetime, 
                voltage, 
                type = "l",
                xlab = "datetime",
                ylab = "Voltage"))

with(data, plot(datetime, 
                sub_metering_1, 
                type = "l",
                xlab = "",
                col = "black",
))
with(data, lines(datetime, sub_metering_2, col = "red"))
with(data, lines(datetime, sub_metering_3, col = "blue"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       bty = "n",
       xjust = 0, 
       yjust = 0,
       col = c("black", "red", "blue"))

with(data, plot(datetime, 
                global_reactive_power, 
                type = "l",
                xlab = "datetime",
                ylab = "Global_reactive_power"))
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
