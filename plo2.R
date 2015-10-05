# 0. Read the data.

require(data.table)

md <-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
md <- tidyr::separate(md, Date, into = c('day','month', 'year'), sep = '/')
md <- dplyr::mutate(md, Date = paste(year,month, day, sep = '-'))
md <- dplyr::mutate(md, Date = lubridate::ymd_hms(paste(Date, Time, sep = ' ')))

md <- dplyr::filter(md, lubridate::year(Date) == 2007 &  lubridate::month(Date) == 2 & lubridate::day(Date) %in% c(1,2))

# Plot 1
png(file = "plot1.png", bg = "transparent")
hist(as.numeric(md$Global_active_power), col = 'red', main = 'Global Active Power')
dev.off()

#Plot2
png(file = "plot2.png", bg = "transparent")
plot(x = md$Date, y = md$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()
