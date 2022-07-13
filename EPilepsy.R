library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(gplots)

data_1_10000_0.2 = read.csv("/Users/sultm0a/Downloads/GC1000 (1).csv")
data_1 <-  data_1_10000_0.2 %>% select(2:20)
columns = names(data_1)

rownames(data_1) <- columns
data_2 = read.csv("/Users/sultm0a/Downloads/GC2_T.csv")
data_2 <- data_2 %>% select(2:20)

rownames(data_2) <- columns

data_3 = read.csv("/Users/sultm0a/Downloads/GC3_T.csv")
data_3 <-  data_3 %>% select(2:20)


rownames(data_3) <- columns
data_4 = read.csv("/Users/sultm0a/Downloads/GC4_T.csv")
data_4 <- data_4 %>% select(2:20)

rownames(data_4) <- columns

val= 1
ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(sliderInput("slider","Slider", min=1, max=4, step =1, value = val)),
  dashboardBody(
    fillPage(tags$style(type = "text/css", "#plot1 {height: calc(100vh - 80px) !important;}"),plotOutput('plot1'))
             
    ))
server <- function(input, output, session) { 
  observe({
    val <- input$slider
    # Control the value, min, max, and step.
    # Step size is 2 when input value is even; 1 when value is odd.
    updateSliderInput(session, "slider", value = val)
    
    if (val == 1)
    {m<- pheatmap::pheatmap(data.matrix(data_1), treeheight_row = 0, treeheight_col = 0,cluster_rows = FALSE,cluster_cols = FALSE,display_numbers=data_1)
      
      
      output$plot1 <- renderPlot({m
      })}
    
    
    if (val == 2)
    {
      
      m<- pheatmap::pheatmap(data.matrix(data_2), treeheight_row = 0, treeheight_col = 0,cluster_rows = FALSE,cluster_cols = FALSE,display_numbers=data_2)
      output$plot1 <- renderPlot({m
      })}
    
    if (val == 3)
    {
      
      m<- pheatmap::pheatmap(data.matrix(data_3), treeheight_row = 0, treeheight_col = 0,cluster_rows = FALSE,cluster_cols = FALSE,display_numbers=data_3)
      output$plot1 <- renderPlot({
      m
      })}
    if (val == 4)
    {
      
      m<- pheatmap::pheatmap(data.matrix(data_4), treeheight_row = 0, treeheight_col = 0,cluster_rows = FALSE,cluster_cols = FALSE,display_numbers=data_4)
      output$plot1 <- renderPlot({
       m
      })}
    
    
    
  })
  }
  
 

shinyApp(ui, server)
