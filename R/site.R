#' Render Site
#'
#' Function that would create website using bookdown::render_book.
#'
#' @param output_dir string indicating directory where to render html files for website. Default is "_site".
#' @param ... additional arguments to be passed to bookdown::render_book .
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
