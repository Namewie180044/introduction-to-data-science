library(tidyverse)
library(lubridate)

df <- read_delim('household_power_consumption.txt', delim=';', na='?', col_types=cols(Date=col_date(format="%d/%m/%Y")))
df.sub <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)


#df.sub$Datetime <- with(df.sub, ymd(Date) + hms(Time))
df.sub$Datetime <- with(df.sub, as.POSIXct(paste(Date, Time)))

png(filename="plot2.png", width=480, height=480)
ggplot(data=df.sub, mapping=aes(x=Datetime, y=Global_active_power)) + 
    geom_line() +
    labs(x='', y='Global Active Power (kilowatts)') + 
    scale_x_datetime(date_breaks='day', date_labels='%a')
dev.off()