### source read_data.R file to load the data into environment
source("read_data.R")

###Setting background to transparent
par(bg = "transparent")

#### Create Plot3
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
       col = c("black", "red", "blue"))
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
