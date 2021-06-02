### source read_data.R file to load the data into environment
source("read_data.R")

###Setting background to transparent
par(bg = "transparent")

### Create Plot1 histogram
with(data, hist(global_active_power, 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)",
                col = "red"))
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
