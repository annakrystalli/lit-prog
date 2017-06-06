## ----analysis-setup------------------------------------------------------
library(datasets)
library(ggplot2)

## ----plot-data-----------------------------------------------------------
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()


## ----model, echo=FALSE---------------------------------------------------
set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)

## ------------------------------------------------------------------------
table(irisCluster$cluster, iris$Species)

