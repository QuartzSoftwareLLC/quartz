

get_save_location <- \(x) x |> sprintf(fmt = "data/%s.fst")

#' Quartz Load
#' Reads the object from the data directory into the global namespace using fst.
#' @param x The name of the object to load
#' @return void
#' @export
qload <- \(x)   x |>
    get_save_location() |>
    fst::read_fst() |>
    assign(x = x, envir = .GlobalEnv)


#' Quartz Save
#' Writes the data frame to the data directory using fst.
#' @param x The object to write
#' @export
qsave <- function(x,
                  name = x |>
                      substitute() |>
                      as.character()) {
    if (!dir.exists("data")) dir.create("data")
    name |>
        get_save_location() |>
        fst::write_fst(x = x)
}
