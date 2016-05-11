#' Fetch an arrival board
#'
#' Fetch an arrival board from the DB-Open-Data timetable API and corresponding references.
#'
#' @param stopID character, \code{stopID} found with \code{getStopID}.
#' @param date character, set the date to fetch an arrival board for in \code{"YYYY-MM-DD"} format. Default uses \code{Sys.time()}.
#' @param time character, set the earliest arrival time in \code{"HH:MM"} format. Default uses \code{Sys.time()}.
#' @param authKey character, authentication key for the DB-Open-Data timetable API.
#' @param refs logical, if \code{TRUE} additional references will be fetched. Default is \code{FALSE}.
#' @author Philipp Ottolinger
#' @return A data.frame if \code{refs = FALSE} or a list if {refs = TRUE}.
#' @details \code{arrivalBoard()} will fetch an arrival board for a given \code{date} containing the next 20 arrivals at a certain station (\code{stopID}) beginning from the given \code{time}. Additionally further train-specific references can be fetched with \code{refs = TRUE}. These can be used with \code{journeyDetails()}.
#' @import dplyr
#' @import RJSONIO
#' @import magrittr
#' @export arrivalBoard
#' @examples
#' \dontrun{
#' arrivalBoard(stopID = "008002549",
#'              date = "2016-12-01",
#'              time = "18:00",
#'              authKey = authKey)
#' }
#' \dontrun{
#' arrivalBoard(stopID = "008002549",
#'              date = "2016-12-01",
#'              time = "18:00",
#'              authKey = authKey,
#'              refs = TRUE)}
arrivalBoard <- function(stopID = "008011160", date = substr(Sys.time() + 1800, 1, 10), time = substr(Sys.time() + 1800, 12, 16), authKey, refs = FALSE) {
  . <- NULL
  name <- NULL
  origin <- NULL
  track <- NULL
  JourneyDetailRef <- NULL
  time %<>% gsub(":","%3a",.)
  api_url <- paste("http://open-api.bahn.de/bin/rest.exe/arrivalBoard?authKey=",authKey,"&lang=de&id=",stopID,"&date=",date,"&time=",time,"&format=json", sep="")
  json <- api_url %>% fromJSON()
  json <- json$ArrivalBoard$Arrival
  arr <- data.frame(name = sapply(json, "[[", "name") %>% as.character() %>% unlist(),
                    type = sapply(json, "[[", "type") %>% as.character() %>% unlist(),
                    stopid = sapply(json, "[[", "stopid") %>% as.character() %>% unlist(),
                    stop = sapply(json, "[[", "stop") %>% as.character() %>% unlist(),
                    time = sapply(json, "[[", "time") %>% as.character() %>% unlist(),
                    date = sapply(json, "[[", "date") %>% as.character() %>% unlist(),
                    origin = sapply(json, "[[", "origin") %>% as.character() %>% unlist(),
                    track = sapply(json, "[[", "track") %>% as.character() %>% unlist(),
                    JourneyDetailRef = sapply(json, "[[", "JourneyDetailRef") %>% as.character() %>% unlist(),
                    stringsAsFactors = F)
  arr[arr == "NULL"] <- NA
  board <- arr %>%
    select(Date = date, Stop = stop, Train = name, From = origin, Time = time, Track = track)
  if (refs == TRUE) {
    refs <- arr %>%
      select(Date = date, Time = time, Train = name, Ref = JourneyDetailRef)
    return(list(arrivalBoard = board, arrivalBoardRef = refs))
  } else {
    return(board)
  }
}
