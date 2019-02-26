
# CAR INSURANCE PREMIUM CALCULATOR #

# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

library(shiny)
library(DT)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Premium comparison"),
  
  # Layout with sidebar
  sidebarLayout(
    sidebarPanel(
      radioButtons("typeRadio",
                   "Insurance type:",
                   choices = list("Comprehensive"=1, "Third Party Fire and Theft"=2, 
                                  "Third Party Only"=3),
                   selected = 1),
      
      radioButtons("ageRadio",
                   "Which profile fits you best?",
                   choices = list("Young (23)"=1, "Middle-aged (45)"=2, 
                                  "Older (70)"=3, "Family of four"=4),
                   selected = 1),
      
      radioButtons("genderRadio",
                   "Gender:",
                   choices = list("Male"=1, "Female"=2),
                   selected = 1),
      
      radioButtons("cityRadio",
                   "City:",
                   choices = list("Auckland"=1, "Hamilton"=2, "Wellington"=3, 
                                  "Christchurch"=4, "Dunedin"=5),
                   selected = 1)
    ),
    
    mainPanel(
      dataTableOutput('resultTable')
    )
  )
))
