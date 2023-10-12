library(testthat)

source('main.R')

describe("add3", {
  it("adds 3 to 3 and gets 6", {
      expect_equal(add3(3), 6)
  })
  it("add 3 to a vector of numbers", {
     expect_equal(add3(c(1,2,3)),c(4,5,6))
  })
  it("fails when given invalid input", {
     expect_error(add3("3"))
  })
})
