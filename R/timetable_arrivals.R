#' @name timetable_arrivals
#' @title Fetch an arrival board for a specific train station
#' @description Provide a station, date and time to receive an arrival board from the DB Timetable-API. Besides usual information, train specific information is provided, too.
#' @export timetable_arrivals
#'
#' @param station character string. Station specific ID from \code{timetable_station()}.
#' @param direction character string. Optional. Constrain the arrival board by providing a direction through a station ID from \code{timetable_station()}.
#' @param date character string. Set the date of the arrival board. Format: YYYY-MM-DD.
#' @param time character string. Set the time of the arrival board. Format: HH:MM.
#' @param authkey character string. Authentication key to access the Timetable-API. See Note.
#' @param reference logical. If TRUE, additional train specific reference URLs are returned with the arrival board. Default is FALSE.
#' @param lang character string. Set the API language. Default is 'de'.
#' @param format character string. Set the API format. Default is 'json'.
#'
#' @return A arrival board as a \code{data.frame}.
#'
#' @note To use this function and to access the DB Timetable-API, you need to have an authentication key. Authentication keys can be requested from \code{DBOpenData@deutschebahn.com}.
#'
#' @author Philipp Ottolinger
#' @references \url{http://data.deutschebahn.com/dataset/api-fahrplan}
#' @seealso \code{\link{timetable_station}}, \code{\link{timetable_departures}}, \code{\link{timetable_reference}}
#'
#' @importFrom jsonlite fromJSON
#'
#' @examples
#' \dontrun{
#' berlin <- timetable_station(pattern  = "Berlin Hbf", authkey = authKey)
#' timetable_arrivals(station = berlin, date = "2016-12-31", time = "12:00",
#'                    authkey = authKey)
#'
#' # receive reference URLs
#' timetable_arrivals(station = berlin, date = "2016-12-31", time = "12:00",
#'                    reference = TRUE, authkey = authKey)
#'
#' # use a direction
#' hamburg <- timetable_station(pattern  = "Hamburg Hbf", authkey = authKey)
#' timetable_arrivals(station = berlin, direction = hamburg,
#'                    date = "2016-12-31", time = "12:00",
#'                    authkey = authKey)
#' }
#'
#'

timetable_arrivals <- function(station, direction, date, time, authkey, reference = FALSE, lang = "de", format = "json") {

  # Check function arguments
  if (missing(station)) { message("No station supplied.") }
  if (is.numeric(station)) { station <- as.character(station) }
  if (missing(date)) { message("No date supplied. Assuming tomorrow.") }
  if (!is.character(date)) { message("Date must be supplied as a character string: YYYY-MM-DD") }
  if (missing(time)) { message("No time supplied. Assuming 12 a.m..") }
  if (!is.character(time)) { message("Time must be supplied as a character string: HH:MM") }
  if (missing(authkey)) { message("No authentication supplied.") }
  if (!is.character(authkey)) { message("Authentication key must be a character string.") }
  if (lang != "de") { message("Argument for 'lang' not supported.") }
  if (format != "json") { message("Argument for 'format' not supported.") }
  if (!missing(direction)) { if (is.numeric(direction)) { direction <- as.character(direction) }}

  api_id <- station
  api_direction <- ifelse(missing(direction), FALSE, direction)
  api_date <- date
  api_time <- time
  api_lang <- lang
  api_format <- format
  api_call <- paste("https://open-api.bahn.de/bin/rest.exe/arrivalBoard?authKey=", authkey, "&lang=", api_lang, "&id=", api_id, "&date=", api_date, "&time=", api_time, "&format=", api_format, sep = "")
  if (api_direction != FALSE) {
    api_call <- paste(api_call, "&direction=", api_direction, sep = "")
  }
  api_result <- jsonlite::fromJSON(api_call)

  if (reference == FALSE) {
    return(api_result$ArrivalBoard$Arrival[,1:8])
  } else {
    return(cbind(api_result$ArrivalBoard$Arrival[,1:8], ref = as.character(api_result$ArrivalBoard$Arrival$JourneyDetailRef$ref)))
  }

}
