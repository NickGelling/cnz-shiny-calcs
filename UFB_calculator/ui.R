
# UFB CALCULATOR #

# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Ultra-fast broadband: how fast do you need?"),
  
  # # Layout with sidebar
  # sidebarLayout(
  #   sidebarPanel(
  #      radioButtons("techRadio",
  #                  "Please choose a broadband technology:",
  #                  choices = list("ADSL"=1, "VDSL"=2, "UFB 30MBps"=3, "UFB 100MBps"=4, 
  #                                 "UFB 200MBps"=5, "UFB 1GBps"=6, "UFB 10GBps"=7),
  #                  selected = 1),
  #      
  #      helpText("Now select some media, and we'll tell you how long it would 
  #               take to download."),
  # 
  #      sliderInput("photos",
  #                   "Photos:",
  #                   min=0, max=100, value=10),
  #      
  #      sliderInput("songs",
  #                  "Songs:",
  #                  min=0, max=1000, value=100),
  #      
  #      sliderInput("games",
  #                  "Games:",
  #                  min=0, max=3, value=1),
  #      
  #      sliderInput("HDfilms",
  #                  "High-definition movies:",
  #                  min=0, max=5, value=0),
  #      
  #      sliderInput("UHDfilms",
  #                  "Ultra high-definition movies:",
  #                  min=0, max=3, value=0)
  #   ),
  # 
  #   mainPanel(
  #     verbatimTextOutput('resultText')
  #   )
  # )
  
  # Layout with three columns
  fluidRow(
    column(4, 
           wellPanel(
             radioButtons("techRadio",
                          "Please choose a broadband technology:",
                          choices = list("ADSL"=1, "VDSL"=2, "UFB 30MBps"=3, "UFB 100MBps"=4,
                                         "UFB 200MBps"=5, "UFB 1GBps"=6, "UFB 10GBps"=7),
                          selected = 1))),
    
    column(4, 
           wellPanel(
             helpText("Now select some media, and we'll tell you how long it would
                      take to download."),
             
             sliderInput("photos",
                         "Photos:",
                         min=0, max=100, value=10),
             
             sliderInput("songs",
                         "Songs:",
                         min=0, max=1000, value=100),
             
             sliderInput("games",
                         "Games:",
                         min=0, max=3, value=1),
             
             sliderInput("HDfilms",
                         "High-definition movies:",
                         min=0, max=5, value=0),
             
             sliderInput("UHDfilms",
                         "Ultra high-definition movies:",
                         min=0, max=3, value=0))),
    
    column(4, 
           wellPanel(
             textOutput('resultText')))
    
  ))
)
