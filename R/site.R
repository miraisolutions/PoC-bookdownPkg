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
  # clean up output dir if already present
  unlink(output_dir, recursive = TRUE)
  # render the book from a copy of the installed site files, in order not to
  # mess up with the library and make sure they are on the same mount as
  # output_dir, as render_book() uses file.rename()
  input_dir <- file.path(tempfile("_input", output_dir), "site")
  on.exit(unlink(dirname(input_dir), recursive = TRUE))
  dir.create(input_dir, recursive = TRUE)
  file.copy(system.file("site", package = "PoCbookdownPkg"), dirname(input_dir), recursive = TRUE)
  restore_dir <- setwd(input_dir) # returns the wd before the call
  on.exit(setwd(restore_dir), add = TRUE)
  bookdown::render_book(".", output_dir = output_dir, clean_envir = FALSE, ...)
}
