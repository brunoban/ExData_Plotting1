require(sqldf)
file <- c("./data/household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data_subset$datetime<-as.POSIXct(paste(data_subset$Date,data_subset$Time), format="%d/%m/%Y %H:%M:%S")
plot(data_subset$datetime, data_subset$Sub_metering_1, type="n", xlab="", ylab = "Energy sub Metering")
lines(data_subset$datetime, data_subset$Sub_metering_1, col="black", type="l", xlab="", ylab = "")
lines(data_subset$datetime, data_subset$Sub_metering_2, col="red", type="l", xlab="", ylab = "")
lines(data_subset$datetime, data_subset$Sub_metering_3, col="blue", type="l", xlab="", ylab = "")
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .75
)