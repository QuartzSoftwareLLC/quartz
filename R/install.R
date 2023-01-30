#' Install
#' 
#' Installs a quartzsoftware package from github by repo name
#' @param x The name of the repo
#' @export
install <- function (x) {
    devtools::install_github(sprintf("quartzsoftwarellc/%s", x))
}