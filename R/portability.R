
portability <- function(){
  requiredPackages <- c("assertthat", "betareg", "broom", "car", "chron", "codetools", 
                        "colorspace", "CostOverrunsData", "crayon", "curl", "data.table", 
                        "DBI", "devtools", "digest", "dplyr", "dtplyr", "evaluate", "flexmix", 
                        "foreach", "foreign", "formatR", "Formula", "ggplot2", "glmnet", 
                        "grattan", "gtable", "iterators", "knitr", "lattice", "lazyeval", 
                        "lme4", "lmtest", "logistf", "magrittr", "MASS", "Matrix", "MatrixModels", 
                        "memoise", "mfx", "mgcv", "mice", "minqa", "mnormt", "modeltools", 
                        "munsell", "nlme", "nloptr", "nnet", "pbkrtest", "plyr", "psych", 
                        "quantreg", "R6", "Rcpp", "reshape2", "rpart", "rsconnect", "rstudioapi", 
                        "sandwich", "scales", "SparseM", "stringi", "stringr", "survival", 
                        "testthat", "tibble", "tidyr", "withr", "zoo")
  
  PackagesRequiredByUser <- setdiff(requiredPackages, installed.packages())
  
  if (Sys.getenv("CI") == "true" && Sys.getenv("TRAVIS") == "true") {
    if (length(PackagesRequiredByUser) != 0){
      install.packages(requiredPackages[requiredPackages != "CostOverrunsData"])
      devtools::install_github("hughparsonage/grattan")
      install.packages("./data/CostOverrunsData_0.2.0.tar.gz", repos = NULL, type = "source")
    }
  }
}
