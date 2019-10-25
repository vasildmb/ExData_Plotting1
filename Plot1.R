df <- read.table('household_power_consumption.txt', header = T, sep = ';', skip =  , nrows = 100000) #The file is available in the folder as a zip file
df_1 <- df          #A copy of the first dataframe that will be modifyed so that I keep a copy of the original data as quality co ntrol
df_1$Date <- as.Date(df_1$Date, '%d/%m/%Y') #Convert the dates to a date format
df_1[, 'Combined_time'] <- as.POSIXct(paste(df_1$Date, df_1$Time), format="%Y-%m-%d %H:%M:%S")  #Convert the dates to a date format
df2 <- df_1[df_1$Date == '2007/02/01' ,]      #Select for dates '2007/02/01' and '2007/02/02'
df3 <- df_1[df_1$Date == '2007/02/02' ,]      #Select for dates '2007/02/01' and '2007/02/02'
df4 <- rbind(df2, df3)                        #Select for dates '2007/02/01' and '2007/02/02'
columns_to_select <- 3:9                      #columns to be converteb in numerical

df4[, columns_to_select] <- sapply( X= df4[, columns_to_select], FUN = function(x) as.numeric(as.character(x))) #converting in numerical

#Plot1
png(filename =  'plot1.png', width = 480, height = 480)
hist(df4$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()
