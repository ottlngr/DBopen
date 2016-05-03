#' @import dplyr
#' @import RJSONIO
#' @import magrittr
getStopID <- function(station = "Berlin Hbf", authKey) {
  station %<>% gsub(" ", "+", .)
  api_url <- paste("http://open-api.bahn.de/bin/rest.exe/location.name?authKey=",authKey,"&lang=de&input=",station,"&format=json", sep="")
  stopID_json <- fromJSON(api_url)
  stopID <- stopID_json$LocationList$StopLocation[[1]][c("name","id")] %>%
    t() %>%
    data.frame(stringsAsFactors = FALSE)
  return(stopID)
}
