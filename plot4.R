# 0. Read the data.

md <-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
md <- tidyr::separate(md, Date, into = c('day','month', 'year'), sep = '/')
md <- dplyr::mutate(md, Date = paste(year,month, day, sep = '-'))
md <- dplyr::mutate(md, Date = lubridate::ymd_hms(paste(Date, Time, sep = ' ')))

md <- dplyr::filter(md, lubridate::year(Date) == 2007 &  lubridate::month(Date) == 2 & lubridate::day(Date) %in% c(1,2))

# Plot4
png(file = "plot3.png", bg = "transparent")
par(mfrow= c(2,2))
plot(x = md$Date, y = md$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
plot(x = md$Date, y = md$Voltage, ylab = 'Voltage', xlab = 'datetime', type = 'l')
plot(x = md$Date, y = md$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
lines(x = md$Date, y = md$Sub_metering_2, col = 'red')
lines(x = md$Date, y = md$Sub_metering_3, col = 'blue')
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lwd = 1)
plot(x = md$Date, y = md$Global_reactive_power, ylab = 'Voltage', xlab = 'datetime', type = 'l')
dev.off()
