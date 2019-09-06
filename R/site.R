#' Render Site
#'
#' Create a website as collection of reports. This is currently done using the
#' **[bookdown][bookdown::bookdown]** package.
#'
#' @param output_dir The output directory where the website is created. Defaults
#'   to `"_site"`.
#' @param ... Additional arguments to be passed to [bookdown::render_book()].
#'
#' @export
render_site <- function(..., output_dir = "_site") {
  # absolute path of output_dir (which must exist)
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  output_dir <- normalizePath(output_dir)
  input_dir <- system.file("site", package = "PoCbookdownPkg")
  restore_dir <- setwd(input_dir) # returns the wd before the call
  on.exit(setwd(restore_dir))
  bookdown::render_book(".", output_dir = output_dir, clean_envir = FALSE, ...)
}
