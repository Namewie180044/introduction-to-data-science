#install.packages('xlsx', INSTALL_opts=c('--no-multiarch'))
library('xlsx')

setwd('assignment4')

fileurl <- 'http://www.data.gov.my/data/ms_MY/dataset/2f7fb63c-feeb-41a2-9f6f-9b869e13bb01/resource/b198057c-99a2-4d1e-ba6c-d2bcef6bdf0a/download/pergerakan-pesawat-perdagangan-mengikut-lapangan-terbang-2013.xlsx'
download.file(fileurl, destfile='comflight.xlsx', mode='wb')

df <- read.xlsx('comflight.xlsx', header=FALSE, sheetIndex=1, startRow=6, endRow=38)
colnames(df) <- c('airport', 'n_passenger')

df <- na.omit(df)

str(df)
df
