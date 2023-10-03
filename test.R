library(testthat)

args <- commandArgs(trailingOnly=TRUE)

test_fn <- args[2]

testthat::test_file(test_fn)
testthat::test_file(test_fn, reporter=FailReporter)
