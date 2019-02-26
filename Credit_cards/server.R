
# CREDIT CARD REWARDS CALCULATOR #

#### IMPORTANT ####
#
# Please check and update all subscripts as the program doesn't handle these
#
###################

# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.

library(DT)
library(shiny)

shinyServer(function(input, output) {
  
  output$resultTable <- DT::renderDataTable({
    
    spend = as.numeric(input$spendBox)
    
    type = c("flights", "shopping", "cashback")[as.numeric(input$typeRadio)]
    data = read.csv(paste0(type,'.csv'))
    
    if(type=="cashback"){
      ind = which(data$Bank == "ANZ")
      if(spend<5000){ data$Points.per.dollar[ind] = Inf
      } else if(spend<10000){ data$Points.per.dollar[ind] = 200 }
    }
    
    points = spend*data$Rate
    if(type=="cashback" && spend>30000){
      ind = which(data$Capped==1)     # catching the cap on ANZ Cashback Visa
      points[ind] = 30000*data$Rate[ind]
    }
    
    netReward = points/data$Points.per.dollar-(data$Annual.Fee+data$Annual.Scheme.Fee)
    netReward2yr = round(2*netReward)
    results = data.frame("Card"=data$Card.Name, "Reward"=netReward2yr)
    
    return(results)
    
  }, options=list(pageLength=25, order=list(1,'desc')), rownames=F, escape=F)
  
})
