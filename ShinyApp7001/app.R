####################################
# Create the shiny app             #
####################################

# Import libraries
library('shiny')
library('shinythemes')
library('tidyverse')
library("codebook")
library('ggplot2')
library('psych')
library("DT")
library('RColorBrewer')

# Set colors for plots
coul <- brewer.pal(5, "Set3")

# Read data
df1 <- read.csv('student-mat.csv') # Change this according to the file name and directory of the file.

### Change the datatype of each column accordingly 
# List columns that should be factor (not ordered)
col_factors <- c('school', 'sex', 'address','Pstatus','Mjob','Fjob','reason','guardian')
df1[col_factors] <- lapply(df1[col_factors], factor)

# List columns that should be factor (ordered)
col_factorsO <- c('famsize')
df1[col_factorsO] <- lapply(df1[col_factorsO], ordered, levels = c('LE3','GT3'))

col_factorsO <- c(names(df1[24:29]),'Medu','Fedu','traveltime','studytime','famsize')
df1[col_factorsO] <- lapply(df1[col_factorsO], ordered)

# List columns that should be binary
col_binary <- c('schoolsup','famsup','paid','activities','nursery','higher','internet','romantic')
df1[col_binary]  <- ifelse(df1[col_binary] == 'yes',1,0)
df1[col_binary]  <- lapply(df1[col_binary], as.logical)

# Histogram of average grade
average = (df1$G1 + df1$G2 + df1$G3)/3
average


# EDA
library('plyr')

df <- read.csv('student-mat.csv') # Change this according to the file name and directory of the file.
# df<-read.csv(file = "C:/Users/Noel/Desktop/UM - Master of Data Science/WQD7001 - Principles of 
#                      Data Science/Group Project/student-mat.csv")

# add a new column with the mean of G1 G2 and G3
df$score_mean <- rowMeans(subset(df, select = c(G1, G2, G2)), na.rm = TRUE)
# df = subset(df, select = -c(mean)) #drop mean column
describe(df$score_mean)



# avg score based on number of distinct in Medu/student 
Medu_score = c()
for (x in 0:4)
{
  Medu_score_mean = df[df$Medu==x, c("Medu" , "score_mean")]
  Medu_score = append(Medu_score,mean(Medu_score_mean$score_mean))
  cat(x, mean(Medu_score_mean$score_mean),"\n")
}
#total higher vs Medu
Medu_higher = c()
for (x in 0:4)
{
  Medu_higher_count = df[df$Medu==x, c("Medu" , "higher")]
  count_higher = count(Medu_higher_count$higher == 'yes')
  count_higher = data.frame(count_higher)
  Medu_higher = append(Medu_higher, count_higher[count_higher$x=='TRUE', c("freq")])
  cat(x, count_higher[count_higher$x=='TRUE', c("freq")],"\n")
}
#avg of number of failures vs Medu
count(df$failures)
Medu_failure = c()
for (x in 0:4)
{
  Medu_failure_mean = df[df$Medu==x, c("Medu" , "failures")]
  Medu_failure = append(Medu_failure, mean(Medu_failure_mean$failures))
  cat(x, mean(Medu_failure_mean$failures),"\n")
}

#total study time vs Medu
Medu_studytime = c()
for (x in 0:4)
{
  Medu_studytime_sum = df[df$Medu==x, c("Medu" , "studytime")]
  Medu_studytime = append(Medu_studytime, sum(Medu_studytime_sum$studytime))
  cat(x, sum(Medu_studytime_sum$studytime),"\n")
}

# avg score based on number of distinct in Fedu/student 
Fedu_score = c()
for (x in 0:4)
{
  Fedu_score_mean = df[df$Fedu==x, c("Fedu" , "score_mean")]
  Fedu_score = append(Fedu_score, mean(Fedu_score_mean$score_mean))
  cat(x, mean(Fedu_score_mean$score_mean),"\n")
}
#avg of number of failures vs Fedu
Fedu_failure = c()
for (x in 0:4)
{
  Fedu_failure_mean = df[df$Fedu==x, c("Fedu" , "failures")]
  Fedu_failure = append(Fedu_failure, mean(Fedu_failure_mean$failures))
  cat(x, mean(Fedu_failure_mean$failures),"\n")
}
#total higher vs Fedu
Fedu_higher = c()
for (x in 0:4)
{
  Fedu_higher_count = df[df$Fedu==x, c("Fedu" , "higher")]
  count_higher = count(Fedu_higher_count$higher == 'yes')
  count_higher = data.frame(count_higher)
  Fedu_higher = append(Fedu_higher, count_higher[count_higher$x=='TRUE', c("freq")])
  cat(x, count_higher[count_higher$x=='TRUE', c("freq")],"\n")
}
#total study time vs Fedu
Fedu_studytime = c()
for (x in 0:4)
{
  Fedu_studytime_sum = df[df$Fedu==x, c("Fedu" , "studytime")]
  Fedu_studytime = append(Fedu_studytime, sum(Fedu_studytime_sum$studytime))
  cat(x, sum(Fedu_studytime_sum$studytime),"\n")
}



# bar graph of studytime & higher vs Medu
studytime_1 <- ggplot(df1, aes(x = Medu, y = studytime, fill = higher)) + 
  geom_bar(position = "dodge", stat = "identity") +  
  ggtitle("Student's study time & Pursuing Higher education VS Mother's education level") +
  xlab("Mother's eduction level") + 
  ylab("Student's study time") +  
  scale_fill_manual("Pursuing higher education", values = coul)
# bar graph of studytime & higher vs Fedu
studytime_2 <- ggplot(df1, aes(x = Fedu, y = studytime, fill = higher)) + 
  geom_bar(position = "dodge", stat = "identity") +  
  ggtitle("Student's study time & Pursuing Higher education VS Father's education level") +
  xlab("Father's eduction level") + 
  ylab("Student's study time") +  
  scale_fill_manual("Pursuing higher education", values = coul)


# bar graph of studytime & higher vs Mjob
studytime_3 <- ggplot(df1, aes(x = Mjob, y = studytime, fill = higher)) + 
  geom_bar(position = "dodge", stat = "identity") +  
  ggtitle("Student's study time & Pursuing Higher education VS Mother's job") +
  xlab("Mother's job") + 
  ylab("Student's study time") +  
  scale_fill_manual("Pursuing higher education", values = coul)
# bar graph of studytime & higher vs Fjob
studytime_4 <- ggplot(df1, aes(x = Fjob, y = studytime, fill = higher)) + 
  geom_bar(position = "dodge", stat = "identity") +  
  ggtitle("Student's study time & Pursuing Higher education VS Father's job") +
  xlab("Father's job") + 
  ylab("Student's study time") +  
  scale_fill_manual("Pursuing higher education", values = coul)
# bar graph of studytime & higher vs paid
studytime_5 <- ggplot(df1, aes(x = paid, y = studytime, fill = higher)) + 
  geom_bar(position = "dodge", stat = "identity") +  
  ggtitle("Student's study time & Pursuing Higher education VS Extra paid classes") +
  xlab("Extra paid classes") + 
  ylab("Student's study time") +  
  scale_fill_manual("Pursuing higher education", values = coul)
# bar graph of studytime & higher vs famrel
studytime_6 <- ggplot(df1, aes(x = famrel, y = studytime, fill = higher)) + 
  geom_bar(position = "dodge", stat = "identity") +  
  ggtitle("Student's study time & Pursuing Higher education VS Quality of family relationships") +
  xlab("Quality of family relationships") + 
  ylab("Student's study time") +  
  scale_fill_manual("Pursuing higher education", values = coul)
# bar graph of studytime & higher vs health
studytime_7 <-ggplot(df1, aes(x = health, y = studytime, fill = higher)) + 
  geom_bar(position = "dodge", stat = "identity") +  
  ggtitle("Student's study time & Pursuing Higher education VS Current health status") +
  xlab("Current health status") + 
  ylab("Student's study time") +  
  scale_fill_manual("Pursuing higher education", values = coul)











###############
##### UI ######
###############
ui <- navbarPage(                
  theme = shinytheme("flatly"), # united
  
  a("Up Maths!", href="https://github.com/maimul/WQD7001"),
  
  main_page <- tabPanel(
    
    title = "Overview",
    
    
    # titlePanel(div("", img(src = '~/Documents/Principle of DS/Project/WQD7001/ShinyApp7001/infograph.png'),)),
    sidebarLayout(
      sidebarPanel(
        "MAIN QUESTION:"
      ),
      mainPanel(
        h3("Do students with highly educated parents tend to score better in Math?"),br()
      ),
    ),
sidebarLayout(
  sidebarPanel(
    "SUB-QUESTIONS:"
  ),
  mainPanel(
    "1. Do parents’ education background correlate with a student's grade in the Math subject?",br(),
    "2. Do parents’ education background correlate with student’s past class failures?",br(),
    "3. Do parents’ education background affect a student's total study time?",br(),
    "4. Do students with highly educated parents tend to be more ambitious and pursue higher education?",br(),
    " ",br()

       ),
    ),
    # Change the image of the poster accordinly 
    HTML('<center><img src="infograph.png" width="50%"></center>'),

    ),
  
  
  second_page <- tabPanel(
    title = "Descriptive Statistics",
    h2("The student-mat data"),
    DT::dataTableOutput("mytable"),
    #### 
    mainPanel(
      verbatimTextOutput("sum"),
    )
    
    ),
  
  
  third_page <- tabPanel(
    title = "Descriptive Analysis",
    
    ######
    #### Descriptive 
    # Page header
    headerPanel('Descriptive Analysis'),
    
    # Side Panel for Boxplot
    sidebarPanel(
      HTML("<h3>Numeric variables</h3>"),
      
      # Options to choose for boxplot
      selectInput("Boxplot", label = "Boxplot:", 
                  choices = list("Absences" = "absences", "Grade 1" = "G1", "Grade 2" = "G2", "Grade 3" = "G3"), 
                  selected = "Absences"),
      
    
    ),
    
    mainPanel(
      tags$label(h3('Boxplot')), # Status/Output Text Box
      # Output: Boxplot
      plotOutput(outputId = "boxPlot") 
      
    ),
    
    # Side Panel for Barplot
    sidebarPanel(
      HTML("<h3>Category variables</h3>"),
      
      # Options to choose for barplot
      selectInput("Barplot", label = "Barplot:", 
                  choices = list('sex', 'age','Pstatus','Medu','Fedu','Mjob','Fjob','studytime','failures','paid','higher','internet','romantic','famrel','health','avg_grade'), 
                  selected = "sex")
    ),
    
    mainPanel(
      tags$label(h3('Plots')), # Status/Output Text Box
      # Output: Barplot
      plotOutput(outputId = "barPlot") 
      
    ),
    #####
    ),
  
  
  fourth_page <- tabPanel(
    title = "Exploratory Descriptive Analysis",
    
    
    ###### EDA 
    # Page header
    headerPanel('Exploratory Analysis'),
    
    # Side Panel for Barplot
    sidebarPanel(
      HTML("<h3>Category variables</h3>"),
      
      # 1st list of options to choose for barplot
      selectInput("Barplot_EDA1", label = "Barplot:", 
                  choices = list("Mother's Education", "Father's Education"), 
                  selected = "Mother's Education"),
      # 2nd list of options to choose for barplot
      selectInput("Barplot_EDA2", label = "Barplot:", 
                  choices = list("Average test scores","Failures", "Study time","Higher"), 
                  selected = "Failures"),
      

      
      checkboxInput("checkbox_1", "Highlight by education level", value = 0, width = NULL),
      
      conditionalPanel(condition = "input.checkbox_1 == '1'",
        sliderInput("color_option", label = "Choose level", min = 0, max = 4, value = 3)
      )
    ),
    
    mainPanel(
      tags$label(h3('Plots')), # Status/Output Text Box
      # Output: Barplot
      plotOutput(outputId = "Barplot_EDA"),
      verbatimTextOutput("text") # print out the description
    ),
    
    ),
  userManual <- tabPanel(
    
    ############
    
    title = "User manual",
    
    
    # titlePanel(div("", img(src = '~/Documents/Principle of DS/Project/WQD7001/ShinyApp7001/infograph.png'),)),
    sidebarLayout(
      sidebarPanel(
        "MAIN QUESTION:"
      ),
      mainPanel(
        h3("Do students with highly educated parents tend to score better in Math?"),br()
      ),
    ),
    sidebarLayout(
      sidebarPanel(
        "SUB-QUESTIONS:"
      ),
      mainPanel(
        "1. Do parents’ education background correlate with a student's grade in the Math subject?",br(),
        "2. Do parents’ education background correlate with student’s past class failures?",br(),
        "3. Do parents’ education background affect a student's total study time?",br(),
        "4. Do students with highly educated parents tend to be more ambitious and pursue higher education?",br(),
        " ",br()
        
      ),
    ),
    # Change the image of the poster accordinly 
    HTML('<center><img src="infograph.png" width="50%"></center>'),
    
    
    
    ##############
    )
)



####################################
# Server   uwu!!          #
####################################

server <- function(input, output, session) {
  
  
  # print out the df
  output$mytable = DT::renderDataTable({
    df1
  })
  
  # Print out descriptive stats (summary)
  output$sum <- renderPrint({
    
    #print(summary(df1))
    print(glimpse(df1))
    
  })
  
  # For Boxplot
  output$boxPlot <- renderPlot({
    if(input$Boxplot == 'absences'){
      boxplot(df1$absences, main = "Distribution of School Absences", xlab = "Students", ylab = "Number of School Absences", col = coul)
    }else if(input$Boxplot == 'G1'){
      boxplot(df1$G1, main = "Distribution of First Period Grade", xlab = "Math", ylab = "First Period Grade", col = coul)
    }else if(input$Boxplot == 'G2'){
      boxplot(df1$G2, main = "Distribution of Second Period Grade", xlab = "Math", ylab = "Second Period Grade", col = coul)
    }else if(input$Boxplot == 'G3'){
      boxplot(df1$G3, main = "Distribution of Final Period Grade", xlab = "Math", ylab = "Final Period Grade", col = coul)
    }
  })
  
  # For Descriptive Barplots
  output$barPlot <- renderPlot({   
    if(input$Barplot == 'sex'){
      barplot(table(df1$sex), main = "Distribution of Student's Gender", xlab = "Student's Gender", ylab = "Number of Student", names.arg = c("Female", "Male"), col = coul)
    }else if(input$Barplot == 'age'){
      barplot(table(df1$age), main = "Distribution of Student's Age", xlab = "Student's Age", ylab = "Number of Student", col = coul)
    }else if(input$Barplot == 'Pstatus'){
      barplot(table(df1$Pstatus), main = "Distribution of Parent's Cohabitation Status", xlab = "Parent's Cohabitation Status", ylab = "Number of Student", names.arg = c("Living Apart", "Living Together"), col = coul)
    }else if(input$Barplot == 'Medu'){
      barplot(table(df1$Medu), main = "Distribution of Mother's Education", xlab = "Mother's Education", ylab = "Number of Student", names.arg = c("None", "4th Grade", "5-9th Grade", "Secondary Edu", "Higher Edu"), col = coul)
    }else if(input$Barplot == 'Fedu'){
      barplot(table(df1$Fedu), main = "Distribution of Father's Education", xlab = "Father's Education", ylab = "Number of Student", names.arg = c("None", "4th Grade", "5-9th Grade", "Secondary Edu", "Higher Edu"), col = coul)
    }else if(input$Barplot == 'Mjob'){
      barplot(sort(table(df1$Mjob), decreasing = FALSE), main = "Distribution of Mother's Occupation", xlab = "Mother's Occupation", ylab = "Number of Student", names.arg = c("Healthcare", "Teacher", "Housewife", "Civil Services", "Other"), col = coul)
    }else if(input$Barplot == 'Fjob'){
      barplot(sort(table(df1$Fjob), decreasing = FALSE), main = "Distribution of Father's Occupation", xlab = "Father's Occupation", ylab = "Number of Student", names.arg = c("Healthcare", "Househusband", "Teacher", "Civil Services", "Other"), col = coul)
    }else if(input$Barplot == 'studytime'){
      barplot(table(df1$studytime), main = "Distribution of Weekly Study Time", xlab = "Study Time", ylab = "Number of Student", names.arg = c("< 2 hours", "2 to 5 hours", "5 to 10 hours", "> 10 hours"), col = coul)
    }else if(input$Barplot == 'failures'){
      barplot(table(df1$failures), main = "Distribution of Pass Class Failures", xlab = "Pass Class Failures", ylab = "Number of Student", col = coul)
    }else if(input$Barplot == 'paid'){
      barplot(table(df1$paid), main = "Distribution of Extra Paid Class (Math)", xlab = "Extra Paid Class", ylab = "Number of Student", names.arg = c("No", "Yes"), col = coul)
    }else if(input$Barplot == 'higher'){
      barplot(table(df1$higher), main = "Distribution of Furthering Studies", xlab = "Higher Education", ylab = "Number of Student", names.arg = c("No", "Yes"), col = coul)
    }else if(input$Barplot == 'internet'){
      barplot(table(df1$internet), main = "Distribution of Home Internet Access", xlab = "Internet Access at Home", ylab = "Number of Student", names.arg = c("No", "Yes"),col = coul)
    }else if(input$Barplot == 'romantic'){
      barplot(table(df1$romantic), main = "Distribution of Romantic Relationship", xlab = "In Romantic Relationship", ylab = "Number of Student", names.arg = c("No", "Yes"), col = coul)
    }else if(input$Barplot == 'famrel'){
      barplot(table(df1$famrel), main = "Distribution of Student's Family Relationship", xlab = "Family Relationship", ylab = "Number of Student", names.arg = c("Very Bad", "Bad", "Average", "Good", "Excellent"), col = coul)
    }else if(input$Barplot == 'health'){
      barplot(table(df1$health), main = "Distribution of Student's Health Status", xlab = "Current Health Status", ylab = "Number of Student", names.arg = c("Very Bad", "Bad", "Average", "Good", "Very Good"), col = coul)
    }else if(input$Barplot == 'avg_grade'){
      hist(average, main = "Distribution of student's average grade", xlab = "Student's average grade", ylab = "Number of student", col = coul)
    }
  }) #'sex', 'age','Pstatus','Medu','Fedu','Mjob','Fjob','studytime','failure','paid','higher','internet','romantic','famrel','health'
  
  # EDA plotting
  output$Barplot_EDA <- renderPlot({
    
    
    # Selecting by specific education level
    if (input$checkbox_1 == 1){
      if (input$color_option == 0){
        coul <- c(10,'grey50','grey50','grey50','grey50')
      }else if (input$color_option == 1){
        coul <- c('grey50',10,'grey50','grey50','grey50')
      }else if (input$color_option == 2){
        coul <- c('grey50','grey50',10,'grey50','grey50')
      }else if (input$color_option == 3){
        coul <- c('grey50','grey50','grey50',10,'grey50')
      }else if (input$color_option == 4){
        coul <- c('grey50','grey50','grey50','grey50',10)
      }else{
        coul <- coul
      }
    }else{
      coul <- coul #default color pallet
    }
    
    
    
    
    if(input$Barplot_EDA1 == "Mother's Education"){
      if(input$Barplot_EDA2 == 'Average test scores'){
        barplot(Medu_score,names.arg=c("0","1","2","3","4"),main = "Average test scores vs mother's education",
                xlab = "Mother's education",
                ylab = "Average test scores",
                col = coul)
      }else if(input$Barplot_EDA2 == "Failures"){
        barplot(Medu_failure,names.arg=c("0","1","2","3","4"),main = "Average number of failures vs mother's education",
                xlab = "Mother's education",
                ylab = "Average number of failures",col = coul)
      }else if(input$Barplot_EDA2 == "Study time"){
        
        barplot(Medu_studytime,names.arg=c("0","1","2","3","4"),main = "study time vs Medu",
                xlab = "Medu",
                ylab = "total study time",
                col = coul)

        

      }else if(input$Barplot_EDA2 == 'Higher'){
        barplot(Medu_higher,names.arg=c("0","1","2","3","4"),main = "Total higher education vs mother's education",
                xlab = "Mother's education",
                ylab = "Total higher",col = coul)
      }
    }
    
    if(input$Barplot_EDA1 == "Father's Education"){
      if(input$Barplot_EDA2 == 'Average test scores'){
        barplot(Fedu_score,names.arg=c("0","1","2","3","4"),main = "Average test scores vs father's education",
                xlab = "Father's education",
                ylab = "Average test scores",
                col = coul)
      }
      if(input$Barplot_EDA2 == "Failures"){
        barplot(Fedu_failure,names.arg=c("0","1","2","3","4"),main = "Average number of failures vs father's education",
                xlab = "Father's education",
                ylab = "Average number of failures",col = coul)
      }else if(input$Barplot_EDA2 == "Study time"){
        barplot(Fedu_studytime,names.arg=c("0","1","2","3","4"),main = "study time vs Fedu",
                xlab = "Fedu",
                ylab = "total study time",
                col = coul)
      }else if(input$Barplot_EDA2 == "Higher"){
        barplot(Fedu_higher,names.arg=c("0","1","2","3","4"),main = "Total higher education vs father's education",
                xlab = "Father's education",
                ylab = "Total higher",col = coul)
      }
    }
  })
  
  
  # EDA Description
  output$text <- renderPrint({
    
    if(input$Barplot_EDA1 == "Mother's Education"){
      if(input$Barplot_EDA2 == 'Average test scores'){
        cat("There is no correlation between Mother's education with student's average test scores")
      }else if(input$Barplot_EDA2 == "Failures"){
        cat("There is a negative correlation between Mother's education with number of student's past class failure.\nThe higher the Mother's education, the lower the number of student's past class failure.")
      }else if(input$Barplot_EDA2 == "Study time"){
        cat("There is a positive correlation between Mother's education with student's weekly study time.\nThe higher the Mother's education, the higher the student's weekly study time.")
      }else if(input$Barplot_EDA2 == 'Higher'){
        cat("There is a positive correlation between Mother's education with number of student who wants to take higher education.\nThe higher the Mother's education, the lower the number of student who wants to take higher education.")
      }
    }
    
    if(input$Barplot_EDA1 == "Father's Education"){
      if(input$Barplot_EDA2 == 'Average test scores'){
        cat("There is no correlation between Father's education with student's average test scores")
      }else if(input$Barplot_EDA2 == "Failures"){
        cat("There is a negative correlation between Father's education with number of student's past class failure.\nThe higher the Father's education, the lower the number of student's past class failure.")
      }else if(input$Barplot_EDA2 == "Study time"){
        cat("There is a positive correlation between Father's education with student's weekly study time.\nThe higher the Father's education, the higher the student's weekly study time.")
      }else if(input$Barplot_EDA2 == "Higher"){
        cat("There is a positive correlation between Father's education with number of student who wants to take higher education.\nThe higher the Father's education, the lower the number of student who wants to take higher education.")
      }
    }
    
  })
  
  
  
  
}

####################################
# Create the shiny app             #
####################################
shinyApp(ui = ui, server = server)
