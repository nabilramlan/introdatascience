
# Define UI for application that draws a histogram
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("BMI Analysis"),
    sidebarLayout(
      
     
      
      sidebarPanel(
        
        
      numericInput(
      inputId = "mass",
      label = strong("Your weight:"),
      value = 70
    ),
    
    numericInput(
      inputId = "height",
      label = strong("Your height:"),
      value = 1.80,
      step  = 0.01        )
    ),
    
    mainPanel(
      
      tabsetPanel(                
        tabPanel(h5("BMI Calculator"),
                 uiOutput("input"),
                 uiOutput("result"),
                 uiOutput("result1"),
                 uiOutput("result2")),
        
        tabPanel(h5("Gender"),
                 plotOutput("Plot1")),
        
        tabPanel(h5("Statistics"),
                 plotOutput("Plot4"),
                 plotOutput("Plot2")),
        
        tabPanel(h5("Histogram"), 
                 plotOutput("Plot3"))
                 )
      
      
    )
)))