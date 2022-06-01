df <- read.csv("C:\\Users\\Rose Tiong\\Desktop\\Data\\data\\student-mat.csv")
df

# List columns that should be factor (not ordered)
col_factors <- c('sex','Pstatus','Mjob','Fjob')
df[col_factors] <- lapply(df[col_factors], factor)
# List columns that should be factor (ordered)
col_factorsO <- c(names(df[14:15]),'Medu','Fedu','studytime')
df[col_factorsO] <- lapply(df[col_factorsO], ordered)
# List columns that should be binary
col_binary <- c('paid','higher','internet','romantic')
df[col_binary]  <- ifelse(df[col_binary] == 'yes',1,0)
df[col_binary]  <- lapply(df[col_binary], as.logical)

str(df)

install.packages("tidyverse")
library(tidyverse)

#view names(), head(), table()
view(df)

#Descriptive Analysis
#check missing values
summary(df)
is.na(df)
sum(is.na(df))

install.packages("dataMaid")
library(dataMaid)

makeCodebook(df)

#Boxplot
install.packages("ggplot2")
library(ggplot2)

#Get the average score of each student in 3 exams G1G2G3
AverageScore <- rowMeans(df[17:19])
AverageScore

#Boxplot with target variable AverageScore
ggplot(data = df, aes(x=Medu,y=AverageScore, color=Medu)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'AverageScore Over Mother Education',
       y='AverageScore',x='Medu')

ggplot(data = df, aes(x=Fedu,y=AverageScore, color=Fedu)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'AverageScore Over Father Education',
       y='AverageScore',x='Fedu')

ggplot(data = df, aes(x=Mjob,y=AverageScore, color=Mjob)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'AverageScore Over Mother Job',
       y='AverageScore',x='Mjob')

ggplot(data = df, aes(x=Fjob,y=AverageScore, color=Fjob)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'AverageScore Over Father Job',
       y='AverageScore',x='Fjob')

ggplot(data = df, aes(x=paid,y=AverageScore, color=paid)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'AverageScore Over Paid',
       y='AverageScore',x='Paid')

ggplot(data = df, aes(x=famrel,y=AverageScore, color=famrel)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'AverageScore Over Family Relationship',
       y='AverageScore',x='Fam-rel')

ggplot(data = df, aes(x=health,y=AverageScore, color=health)) + 
  geom_boxplot()+
  scale_color_brewer(palette="RdPu") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'AverageScore Over Health',
       y='AverageScore',x='Health')


#Boxplot with target variable Failures

ggplot(data = df, aes(x=Medu,y=failures, color=Medu)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'Failures Over Medu',
       y='Failures',x='Medu')

ggplot(data = df, aes(x=Fedu,y=failures, color=Fedu)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'Failures Over Fedu',
       y='Failures',x='Fedu')

ggplot(data = df, aes(x=Mjob,y=failures, color=Mjob)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'Failures Over Mjob',
       y='Failures',x='Mjob')

ggplot(data = df, aes(x=Fjob,y=failures, color=Fjob)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'Failures Over Fjob',
       y='Failures',x='Fjob')

ggplot(data = df, aes(x=paid,y=failures, color=paid)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'Failures Over Paid',
       y='Failures',x='paid')

ggplot(data = df, aes(x=famrel,y=failures, color=famrel)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'Failures Over Family Relationship',
       y='Failures',x='Fam-rel')

ggplot(data = df, aes(x=health,y=failures, color=health)) + 
  geom_boxplot()+
  scale_color_brewer(palette="Dark2") + 
  geom_jitter(shape=16, position=position_jitter(0.2))+
  labs(title = 'Failures Over Health',
       y='Failures',x='Health')

#Boxplot is for numerical data hence doesn't display well on target variable Studytime & Higher

#Barplot with Target Variable AverageScore

ggplot(data=df,aes(x=Medu, y=AverageScore)) + 
  geom_bar(stat ='identity',aes(fill=AverageScore))+
  theme_grey() + 
  scale_fill_gradient(name="Average Score")+
  labs(title = 'Average Score over Mother Education',
       y='AverageScore',x='Medu')

ggplot(data=df,aes(x=Fedu, y=AverageScore)) + 
  geom_bar(stat ='identity',aes(fill=AverageScore))+
  theme_grey() + 
  scale_fill_gradient(name="Average Score")+
  labs(title = 'Average Score over Father Education',
       y='AverageScore',x='Fedu')

ggplot(data=df,aes(x=Mjob, y=AverageScore)) + 
  geom_bar(stat ='identity',aes(fill=AverageScore))+
  theme_grey() + 
  scale_fill_gradient(name="Average Score")+
  labs(title = 'Average Score over Mother Job',
       y='AverageScore',x='Mjob')

ggplot(data=df,aes(x=Fjob, y=AverageScore)) + 
  geom_bar(stat ='identity',aes(fill=AverageScore))+
  theme_grey() + 
  scale_fill_gradient(name="Average Score")+
  labs(title = 'Average Score over Father Job',
       y='AverageScore',x='Fjob')

ggplot(data=df,aes(x=paid, y=AverageScore)) + 
  geom_bar(stat ='identity',aes(fill=AverageScore))+
  theme_grey() + 
  scale_fill_gradient(name="Average Score")+
  labs(title = 'Average Score over Paid',
       y='AverageScore',x='Paid')

ggplot(data=df,aes(x=famrel, y=AverageScore)) + 
  geom_bar(stat ='identity',aes(fill=AverageScore))+
  theme_grey() + 
  scale_fill_gradient(name="Average Score")+
  labs(title = 'Average Score over Family Relationship',
       y='AverageScore',x='Family Relationship')

ggplot(data=df,aes(x=health, y=AverageScore)) + 
  geom_bar(stat ='identity',aes(fill=AverageScore))+
  theme_grey() + 
  scale_fill_gradient(name="Average Score")+
  labs(title = 'Average Score over Health',
       y='AverageScore',x='Health')

#Barplot with Target Variable Failures
ggplot(data=df,aes(x=Medu, y=failures)) + 
  geom_bar(stat ='identity',aes(fill=failures))+
  theme_grey() + 
  scale_fill_gradient(name="Failures")+
  labs(title = 'Failures over Mother Education',
       y='Failures',x='Medu')

ggplot(data=df,aes(x=Fedu, y=failures)) + 
  geom_bar(stat ='identity',aes(fill=failures))+
  theme_grey() + 
  scale_fill_gradient(name="Failures")+
  labs(title = 'Failures over Father Education',
       y='Failures',x='Fedu')

ggplot(data=df,aes(x=Mjob, y=failures)) + 
  geom_bar(stat ='identity',aes(fill=failures))+
  theme_grey() + 
  scale_fill_gradient(name="Failures")+
  labs(title = 'Failures over Mother Job',
       y='Failures',x='Mjob')

ggplot(data=df,aes(x=Fjob, y=failures)) + 
  geom_bar(stat ='identity',aes(fill=failures))+
  theme_grey() + 
  scale_fill_gradient(name="Failures")+
  labs(title = 'Failures over Father Job',
       y='Failures',x='Fjob')

ggplot(data=df,aes(x=paid, y=failures)) + 
  geom_bar(stat ='identity',aes(fill=failures))+
  theme_grey() + 
  scale_fill_gradient(name="Failures")+
  labs(title = 'Failures over Paid',
       y='Failures',x='Paid')

ggplot(data=df,aes(x=famrel, y=failures)) + 
  geom_bar(stat ='identity',aes(fill=failures))+
  theme_grey() + 
  scale_fill_gradient(name="Failures")+
  labs(title = 'Failures over Family Relationship',
       y='Failures',x='Family Relationship')

ggplot(data=df,aes(x=health, y=failures)) + 
  geom_bar(stat ='identity',aes(fill=failures))+
  theme_grey() + 
  scale_fill_gradient(name="Failures")+
  labs(title = 'Failures over Health',
       y='Failures',x='Health')

#Barplot with Target Variable StudyTime

ggplot(df, mapping = aes(Medu, studytime, fill = Medu))+
  geom_bar(stat = "identity",position = "dodge", alpha = 0.5)+
  theme_bw()+
  labs(title = "Study Time over Medu", x = "Medu",
       y = "Study Time")

ggplot(df, mapping = aes(Fedu, studytime, fill = Fedu))+
  geom_bar(stat = "identity",position = "dodge", alpha = 0.5)+
  theme_bw()+
  labs(title = "Study Time over Fedu", x = "Fedu",
       y = "Study Time")

ggplot(df, mapping = aes(paid, studytime, fill = paid))+
  geom_bar(stat = "identity",position = "dodge", alpha = 0.5)+
  theme_bw()+
  labs(title = "Study Time over Paid", x = "Paid",
       y = "Study Time")

ggplot(df, mapping = aes(famrel, studytime, fill = famrel))+
  geom_bar(stat = "identity",position = "dodge", alpha = 0.5)+
  theme_bw()+
  labs(title = "Study Time over Family Relationship", x = "Family Relationship",
       y = "Study Time")

ggplot(df, mapping = aes(health, studytime, fill = health))+
  geom_bar(stat = "identity",position = "dodge", alpha = 0.5)+
  theme_bw()+
  labs(title = "Study Time over Health", x = "Health",
       y = "Study Time")

#Barplot with Target Variable Higher Pursue
ggplot(data=df)+geom_bar(aes(x=Medu,fill=higher))+
  ggtitle(label = "Higher Pursue over Medu")+theme_get()

ggplot(data=df)+geom_bar(aes(x=Fedu,fill=higher))+
  ggtitle(label = "Higher Pursue over Fedu")+theme_get()

ggplot(data=df)+geom_bar(aes(x=paid,fill=higher))+
  ggtitle(label = "Higher Pursue over Paid")+theme_get()

ggplot(data=df)+geom_bar(aes(x=famrel,fill=higher))+
  ggtitle(label = "Higher Pursue over Family Relationship")+theme_get()

ggplot(data=df)+geom_bar(aes(x=health,fill=higher))+
  ggtitle(label = "Higher Pursue over Health")+theme_get()


#Lattice-X
# creating plot using the above data
install.packages("lattice")
library("lattice")


stripplot(AverageScore ~ Medu,  data = df,
          jitter.data = TRUE, pch = 19,
          xlab = "Dose", ylab = "Length")


install.packages("hexbin")
install.packages("RColorBrewer")
library(hexbin)
library(RColorBrewer)

# Create data
x <- as.list(df["Medu"])
y <- AverageScore

x
y

# Make the plot

ggplot(df, aes(Medu, AverageScore, fill= paid)) + 
  geom_tile()

ggplot(df, aes(Medu, failures, fill= Mjob)) + 
  geom_tile()

ggplot(df, aes(Medu, higher, fill= Mjob)) + 
  geom_tile()

ggplot(df, aes(Fedu, AverageScore, fill= paid)) + 
  geom_tile()

ggplot(df, aes(Fedu, failures, fill= Fjob)) + 
  geom_tile()

ggplot(df, aes(Fedu, higher, fill= Fjob)) + 
  geom_tile()

ggplot(df, aes(studytime, AverageScore, fill= Medu)) + 
  geom_tile()

ggplot(df, aes(studytime, AverageScore, fill= Fedu)) + 
  geom_tile()

ggplot(df, aes(failures, AverageScore, fill= Medu)) + 
  geom_tile()

ggplot(df, aes(failures, AverageScore, fill= Fedu)) + 
  geom_tile()

