library(readr)
library(dplyr)
library(lubridate)

### Setting Locale to English
Sys.setlocale("LC_TIME", "en_US.UTF-8")

### Read Data From File specifying col_types as character to prevent parsing failures
data <- readr::read_csv2("household_power_consumption.txt", 
                         col_types = "ctccccccc")

#### Calculate size of data.frame in memory
format(object.size(data), units = "Mb")

### Transform character column to numeric. `?` will be automatically replaced by NA
data <- data %>% 
  mutate(across(starts_with(c("Sub_metering", "Global", "Voltage")), as.numeric))

#### Change names of the data.frame to lower case
colnames(data) <- tolower(colnames(data))

#### Transform date into YYYY-MM-DD format using lubridate
#### Creating variable datetime combining data and time variables
data <- data %>% 
  mutate(date = lubridate::dmy(date)) %>% 
  mutate(datetime = lubridate::ymd_hms(paste(date, time)))

### Select data only for specific dates ( OR expression instead of %in% used because of better performance)
data <- data[data$date == "2007-02-02" | data$date == "2007-02-01", ]

