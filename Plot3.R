df <- read.table('household_power_consumption.txt', header = T, sep = ';', skip =  , nrows = 100000)
df_1 <- df
df_1$Date <- as.Date(df_1$Date, '%d/%m/%Y')
df_1[, 'Combined_time'] <- as.POSIXct(paste(df_1$Date, df_1$Time), format="%Y-%m-%d %H:%M:%S")
df2 <- df_1[df_1$Date == '2007/02/01' ,]
df3 <- df_1[df_1$Date == '2007/02/02' ,]
df4 <- rbind(df2, df3)
columns_to_select <- 3:9

df4[, columns_to_select] <- sapply( X= df4[, columns_to_select], FUN = function(x) as.numeric(as.character(x)))

#Plot3
png(filename =  'plot3.png', width = 480, height = 480)
plot(df4$Combined_time, df4$Sub_metering_1, type = 'l', ylab ='Energy sub metering', xlab = '')
lines(df4$Combined_time, df4$Sub_metering_2, type = 'l', col = 'red')
lines(df4$Combined_time, df4$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd   = 1)
dev.off()