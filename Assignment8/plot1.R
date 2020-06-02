library(tidyverse)
library(lubridate)

df <- read_delim('household_power_consumption.txt', delim=';', na='?', col_types=cols(Date=col_date(format="%d/%m/%Y")))
df.sub <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)


#df.sub$Datetime <- with(df.sub, ymd(Date) + hms(Time))
df.sub$Datetime <- with(df.sub, as.POSIXct(paste(Date, Time)))

png(filename="plot1.png", width=480, height=480)
ggplot(data=df.sub) + 
    geom_histogram(mapping=aes(x=Global_active_power), color='black', fill='red', bins=10) + 
    labs(x='Global Active Power (kilowatts)', y='Frequency', title='Global Active Power') + 
    theme(plot.title=element_text(hjust=0.5))
dev.off()