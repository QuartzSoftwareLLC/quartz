get_save_location <- \(x) x |> sprintf(fmt = "data/%s.fst")

#' Quartz Load
#' Reads the object from the data directory into the global namespace using fst.
#' @param x The name of the object to load
#' @return void
#' @export
qload <- \(...)   alist(...) |> 
    substitute() |> 
    eval() |> 
    purrr::map_chr(as.character) |> 
    purrr::map(~ .x |> 
        get_save_location() |>
        fst::read_fst() |>
        tibble::as_tibble() |>
        assign(x = .x, envir = .GlobalEnv))


#' Quartz Read
#' Reads the data frame from the data url using read_csv with caching.
#' @param url The url to read from
#' @return The data frame
#' @export
qread <- \(url) {
    qread <- memoise::memoise(readr::read_csv, cache = cachem::cache_disk("cache"))
    qread(url)
}


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
