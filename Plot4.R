#Assumptions: 
#1. load data file "household_power_consumption.txt" in working directory directly 
t2. plot 4 graphs per the assignment  
df_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";") 
df_datafiltered <- df_data[df_data$Date == "1/2/2007"|df_data$Date == "2/2/2007",] # subset data for 1st and 2nd Feb 2007 
# create dt, a new datetime column for time series plotting. 
df_datafiltered$dt <- strptime(paste(as.character(df_datafiltered$Date), as.character(df_datafiltered$Time), sep=", "), format="%d/%m/%Y, %H:%M:%S") 
png("plot4.png", width=480, height=480) 
par(mfrow = c(2,2)) #initialize environment for plot 
with(df_datafiltered,{ 
  plot(dt, as.numeric(as.character(Global_active_power)),type="l", ylab = "Global Active Power", xlab="") 
  plot(dt, as.numeric(as.character(Voltage)),type="l", ylab = "Voltage", xlab="datetime") 
  plot(dt,as.numeric(as.character(Sub_metering_1)),type="l" , ylab = "Energy sub metering", xlab="") 
  lines(dt,as.numeric(as.character(Sub_metering_2)), col="red" ) 
  lines(dt,as.numeric(as.character(Sub_metering_3)), col="blue" ) 
  legend("topright", bty="n", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
  plot(dt, as.numeric(as.character(Global_reactive_power)),type="l", ylab = "Global_reactive_power", xlab="datetime") 
}) 
dev.off() 
