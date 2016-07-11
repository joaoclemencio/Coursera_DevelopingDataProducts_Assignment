library(shiny)
library(caret)
library(rpart)
library(e1071)

iris_rpart = train(Species ~ ., data=iris, method="rpart")

iris_predict <- function(sl, sw, pl, pw){
  predict(iris_rpart, data.frame(Sepal.Length = sl, Sepal.Width = sw, Petal.Length = pl, Petal.Width = pw))
}

shinyServer(
  function(input, output) {
    output$pred <- reactive({
      as.character(iris_predict(input$sl_in, input$sw_in, input$pl_in, input$pw_in))
    })
    output$tree1 <- renderPlot({
      plot(iris_rpart$finalModel)
      text(iris_rpart$finalModel, use.n = T, all = T)
    })
  }
)
