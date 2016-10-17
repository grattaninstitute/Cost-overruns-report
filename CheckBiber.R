if (FALSE && any(grepl("WARN", readLines("HP-Cost-overruns-report.blg")) && !grepl("2000--2015", readLines("HP-Cost-overruns-report.blg"))))
  stop("biber emitted warnings.")
