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
