plot3 <- function()
{
  epc_table <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
  epc_table[,1] <- as.Date(epc_table[,1],format="%d/%m/%Y")
  epc_table_subset <- with(epc_table, epc_table[(Date >= "2007-02-01" & Date <= "2007-02-02"), ])
  epc_table_subset["datetime"] <- NA
  epc_table_subset$datetime <- strptime(paste(epc_table_subset$Date, epc_table_subset$Time), "%Y-%m-%d %H:%M:%S", tz = "EST5EDT")
  
  png(file="plot3.png", width=480, height=480)
  
  plot(epc_table_subset$datetime, epc_table_subset$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(epc_table_subset$datetime, epc_table_subset$Sub_metering_2, type="l", col="red")
  lines(epc_table_subset$datetime, epc_table_subset$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7, lty=1, col=c("black","red","blue"))
  dev.off()
}