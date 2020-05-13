#Nombre: plot3

# Downloading data and library
library(lubridate)
setwd("C:/Users/lezam/Desktop/COURSERA/04_EXPLORATORY_DATA_ANALYSIS/SEMANA1/11_PROJECT_1")
if(!file.exists("./data")){dir.create("./data")}
pathFiles<-unzip("./data/exdata_data_household_power_consumption.zip",list=TRUE)[,1]
file_store <- unz("./data/exdata_data_household_power_consumption.zip", pathFiles)
data <- read.table(file_store, head = TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")
data$DateAndTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 3

plot(data$DateAndTime,
     data$Sub_metering_1, 
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
points(data$DateAndTime, data$Sub_metering_1, col = "black", type = "l")
points(data$DateAndTime, data$Sub_metering_2, col = "red", type = "l")
points(data$DateAndTime, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       cex = 0.35)

# Saving

dev.copy(png, file = "plot3.png",width = 800, height = 600) 
dev.off() 
