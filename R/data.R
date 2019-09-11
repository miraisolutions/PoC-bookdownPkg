month_data_path <- function(month) {
  rds <- sprintf("data-%d.rds", month)
  system.file("flights-data", rds, package = "PoCbookdownPkg")
}


#' Month data
#'
#' Returns flight data for the given `month`.
#'
#' @param month Scalar integer defining the month.
#'
#' @return A `data.frame` with the same structure as [`nycflights13::flights`].
#'
#' @examples
#' summary(get_month_data(6))
#'
#' @export
get_month_data <- function(month) {
  readRDS(month_data_path(month))
}

