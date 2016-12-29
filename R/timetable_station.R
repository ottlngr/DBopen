#' @name timetable_station
#' @title Find a station and its internal ID
#' @description Use a search pattern to find a specific train station in Germany and its internal ID. The internal ID can be used to query the DB Timetable-API.
#' @export timetable_station
#'
#' @param pattern character string. Pattern used to find a specific train station, e.g. 'Berlin'.
#' @param authkey character string. Authentication key to access the Timetable-API. See Note.
#' @param first logical. If TRUE, the ID of the first matching station is returned. If FALSE, a list of stations is returned.
#' @param lang character string. Set the API language. Default is 'de'.
#' @param format character string. Set the API format. Default is 'json'.
#'
#' @return A character string if \code{first = TRUE}. Otherwise a \code{data.frame}.
#'
#' @note To use this function and to access the DB Timetable-API, you need to have an authentication key. Authentication keys can be requested from \code{DBOpenData@deutschebahn.com}.
#'
#' @author Philipp Ottolinger
#' @references \url{http://data.deutschebahn.com/dataset/api-fahrplan}
#' @seealso \code{\link{timetable_departures}}, \code{\link{timetable_arrivals}}, \code{\link{timetable_references}}
#'
#' @importFrom jsonlite fromJSON
#'
#' @examples
#' \dontrun{
#' timetable_station(pattern = "Berlin", authkey = authKey)
#' timetable_station(pattern = "Hamburg", authkey = authKey, first = FALSE)
#' }

timetable_station <- function(pattern, authkey, first = TRUE, lang = "de", format = "json") {

  # Check function arguments
  if (missing(pattern)) { message("No search pattern supplied.") }
  if (!is.character(pattern)) { message("Search pattern must be a character string.") }
  if (missing(authkey)) { message("No authentication supplied.") }
  if (!is.character(authkey)) { message("Authentication key must be a character string.") }
  if (lang != "de") { message("Argument for 'lang' not supported.")}
  if (format != "json") { message("Argument for 'format' not supported.")}


  api_input <- pattern
  api_input <- gsub(" ", "+", api_input)
  api_lang <- lang
  api_format <- format
  api_call <- paste("https://open-api.bahn.de/bin/rest.exe/location.name?authKey=", authKey, "&lang=", api_lang, "&input=", api_input, "&format=", api_format, sep = "")
  api_result <- jsonlite::fromJSON(api_call)
  api_result_stations <- api_result$LocationList$StopLocation

  if (first == TRUE) {
    return(api_result_stations$id[1])
  } else {
    return(api_result_stations)
  }

}

