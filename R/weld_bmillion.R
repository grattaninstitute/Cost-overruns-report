
weld_bmillion <- function(filename){
  lines <- readLines(filename)
  lines <- gsub("([0-9]) ([bm]illion)", "\\1~\\2", lines)
  writeLines(lines, filename)
}
