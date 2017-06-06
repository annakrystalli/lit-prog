#' ---
#' title: "example-rmd1"
#' author: "Anna Krystalli"
#' date: "06/06/2017"
#' output: html_document
#' ---
#' # All-in-one `.Rdm` example
#' 
#' In this example I keep all the code and annotation in this `.Rmd` document. To extract the analysis workflow code into an `.R` script, I'm going to use function `knitr::purl()`.
#' 
#' Some of the code chunks are useful in the context of this document but I don't really want to export them to the `.R` as part of the workflow. I indicate these chunks by using chunk option `purl = FALSE`.
#' 
#' 
#' ***
#' 
#' ## Analysis description:
#' 
#' For the purposes of this talk I've sourced this example from: https://datascienceplus.com/k-means-clustering-in-r/ and using the `iris` dataset to demo the workflow. 
#' 
#' ####  Background: What is K Means Clustering?
#' 
#' **K Means Clustering** is an unsupervised learning algorithm that tries to cluster data based on their similarity. Unsupervised learning means that there is no outcome to be predicted, and the algorithm just tries to find patterns in the data. In k means clustering, we have to specify the number of clusters we want the data to be grouped into. The algorithm randomly assigns each observation to a cluster, and finds the centroid of each cluster. Then, the algorithm iterates through two steps:
#' Reassign data points to the cluster whose centroid is closest.
#' Calculate new centroid of each cluster.
#' 
#' These two steps are repeated till the within cluster variation cannot be reduced any further. The within cluster variation is calculated as the sum of the euclidean distance between the data points and their respective cluster centroids.
#' 
#' ## Analysis setup
## ----analysis-setup------------------------------------------------------
library(datasets)
library(ggplot2)
library(knitr)

#' 
#' 
#' ## Explore the data
#' 
#' 
#' 
#' 
## ----plot-data-----------------------------------------------------------
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()


#' 
#' 
#' 
#' ## Fit kmeans model
## ----model---------------------------------------------------------------
set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)

#' 
#' ### explore results
#' 
#' 
#' 
## ----results-table-------------------------------------------------------
table(irisCluster$cluster, iris$Species)

#' 
#' ### Plot results
#' 
## ----results-plot--------------------------------------------------------
irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, 
                 color = irisCluster$cluster,
                 shape = Species)) + 
    geom_point()

#' 
