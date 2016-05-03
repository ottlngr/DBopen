arrivalBoard <- function(stopID = "008011160", date = substr(Sys.time() + 1800, 1, 10), time = substr(Sys.time() + 1800, 12, 16), authKey, refs = FALSE) {
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
                    JourneyDetailRef = sapply(json, "[[", "JourneyDetailRef") %>% as.character() %>% unlist())
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
