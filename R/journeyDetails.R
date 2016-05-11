#' Get details on a specific train
#'
#' Get additional information on a specific train like the rooute, stops, arrival and departure times.
#'
#' @param ref, references URL from \code{departureBoard(..., refs = TRUE)$departureBoardRef} or \code{arrivalBoard(..., refs = TRUE)$arrivalBoardRef}.
#' @author Philipp Ottolinger
#' @details \code{journeyDetails()} lets you get further information on a specific train. It requires a reference URL fetched with \code{departureBoard()} or \code{arrivalBoard()} and fetches the respective journey details from the API.
#' @import RJSONIO
#' @import dplyr
#' @import magrittr
#' @export journeyDetails
#' @examples
#' \dontrun{
#' dep <- departureBoard(stopID = "008002549",
#'                       date = "2016-12-01",
#'                       time = "08:00",
#'                       authKey = authKey,
#'                       refs = TRUE)
#' journeyDetails(dep$departureBoardRef$Ref[1])
#' }
journeyDetails <- function(ref) {
  ref_url <- ref
  journey <- ref_url %>%
    as.character() %>%
    fromJSON()
  journey <- journey$JourneyDetail$Stops$Stop
  journey <- data.frame(name = journey %>% sapply("[", "name") %>% as.character(),
                        id = journey %>% sapply("[", "id") %>% as.character(),
                        lon = journey %>% sapply("[", "lon") %>% as.numeric(),
                        lat = journey %>% sapply("[", "lat") %>% as.numeric(),
                        routeIdx = journey %>% sapply("[", "routeIdx") %>% as.numeric(),
                        arrTime = journey %>% sapply("[", "arrTime") %>% as.character(),
                        arrDate = journey %>% sapply("[", "arrDate") %>% as.character(),
                        depTime = journey %>% sapply("[", "depTime") %>% as.character(),
                        depDate = journey %>% sapply("[", "depDate") %>% as.character(),
                        track = journey %>% sapply("[", "track") %>% as.character(),
                        stringsAsFactors = F)
  return(journey)
}
