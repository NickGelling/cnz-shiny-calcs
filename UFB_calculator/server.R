
# UFB CALCULATOR #

# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(lubridate)

shinyServer(function(input, output) {
  
  outText <- reactive({
    # Internet speeds in MBps    
    speeds = c(10,20,30,100,200,1000,10000)
    speed = speeds[as.numeric(input$techRadio)]
                   
    # Estimate of total data required
    data = 5*input$photos + 3*input$songs + 4000*input$games +
    5000*input$HDfilms + 60000*input$UHDfilms
    
    numSeconds = round(data/speed)
    
    return(paste('Time taken to download media:', seconds_to_period(numSeconds)))
  })
  
  output$resultText <- renderText(outText())
  
})
