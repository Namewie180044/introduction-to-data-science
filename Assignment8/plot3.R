library(tidyverse)
library(lubridate)

df <- read_delim('household_power_consumption.txt', delim=';', na='?', col_types=cols(Date=col_date(format="%d/%m/%Y")))
df.sub <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)


#df.sub$Datetime <- with(df.sub, ymd(Date) + hms(Time))
df.sub$Datetime <- with(df.sub, as.POSIXct(paste(Date, Time)))
df.gat <- df.sub %>% gather(Sub_metering_1, Sub_metering_2, Sub_metering_3, key='Sub_metering', value='Energy')

png(filename="plot3.png", width=480, height=480)
ggplot(data=df.gat, mapping=aes(x=Datetime, y=Energy)) + 
    geom_line(mapping=aes(color=Sub_metering)) +
    labs(x='', y='Energy sub metering') + 
    theme(legend.title=element_blank(), legend.position=c(0.85, 0.88)) + 
    scale_x_datetime(date_breaks='day', date_labels='%a') + 
    scale_color_manual(values=c('black', 'red', 'blue'))
dev.off()