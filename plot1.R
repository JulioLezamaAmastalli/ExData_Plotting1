# Nombre: plot1

# Downloading data
setwd("C:/Users/lezam/Desktop/COURSERA/04_EXPLORATORY_DATA_ANALYSIS/SEMANA1/11_PROJECT_1")
if(!file.exists("./data")){dir.create("./data")}
pathFiles<-unzip("./data/exdata_data_household_power_consumption.zip",list=TRUE)[,1]
file_store <- unz("./data/exdata_data_household_power_consumption.zip", pathFiles)
data <- read.table(file_store, head = TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

# Plot 1

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     col = "#FF3000")

# Saving

dev.copy(png, file = "plot1.png",width = 800, height = 600) 
dev.off() 
