library(readr)
bmi <- read_csv("C:/Users/Nabil Ramlan/Desktop/Sem 4/IDS/Assignment/Shiny apps/Shiny apps/bmi.csv")
library(ggplot2)
library(plotrix)
source("./bmi.R")
function(input, output) {
  gender <- (bmi$sex)
  height <- (bmi$height)
  weight <- (bmi$weight)
  category <- (bmi$category)
  
  bmi <- function(height, weight){
    bmi = weight/(height*0.01)^2
    as.numeric(bmi)
    return (round(bmi,digits=0.5))
    
  }
  round1 <- table(category)/201*100
  round2 <- table(gender)/201*100
  
  percent1 <- round(round1,digits = 0.5)
  percent2 <- round(round2,digits = 0.5)

  

  output$input <- renderText({
      unit.weight = "kg"
      unit.height = "m"
    paste0("You are ", "<strong>",input$mass, " ", unit.weight, " @ ", input$height, " ", unit.height, "</strong>")
  })
  
  output$Plot1 <- renderPlot({
    
    barplot(xtabs(~gender),ylim = c(0,120),ylab = "Frequency", main = "Gender",col = rainbow(4))
    
    })
  
  output$result <- renderText({
    bmi1 = bmi1(mass = input$mass, height = input$height)
    
    if      (bmi1 <  15.0) info = "<span style='color: red'>Very severely underweight</span>" 
    else if (bmi1 <= 16.0) info = "<span style='color: red'>Severely underweight</span>"
    else if (bmi1 <= 18.5) info = "<span style='color: orange'>Underweight</span>"
    else if (bmi1 <= 25.0) info = "<span style='color: green'>Normal (healthy weight)</span>"
    else if (bmi1 <= 30.0) info = "<span style='color: orange'>Overweight</span>"
    else if (bmi1 <= 35.0) info = "<span style='color: red'>Obese Class I (Moderately obese)</span>"
    else if (bmi1 <= 40.0) info = "<span style='color: red'>Obese Class II (Severely obese)</span>"
    else                  info = "<span style='color: red'>Obese Class III (Very severely obese)</span>"
  
  
  paste0("Your BMI is ", "<code>", round(bmi1, 2), "</code>", ", which is: ", info)
  })
  output$result1 <- renderText({
    bmi1 = bmi1(mass = input$mass, height = input$height)
  if      (bmi1 <  15.0) info1 = "You need 3,361 Calories/day to gain 1 kg per week. " 
  else if (bmi1 <= 16.0) info1 = "You need 3,361 Calories/day to gain 1 kg per week. "
  else if (bmi1 <= 18.5) info1 = "You need 3,361 Calories/day to gain 1 kg per week. "
  else if (bmi1 <= 25.0) info1 = "Stay Healthy :)"
  else if (bmi1 <= 30.0) info1 = "You need 1,861 Calories/day to lose 0.5 kg per week"
  else if (bmi1 <= 35.0) info1 = "You need 1,861 Calories/day to lose 0.5 kg per week"
  else if (bmi1 <= 40.0) info1 = "You need 1,361 Calories/day to lose 1 kg per week"
  else                  info1 = "You need 1,361 Calories/day to lose  1 kg per week"
  paste0(info1)
})
  output$result2 <- renderText({paste0("You can set other input if you like")})
  
  output$Plot2 <- renderPlot({
    
    barplot(xtabs(~category),ylim = c(0,160),ylab = "Frequency", main = "category",col = rainbow(4))
  })
  
  output$Plot3 <- renderPlot({
    
    hist(bmi(height,weight),breaks = 10,ylim = c(0,80), xlim = c(10,40), ylab = "Frequency", xlab = "BMI", col = "grey",main="histogram")
    
  })
  
  output$Plot4 <- renderPlot({
    
    pie3D(percent1,col = rainbow(4), explode=0.1, labels = percent1, main = "Percentage (%)")
  })
  
}
  
    
  
   
  
 

  

  