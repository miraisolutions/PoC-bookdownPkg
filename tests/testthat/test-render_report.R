test_that("A parametrized report is produced", {
  output <- render_report(
    "ith-report", params = list(i = 9), output_dir = tempfile()
  )
  expect_true(file.exists(output))
})
