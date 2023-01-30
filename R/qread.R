

get_save_location <- \(x) x |> sprintf(fmt = "data/%s.fst")

#' Quartz Read
#' Reads the object from the data directory into the global namespace using fst.
#' @param x The name of the object to read
#' @return void
#' @export
qread <- function(x) {
    x |>
        get_save_location() |>
        fst::read_fst() |>
        assign(x = x)
}

#' Quartz Write
#' Writes the data frame to the data directory using fst.
#' @param x The object to write
#' @export
qwrite <- function(x) {
    if (!dir.exists("data")) dir.create("data")
    x |>
        substitute() |>
        deparse() |>
        get_save_location() |>
        fst::write_fst(x = x)
}
