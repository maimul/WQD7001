df <- read.csv("C:\\Users\\Rose Tiong\\Desktop\\Data\\Project\\student-mat.csv")
df

install.packages("dataMaid")
library(dataMaid)

makeCodebook(df)