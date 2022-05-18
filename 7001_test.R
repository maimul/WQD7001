df <- read.csv("C:\\Users\\Rose Tiong\\Desktop\\Data\\Project\\student-mat.csv")
df

# List columns that should be factor (not ordered)
col_factors <- c('school', 'sex', 'address','Pstatus','Mjob','Fjob','reason','guardian')
df[col_factors] <- lapply(df[col_factors], factor)
# List columns that should be factor (ordered)
col_factorsO <- c('famsize')
df[col_factorsO] <- lapply(df[col_factorsO], ordered, levels = c('LE3','GT3'))
col_factorsO <- c(names(df[24:29]),'Medu','Fedu','traveltime','studytime')
df[col_factorsO] <- lapply(df[col_factorsO], ordered)
# List columns that should be binary
col_binary <- c('schoolsup','famsup','paid','activities','nursery','higher','internet','romantic')
df[col_binary]  <- ifelse(df[col_binary] == 'yes',1,0)
df[col_binary]  <- lapply(df[col_binary], as.logical)

str(df)

install.packages("tidyverse")
library(tidyverse)

view(df)

install.packages("dataMaid")
library(dataMaid)

makeCodebook(df)