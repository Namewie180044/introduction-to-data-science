library(tidyverse)
data(mpg)

ggplot(mpg, aes(x=displ, y=hwy)) + 
    geom_point(mapping=aes(color=class)) + 
    labs(title='Fuel Efficiency', 
         x='displ (engine displacement, in litres)', 
         y='hwy (highway miles per gallon)')

ggplot(mpg) + 
    geom_histogram(mapping=aes(cty, fill=class), bins=10)

ggplot(mpg) + 
    geom_boxplot(aes(drv, hwy)) + 
    labs(title='Fuel Efficiency Distribution (Highway) by Drive Train Types') + 
    scale_x_discrete(labels=c('4'='4 wheels drive', 'f'='font-wheel drive', 'r'='rear wheel drive'))
