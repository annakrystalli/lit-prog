## ----analysis-setup------------------------------------------------------
library(datasets)
library(ggplot2)


## ----plot-data-----------------------------------------------------------
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()


## ----model---------------------------------------------------------------
set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)

## ----results-table-------------------------------------------------------
table(irisCluster$cluster, iris$Species)

## ----results-plot--------------------------------------------------------
irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, 
                 color = irisCluster$cluster,
                 shape = Species)) + 
    geom_point()

