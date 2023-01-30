#' Load all packages and data
#' 
#' Wraps the default load all by also loading all fst files in the data directory.
#' @export
load_all <- function() {
    devtools::load_all()
    Sys.glob("data/*.fst") |>
        stringr::str_extract(pattern = "data/(.*).fst", group = 1) |>
        qload()
}
