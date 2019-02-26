
# CREDIT CARD REWARDS CALCULATOR #

# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

library(DT)
library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Reward comparison"),
  
  # Layout with sidebar
  sidebarLayout(
    sidebarPanel(
      numericInput("spendBox",
                   "Yearly spend on card:",
                   value = 12500),
      
      radioButtons("typeRadio",
                   "Which type of reward are you interested in?",
                   choices = list("Flights"=1, "Shopping"=2, 
                                  "Cashback"=3),
                   selected = 2)
    ),
    
    mainPanel(
      h3('Net rewards value after 2 years'),
      dataTableOutput('resultTable')
    )
  )
))
