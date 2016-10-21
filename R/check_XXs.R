

check_XXs <- function(filename){
  lines <- readLines(filename)
  
  lines_with_XX <- grep("XX+", lines, perl = TRUE, value = FALSE)
  
  for (line in lines_with_XX){
    stop("XX still outstanding", "\n", line, ":", "\t", lines[line])
  }
}