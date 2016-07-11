library(shiny)
library(rattle)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Iris prediction"),
    
    sidebarPanel(
      h4("Move the sliders to recalculate the prediction
         "),
      sliderInput(
        inputId = "sl_in", 
        label = "Sepal Length", 
        value = 6, 
        min = 2.5,
        max = 9.5,
        step = 0.1
      ),
      sliderInput(
        inputId = "sw_in", 
        label = "Sepal Width", 
        value = 3, 
        min = 1,
        max = 5,
        step = 0.1
      ),
      sliderInput(
        inputId = "pl_in", 
        label = "Petal Length", 
        value = 4, 
        min = 0.1,
        max = 8,
        step = 0.1
      ),
      sliderInput(
        inputId = "pw_in", 
        label = "Petal Width", 
        value = 2, 
        min = 0.1,
        max = 4,
        step = 0.1
      ),
      h4("Prediction: "),
      verbatimTextOutput("pred")
    ),
    mainPanel(
      h3("Tree-based prediction model applied to the Iris dataset"),
      p("A simple prediction model has been applied to the Iris dataset using the rpart method from the caret package. Below you can see the decision tree from that model, and by selecting specific values on the left, you can see what the resulting prediction is for those values."),
      h4("Results of the tree model:"),
      plotOutput('tree1')
    )
  )
)