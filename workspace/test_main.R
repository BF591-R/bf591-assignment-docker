library(testthat)

source('main.R')

test_that("metatest", {
  expect_equal(add3(3), 6)
})
