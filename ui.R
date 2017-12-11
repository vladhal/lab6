library(shiny)
checkbox <- function(){
  data <- read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  result <- as.vector(data[,1])
  names(result) <- result
  return (result)
}
shinyUI(pageWithSidebar(
  headerPanel("Ціна біткоіна з 07.12.2017 по 10.12.2017"),
  sidebarPanel(
    checkboxGroupInput("cost", "Виберіть дату:", checkbox())
  ),
  mainPanel(
    plotOutput("plot")
  )
))