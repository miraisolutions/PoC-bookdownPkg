test_that("the whole website can be rendered", {
  skip_if(Sys.getenv("TRAVIS_PULL_REQUEST", "false") == "false")
  render_site(output_dir = tempfile())
})
