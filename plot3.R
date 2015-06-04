## Exploratory Data Analysis
## Project 1,  Question 3

## Set working directory
setwd("C:/Users/gpoirie4/Dropbox/Ex-Data-Analysis")

##read raw data, replacing missing data ("?") with NA
raw_data <- read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")


## Extract date strings convert to Date objects and replace dates strings in raw data files
dates <- raw_data$Date
dates2 <- as.Date(dates,"%d/%m/%Y")
raw_data$Date <- dates2



## Extract required range from  raw data using subset()
startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")
powerdata <- subset(raw_data,Date >= startdate & Date <= enddate, na.rm=True)



## combine date and time fields into a datetime object and use to replace date field in data file
dates <- powerdata$Date
times <- powerdata$Time
datetime <- paste(dates,times)
dateobjs <- strptime(datetime,"%Y-%m-%d %H:%M:%S")
powerdata$Date <- dateobjs

## create plot
plot(powerdata$Date, powerdata$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "")
points(powerdata$Date, powerdata$Sub_metering_2, type = "l" ,col = "red")
points(powerdata$Date, powerdata$Sub_metering_3, type = "l", col = "blue")

## Create legend
legendtext  = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legcol = c("black","red", "blue")
legend("topright", legend = legendtext, lty = 1, col = legcol)