test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("output is numeric", {
  expect_true(is.numeric(my_rf_cv(5)))
})
