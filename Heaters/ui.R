
# HEATER SIZE CALCULATOR #

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
  titlePanel("What size heater?"),
  h5("Our calculator lets you estimate the capacity of heater you'll need to maintain a 
     comfortable temperature."),
  
  # Layout with three columns
  fluidRow(
    column(4, 
           wellPanel(
             helpText("Measure the width, depth and height of the room to heat and
     enter them here."),
             sliderInput("widthSlider",
                         "Room width (metres)",
                         min=0, max=10.0, value=3.0, step=0.1),
             sliderInput("depthSlider",
                         "Room depth (metres)",
                         min=0, max=10.0, value=3.0, step=0.1),
             sliderInput("heightSlider",
                         "Ceiling height (metres)",
                         min=0, max=5, value=2.4, step=0.1),
             helpText("Note: Modern NZ ceilings are usually around 2.4m high."))),
    
    column(4, 
           wellPanel(
             helpText("Answer these questions to make your results more accurate."),
             
             radioButtons("typeRadio",
                          "What type of room is it?",
                          choices = list("Living room"=1, "Bedroom"=2, "Other"=3),
                          selected = 1),
             
             radioButtons("ceilingRadio",
                          "Is the ceiling insulated (or is there another room above this one)?",
                          choices = list("Yes"=1, "No"=2, "I don't know"=3),
                          selected = 1),
             
             radioButtons("extRadio",
                          "Are the exterior walls insulated?",
                          choices = list("Yes"=1, "No"=2, "I don't know"=3),
                          selected = 1),
             
             radioButtons("intRadio",
                          "Are any interior walls shared with other heated rooms?",
                          choices = list("Yes"=1, "No"=2),
                          selected = 1),
             
             radioButtons("windowRadio",
                          "Does the room have any large windows?",
                          choices = list("Yes"=1, "No"=2),
                          selected = 1))),
    
    column(4, 
           wellPanel(
             textOutput('resultText')))
    
  ))
)
