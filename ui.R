

# Define UI for application that draws a histogram
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("BMI Analysis (200 data)"),
    sidebarLayout(sidebarPanel(
      
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
      uiOutput("input"),
      uiOutput("result"),
      uiOutput("result1"),
      uiOutput("result2"),
      plotOutput("Plot1"),
      plotOutput("Plot2"),
      plotOutput("Plot4"),
      plotOutput("Plot3")
      
    )
)))