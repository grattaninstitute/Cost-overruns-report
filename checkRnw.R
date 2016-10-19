
any_unescaped_dollar <- function(lines){
  any(grepl("(?<!\\\\)\\$", lines, perl = TRUE)
}

check_Rnw <- function(filename){
  lines <- readLines(filename)
  
  if (any_unescaped_dollar(lines)){
    stop("Unescaped $ in Rnw file.")
  }
  
}
