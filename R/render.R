depends <- c("rmarkdown", "knitr")

if (!require("pacman")) install.packages("pacman")
pacman::p_load(depends, character.only = T)

## ---- purl-rmd ----
file <- "example-rmd1"
for(docu in 0:2){
    knitr::purl(input = paste0("Rmd/", file, ".Rmd"), 
                output = paste0("R/", file, "_", docu,".R"), 
                documentation = docu)
}



## ---- render-rmd ----
file <- "presentation"
render(input = paste0("Rmd/", file, ".Rmd"),
       html_document(theme = "journal"),
       output_file = paste0("../handout/", file, ".html"))

## ---- spin-r ----
spin("R/example-3_r2html.R")
