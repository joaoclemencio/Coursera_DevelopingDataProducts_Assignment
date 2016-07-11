---
title       : Assignment for Developing Data Products
subtitle    : Predicting Iris with Trees
author      : Joao Clemencio
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## Iris analysis with a decision tree model

The Iris flower dataset is a famous multivariate data set that classifies three very similar species of plants using 4 measurements.

A classifier was built with a decision tree model to allow a user to interactively predict the correct species by selecting values for the 4 possible parameters:
* Sepal Length
* Sepal Width
* Petal Length
* Petal Width

--- .class #id 

## Exploratory analysis

Here is the relationships between the 4 considered variables, coloured by Species. Some distinct clusters can be observed.

<img src="figure/pairs-1.png" title="plot of chunk pairs" alt="plot of chunk pairs" style="display: block; margin: auto;" />

---

## Model creation

The model was created using the `rpart` method from the `caret` package.


```r
iris_rpart <- train(Species ~ ., data=iris, method="rpart")
print(iris_rpart$finalModel)
```

```
## n= 150 
## 
## node), split, n, loss, yval, (yprob)
##       * denotes terminal node
## 
## 1) root 150 100 setosa (0.33333333 0.33333333 0.33333333)  
##   2) Petal.Length< 2.45 50   0 setosa (1.00000000 0.00000000 0.00000000) *
##   3) Petal.Length>=2.45 100  50 versicolor (0.00000000 0.50000000 0.50000000)  
##     6) Petal.Width< 1.75 54   5 versicolor (0.00000000 0.90740741 0.09259259) *
##     7) Petal.Width>=1.75 46   1 virginica (0.00000000 0.02173913 0.97826087) *
```

---

## Final decision tree

Here is the final decision tree

<img src="figure/tree-1.png" title="plot of chunk tree" alt="plot of chunk tree" style="display: block; margin: auto;" />

--- 

## Prediction examples


```r
iris_mean = data.frame(lapply(iris[,-5], mean)); iris_sd = data.frame(lapply(iris[,-5], sd)); reps = 5
random_iris = data.frame(
  Sepal.Length = rnorm(reps, iris_mean$Sepal.Length, iris_sd$Sepal.Length),
  Sepal.Width  = rnorm(reps, iris_mean$Sepal.Width,  iris_sd$Sepal.Width),
  Petal.Length = rnorm(reps, iris_mean$Petal.Length, iris_sd$Petal.Length),
  Petal.Width  = rnorm(reps, iris_mean$Petal.Width,  iris_sd$Petal.Width))
random_iris$Species_prediction = predict(iris_rpart, random_iris)
print(random_iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species_prediction
## 1     6.013464    3.119629     4.185498   1.0774690         versicolor
## 2     5.350493    3.036795     5.725632   2.9784994          virginica
## 3     5.774412    2.860563     7.533199   1.5283712         versicolor
## 4     4.236310    3.643530     3.566638   0.7954387         versicolor
## 5     5.652879    3.238465     4.538710   2.1374741          virginica
```
