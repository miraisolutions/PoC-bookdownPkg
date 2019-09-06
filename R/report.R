#' Construct Report Path
#'
#' Function to construct a path for a given report
#'
#' @param report character string indicating name of the report without extension.
#'
#' @return caracther string indicating the path to the given report.
#'
#' @return None
#'
#' @export
report_path <- function(report) {
  report <- sprintf("%s.Rmd", report)
  file.path(system.file("reports", report, package = "PoCbookdownPkg"))
}

#' Render Report
#'
#' Wrapper around rmarkdown::render to render a report.
#'
#' @param report see [report_path()]
#' @param output_dir string indicating directory where to render html files for website. Default is ".".
#' @param ... additional arguments to be passed to rmarkdown::render .
#'
#' @return None
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
