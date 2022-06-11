####################################
# Create the shiny app             #
####################################
library(shiny)
ui <- navbarPage(
  title = "Parents’ Education Background and Children’s Success",
  main_page <- tabPanel(
    title = "Overview",
    titlePanel("Questions"),
    sidebarLayout(
      sidebarPanel(
        "Main: Do students with highly educated parents tend to score better in Math?"
      ),
      mainPanel(
        "Sub-question(s):",
        "1. Do parents’ education background correlate with a student's grade in the Math subject?",
        "2. Do parents’ education background correlate with student’s past class failures?",
        "3. Do parents’ education background affect a student's total study time?",
        "4. Do students with highly educated parents tend to be more ambitious and pursue higher education?"
       ),
      
    ),
    
    
    
    ),
  
  
  second_page <- tabPanel(title = "Descriptive Statitics"),
  third_page <- tabPanel(title = "Descriptive Analysis"),
  fourth_page <- tabPanel(title = "Exploratory Descriptive Analysis")
)
server <- function(input, output){}
shinyApp(ui = ui, server = server)








