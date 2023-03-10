#Plot 3

setwd("G:/Meu Drive/Documentos/Vida acadêmica/5) Doutorado/Disciplinas/coursera_analise_exploratoria/exdata_data_household_power_consumption")

data_total <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
					  
data1 <- subset(data_total, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data1$Date), data1$Time)

data1$Datetime <- as.POSIXct(datetime)

with(data1, {
  plot(Sub_metering_1~Datetime, col = "black", type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col= "red")
  lines(Sub_metering_3~Datetime,col="blue")
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	   
	   
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
