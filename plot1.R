plot1 <- function()
{
  epc_table <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
  epc_table[,1] <- as.Date(epc_table[,1],format="%d/%m/%Y")
  epc_table_subset <- with(epc_table, epc_table[(Date >= "2007-02-01" & Date <= "2007-02-02"), ])
  epc_table_subset["datetime"] <- NA
  epc_table_subset$datetime <- strptime(paste(epc_table_subset$Date, epc_table_subset$Time), "%Y-%m-%d %H:%M:%S", tz = "EST5EDT")
  
  png(file="plot1.png", width=480, height=480)
  plot(as.numeric(epc_table_subset$Global_active_power), type="n")
  hist(as.numeric(epc_table_subset$Global_active_power), freq=TRUE, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
  
}








