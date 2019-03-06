
# HEATER SIZE CALCULATOR #

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
    # Collating info about insulation etc.
    multiplier = 1
    if(input$ceilingRadio != 1){ multiplier = multiplier+0.1 }
    if(input$extRadio != 1){ multiplier = multiplier+0.05 }
    if(input$intRadio != 1){ multiplier = multiplier+0.05 }
    if(input$windowRadio == 1){ multiplier = multiplier+0.1 }    
    
    # multiplier for importance of room warmth
    roomType = c(1.5, 1.2, 0.8)[as.numeric(input$typeRadio)]
    
    wattage = (input$widthSlider * input$depthSlider * input$heightSlider) * 
              45 * multiplier * roomType
     
    msgs = c("A 500W heater should be enough to heat this tiny room.",
            "You'll only need a 1000W heater to warm up this small room.",
            "A 1500W heater will do a good job of warming up this room.",
            "To heat this room efficiently, you'll want a 2000W heater.",
            "To heat this large room, look for a heater with an output of 2400W.",
            "This room will be difficult to heat. A 2400W heater might be enough, 
            but you may have to use two heaters on opposite sides of the room.")
                  
    if(wattage < 500){ msg = msgs[1]
    } else if(wattage < 1000){ msg = msgs[2]
    } else if(wattage < 1500){ msg = msgs[3]
    } else if(wattage < 2000){ msg = msgs[4]
    } else if(wattage < 2400){ msg = msgs[5]
    } else { msg = msgs[6] }
    
    return(msg)
  })
  
  output$resultText <- renderText(outText())
  
})
