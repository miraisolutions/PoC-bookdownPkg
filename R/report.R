#' Report Path
#'
#' Construct the path to the R Markdown source file of a given report.
#'
#' @param report The name of the report, without the `".Rmd"` extension.
#'
#' @return The path to the desired R Markdown file.
#'
#' @export
report_path <- function(report) {
  report <- sprintf("%s.Rmd", report)
  file.path(system.file("reports", report, package = "PoCbookdownPkg"))
}

#' Render Report
#'
#' Render a given report to HTML.
#'
#' @inheritParams report_path
#' @param output_dir The output directory for the rendered report.
#' @param ... Additional arguments to be passed to [rmarkdown::render()].
#'
#' @return The path to the produced report.
#'
#' @examples
#' output <- render_report(
#'   "ith-report", params = list(i = 12358L), output_dir = tempfile()
#' )
#' if (interactive()) browseURL(output)
#'
#' @export
render_report <- function(report, ..., output_dir = ".") {
  rmarkdown::render(report_path(report), output_dir = output_dir, ..., )
}
