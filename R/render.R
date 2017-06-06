depends <- c("markdown", "knitr")

if (!require("pacman")) install.packages("pacman")
pacman::p_load(depends, character.only = T)

file <- "example-rmd1"
for(docu in 1:3){
    knitr::purl(input = paste0("Rmd/", file, .Rmd"), 
                output = paste0("R/", file, "_", docu,".R"), 
                documentation = docu)
}


