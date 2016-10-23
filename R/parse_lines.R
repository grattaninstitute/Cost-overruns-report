

position_of_closing_brace <- function(line, prefix){
  lines_split <- strsplit(gsub(paste0("^.*", prefix), "", line, perl = TRUE), split = "")[[1]]
  min(which(cumsum(lines_split == "{") - cumsum(lines_split == "}") == 0))
}

for (line in lines_by_footnote){
  footnote_closes_at <- grattanReporter:::position_of_closing_brace(line = line, prefix = "footnote")
  split_line_after_footnote <- strsplit(gsub("^.*footnote", "", line, perl = TRUE), split = "")[[1]]
  
  if (length(split_line_after_footnote[footnote_closes_at - 1] != ".") == 0){
    cat(paste0(split_line_after_footnote,
               collapse = ""),
        "\n")
    stop("Argument length 0")
  }
  
  if (split_line_after_footnote[footnote_closes_at - 1] != "."){
    cat(paste0(split_line_after_footnote,
               collapse = ""),
        "\n")
    stop("Footnote does not end with full stop.")
  }
}