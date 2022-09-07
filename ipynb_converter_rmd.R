# Convert ipynb (R) codes into Markdown, to run them locally (not on Google Colab)
rm(list=ls())

library(tidyverse)

files <- list.files()
R_notebooks <- files[str_detect(files, ".+\\(R\\).+\\.ipynb")]

for (r in R_notebooks){
  nb_rmd <- rmarkdown:::convert_ipynb(r)
  rmd <- xfun::file_string(nb_rmd)
  
  write(rmd, file = str_replace(r, "\\.ipynb", "\\.rmd"))
}

# The End