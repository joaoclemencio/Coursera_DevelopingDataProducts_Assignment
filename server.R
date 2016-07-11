library(shiny)

iris_predict <- function(sl, sw, pl, pw){
  predict(train(Species ~ ., data=iris, method="rpart"), data.frame(Sepal.Length = sl, Sepal.Width = sw, Petal.Length = pl, Petal.Width = pw))
}

shinyServer(
  function(input, output) {
    output$pred <- reactive({
      as.character(iris_predict(input$sl_in, input$sw_in, input$pl_in, input$pw_in))
    })
    output$tree1 <- renderPlot(fancyRpartPlot(iris_rpart$finalModel))
  }
)




# data.frame(
#   sd_min = t(data.frame(lapply(iris[,-5], mean))) - (4 * t(data.frame(lapply(iris[,-5], sd)))),
#   min = t(data.frame(lapply(iris[,-5], min))),
#   mean = t(data.frame(lapply(iris[,-5], mean))),
#   max = t(data.frame(lapply(iris[,-5], max))),
#   sd_max = t(data.frame(lapply(iris[,-5], mean))) + (4 * t(data.frame(lapply(iris[,-5], sd))))
# )
