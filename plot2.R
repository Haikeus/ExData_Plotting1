### source read_data.R file to load the data into environment
source("read_data.R")

###Setting background to transparent
par(bg = "transparent")

#### Create Plot2 
with(data, plot(datetime, 
                global_active_power, 
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)",
))
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
