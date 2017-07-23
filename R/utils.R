#' Parse beacon url
#'
#' @param beacon_url url to parse
#'
#' @return parsed result from a given URL on beacon website
#'
#' @examples
process_beacon_url <- function(beacon_url) {
    res <- httr::content(httr::GET(beacon_url), encoding = "UTF-8")
    parsed <- xml2::as_list(res)
    lapply(parsed, unlist)
}

#' Process timestamp
#'
#' @param ds timestamp or beacon result
#'
#' @return timestamp
#'
#' @examples
#' process_timestamp("abc")
process_timestamp <- function(ds) {
    if(is.list(ds)) {
        if(!is.null(ds$timeStamp)) {
            ds <- ds$timeStamp
        } else {
            stop("invalid list passed")
        }
    }
    stopifnot(is.numeric(ds), "invalid timestamp passed")
    ds
}
