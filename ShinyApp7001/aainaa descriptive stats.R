install.packages("DT")
library(DT)
df1 <- read.csv("student-mat.csv")
ui <- basicPage(
  h2("The student-mat data"),
  DT::dataTableOutput("mytable")
)

server <- function(input, output) {
  output$mytable = DT::renderDataTable({
    df1
  })
}

shinyApp(ui, server)