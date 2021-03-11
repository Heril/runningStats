#!/usr/bin/Rscript
options(digits = 3)

stdin <- file('stdin')
open(stdin)

sumval <- 0
# match pattern from the check.numeric function of the GPL CRAN package varhandle
# https://bitbucket.org/mehrad_mahmoudian/varhandle/wiki/Home
matchval <- "(^(-|\\+)?((\\.?\\d+)|(\\d+\\.\\d+)|(\\d+\\.?))$)|(^(-|\\+)?((\\.?\\d+)|(\\d+\\.\\d+)|(\\d+\\.?))e(-|\\+)?(\\d+)$)"
values <- c()
sumsq <- 0
nval <- 0
continue <- TRUE
while (continue) {
  readval <- readLines(stdin, warn = FALSE, n = 1)
  if (readval != "" & grepl(pattern = matchval, readval)) {
    readval <- as.numeric(readval)
    sumval <- sumval + readval
    sumsq <- sumsq + readval^2
    values <- c(values, readval)
    nval <- nval + 1
    cat(sprintf(sumval/nval, fmt = '%#.3f'), sprintf(sqrt(sumsq/nval - (sumval/nval)^2), fmt = '%#.3f'), median(values))
    cat("\n", sep = "")
  } else if (readval == "") {
    continue <- FALSE
  }
}
