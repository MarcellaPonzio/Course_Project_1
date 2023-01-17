#Plot 1

setwd("G:/Meu Drive/Documentos/Vida acad�mica/5) Doutorado/Disciplinas/coursera_analise_exploratoria/exdata_data_household_power_consumption")

data_total <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
					  
data1 <- subset(data_total, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
	 
png("plot1.png", width=480, height=480)

dev.off()
