
# CAR INSURANCE PREMIUM CALCULATOR #

#### IMPORTANT ####
#
# Please check and update all subscripts as the program doesn't handle these
#
###################

# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.

library(shiny)
library(DT)

shinyServer(function(input, output) {
  
  select <- reactive({
    
    # Insurance type 
    types = c('comprehensive', 'thirdFire', 'third')
    type = types[as.numeric(input$typeRadio)]
    
    # Age
    ages = c('Young', 'Middle', 'Older', 'Family')
    age = ages[as.numeric(input$ageRadio)]
    
    # City
    cities = c('Auckland', 'Hamilton', 'Wellington', 'Christchurch', 'Dunedin')
    city = cities[as.numeric(input$cityRadio)]
    
    # Gender
    genders = c('Men', 'Women')
    gender = genders[as.numeric(input$genderRadio)]
    
    return(list(type=type, age=age, city=city, gender=gender))
    
  })
  
  output$resultTable <- renderDataTable({
    
    selection = select()
    
    data = read.csv(paste0(selection$type,'.csv'))
    
    i1 = which(data[,1]==selection$age)    # which rows have correct age
    i2 = which(data[,2]==selection$city)   # which rows have correct city
    i3 = which(data[,3]==selection$gender) # which rows have correct gender
    
    ifinal = intersect(intersect(i1,i2),i3) # which rows have all three correct
    results = data[ifinal, 4:7]   # extract data
    
    return(results)
    
  }, options=list(pageLength=25, order=list(3,'asc')), rownames=F, escape=F)
  
})
