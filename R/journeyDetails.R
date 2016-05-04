#' Get details on a specific train
#'
#' Get additional information on a specific train like the rooute, stops, arrival and departure times.
#'
#' @param refs data.frame, references table from \code{departureBoard(..., refs = TRUE)$departureBoardRef} or \code{arrivalBoard(..., refs = TRUE)$arrivalBoardRef}.
#' @param Train character, train name as found in departure board or arrival board.
#' @author Philipp Ottolinger
#' @details \code{journeyDetails()} lets you get further information on a specific train. It requires a table with reference URLs fetched with \code{departureBoard()} or \code{arrivalBoard()}. The function will choose the URL corresponding to the given train name (\code{Train}) and fetch the data from the API.
#' @import RJSONIO
#' @import dplyr
#' @import magrittr
#' @export journeyDetails
journeyDetails <- function(refs, Train) {
  ref_url<- refs[refs$Train == Train,]$Ref
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
