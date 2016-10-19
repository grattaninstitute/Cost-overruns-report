detect_hyphens <- function(filename){
  lines <- readLines(filename)
  lines <- gsub("-\\/-", "--", lines, fixed = TRUE)
  if (any(grepl(" - ", lines, fixed = TRUE))){
    warning("Isolated hyphens:")
    for (l in grep(" - ", lines, fixed = TRUE)){
      cat("Line ", l, ":\n")
      cat(lines[l], "\n")
    }
  }
  writeLines(lines, filename)
}