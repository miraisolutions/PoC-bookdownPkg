test_that("get_date_time returns character string", {
  expect_is(get_date_time(), "character")
  expect_length(get_date_time(), 2)
})
