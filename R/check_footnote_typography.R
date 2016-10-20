
check_footnote_typography <- function(filename, ignore.lines = NULL){
  lines <- readLines(filename)
  
  lines_with_footnotes <- combine_lines(grep("\\footnote", lines, fixed = TRUE, value = TRUE))
  
  # Check full stops
  for (line in lines_with_footnotes){
    footnote_closes_at <- position_of_closing_brace(line = line, prefix = "footnote")
    split_line_after_footnote <- strsplit(gsub("^.*footnote", "", line, perl = TRUE), split = "")[[1]]
    if (split_line_after_footnote[footnote_closes_at + 1] == "."){
      cat(paste0(split_line_after_footnote[seq(footnote_closes_at - 50, 
                                    footnote_closes_at + 1, 
                                    by = 1)],
                 collapse = ""),
          "\n")
      stop("Full stop after footnotemark.")
    }
  }
}


test_that("Detected", {
  expect_error(check_footnote_typography("tests/footnote-bad-full-stop.rnw"))
})