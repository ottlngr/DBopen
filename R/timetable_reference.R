#' @name timetable_reference
#' @title Get detailed information on a specific train
#' @description Use a reference URL from either a departure or an arrival board to get more detailed information on a train.
#' @export timetable_reference
#'
#' @param reference character string. A reference URL from \code{timetable_arrivals()} or \code{timetable_departures()}.
#'
#' @return A \code{list} with journey details.
#'
#' @author Philipp Ottolinger
#' @references \url{http://data.deutschebahn.com/dataset/api-fahrplan}
#' @seealso \code{\link{timetable_departures}}, \code{\link{timetable_arrivals}}, \code{\link{timetable_station}}
#'
#' @importFrom jsonlite fromJSON
#'
#' @examples
#' \dontrun{
#' tt <- timetable_arrivals(station = berlin, direction = hamburg,
#'                          date = "2016-12-31", time = "12:00",
#'                          authkey = authKey, reference = TRUE)
#' timetable_reference(as.character(tt$ref[1]))
#' }

timetable_reference <- function(reference) {
  api_result <- jsonlite::fromJSON(reference)
  return(api_result)
}
