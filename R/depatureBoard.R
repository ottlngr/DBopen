#' @import dplyr
#' @import RJSONIO
#' @import magrittr
departureBoard <- function(stopID = "008011160", date = substr(Sys.time() + 1800, 1, 10), time = substr(Sys.time() + 1800, 12, 16), authKey, refs = FALSE) {
  time %<>% gsub(":","%3a",.)
  api_url <- paste("http://open-api.bahn.de/bin/rest.exe/departureBoard?authKey=",authKey,"&lang=de&id=",stopID,"&date=",date,"&time=",time,"&format=json", sep="")
  json <- api_url %>% fromJSON()
  json <- json$DepartureBoard$Departure
  dep <- data.frame(name = sapply(json, "[[", "name") %>% as.character() %>% unlist(),
                    type = sapply(json, "[[", "type") %>% as.character() %>% unlist(),
                    stopid = sapply(json, "[[", "stopid") %>% as.character() %>% unlist(),
                    stop = sapply(json, "[[", "stop") %>% as.character() %>% unlist(),
                    time = sapply(json, "[[", "time") %>% as.character() %>% unlist(),
                    date = sapply(json, "[[", "date") %>% as.character() %>% unlist(),
                    direction = sapply(json, "[[", "direction") %>% as.character() %>% unlist(),
                    track = sapply(json, "[[", "track") %>% as.character() %>% unlist(),
                    JourneyDetailRef = sapply(json, "[[", "JourneyDetailRef") %>% as.character() %>% unlist())
  dep[dep == "NULL"] <- NA
  board <- dep %>%
    select(Date = date, From = stop, To = direction, Time = time, Train = name, Track = track)
  if (refs == TRUE) {
    refs <- dep %>%
      select(Date = date, Time = time, Train = name, Ref = JourneyDetailRef)
    return(list(departureBoard = board, departureBoardRef = refs))
  } else {
    return(board)
  }
}
