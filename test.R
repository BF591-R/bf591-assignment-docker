library(tibble)
library(readr)
library(testthat)

args <- commandArgs(trailingOnly=TRUE)

main_fn <- args[1] # we don't use this yet
test_fn <- args[2]
out_fn <- args[3]

# this function runs the tests in test_fn and creates a tibble
# containing information about all the tests that were run
generate_report <- function(test_fn) {
  
  res <- testthat::test_file(test_fn, stop_on_failure=FALSE)
  
  do.call(
    rbind,
    lapply(res,
       function(r) {
         do.call(
             rbind,
             lapply(r$results,
               function(test) {
                 c(
                   result=gsub("expectation_", "", class(test)[1]),
                   test=test$test,
                   message=gsub("\n"," ",test$message)
                 )
               }
          )
        ) %>% data.frame()
      }
    )
  ) %>% as_tibble(rownames="testnum")
}


res <- generate_report(test_fn)

readr::write_csv(res, file=out_fn)
