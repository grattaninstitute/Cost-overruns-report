
check_footnote_typography <- function(filename, ignore.lines = NULL){
  lines <- readLines(filename)
  
  combined_lines <- combine_lines(lines)
  
  
  lines_by_footnote <- 
    combined_lines %>%
    grep("\\footnote", ., fixed = TRUE, value = TRUE) %>%
    strsplit(split = "(?=([^\\s]footnote))", perl = TRUE) %>%
    unlist
    
  
  # Check full stops
  for (line in lines_by_footnote){
    footnote_closes_at <- position_of_closing_brace(line = line, prefix = "footnote")
    if (is.infinite(footnote_closes_at))
      break
    split_line_after_footnote <- strsplit(gsub("^.*footnote", "", line, perl = TRUE), split = "")[[1]]
    if (length(split_line_after_footnote) > footnote_closes_at && split_line_after_footnote[footnote_closes_at + 1] %in% c(".", ",")){
      cat(paste0(split_line_after_footnote,
                 collapse = ""),
          "\n")
      stop("Full stop after footnotemark.")
    }
  }
  message("No full stops after footnotemarks")
  rm(line)
  
  for (line in lines){
    if (grepl(" \\footnote", line, fixed = TRUE)){
      cat(line)
      stop("Space before footnote.")
    }
  }
  message("No space before footnote marks")
  
  # Check spaces before footnotes
}


test_that("Detected", {
  expect_error(check_footnote_typography("tests/footnote-bad-full-stop.rnw"), regexp = "Full stop after footnotemark")
})