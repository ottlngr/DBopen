#' Get the \code{stopID}
#'
#' Get the \code{stopID} needed for the DB-Open-Data timetable API.
#' @param station character, search a station by name. Default is \code{"Berlin Hbf"}.
#' @param authKey character, authentication key for the DB-Open-Data timetable API.
#' @return A data.frame containing the station name and the respective \code{stopID}.
#' @author Philipp Ottolinger
#' @details Because the timetable API cannot handle station names one has to fetch the respective \code{stopID} first. This \code{stopID} can be used to refer to a certain station.
#' @import dplyr
#' @import RJSONIO
#' @import magrittr
#' @export getStopID
#' @examples
#' \dontrun{
#' getStopID(station = "Hamburg Hbf",
#'           authKey = authKey)
#' }
getStopID <- function(station = "Berlin Hbf", authKey) {
  . <- NULL
  station %<>% gsub(" ", "+", .)
  api_url <- paste("http://open-api.bahn.de/bin/rest.exe/location.name?authKey=",authKey,"&lang=de&input=",station,"&format=json", sep="")
  stopID_json <- fromJSON(api_url)
  stopID <- stopID_json$LocationList$StopLocation[[1]][c("name","id")] %>%
    t() %>%
    data.frame(stringsAsFactors = FALSE)
  return(stopID)
}
