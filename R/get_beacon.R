#' Get beacon result for a given timestamp
#'
#' @param ds timestamp to get
#'
#' @return beacon information
#' @export
#'
#' @examples
#' beacon(1500679537)
beacon <- function(ds) {
    beacon_url <- sprintf("https://beacon.nist.gov/rest/record/%s", ds)
    process_beacon_url(beacon_url)
}

#' Get the last beacon record
#'
#' @return last beacon record
#' @md
#' @export
#'
#' @examples
#' beacon_last()
beacon_last <- function() {
   process_beacon_url("https://beacon.nist.gov/rest/record/last")
}

#' Get next beacon record
#'
#' @param ds timestamp to get
#'
#' @return next beacon record
#' @export
#'
#' @examples
beacon_next <- function(ds) {
    ds <- process_timestamp(ds)
    beacon_url <- sprintf("https://beacon.nist.gov/rest/record/next/%s", ds)
    process_beacon_url(beacon_url)
}

#' Get previous beacon record
#'
#' @param ds timestamp to get
#'
#' @return previous beacon record
#' @export
#'
#' @examples
beacon_previous <- function(ds) {
    ds <- process_timestamp(ds)
    beacon_url <- sprintf("https://beacon.nist.gov/rest/record/previous/%s", ds)
    process_beacon_url(beacon_url)
}

#' Get start of chain record
#'
#' @param ds timestamp to get
#'
#' @return start of chain record
#' @export
#'
#' @examples
beacon_start_chain <- function(ds) {
    ds <- process_timestamp(ds)
    beacon_url <- sprintf("https://beacon.nist.gov/rest/record/start-chain/%s", ds)
    process_beacon_url(beacon_url)
}

#' Validate beacon object
#'
#' @param x beacon object
#'
#' @return boolean; TRUE if input is a valid beacon object.
#' @export
#'
#' @examples
#' y <- beacon(1500679537)
#' beacon_validate(y)
beacon_validate <- function(x) {
    msg <- paste0(x$version, x$frequency, x$timeStamp, x$seedValue, x$previousOutputValue)
}
