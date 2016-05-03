plotJourney <- function(journey) {
  journey$time <- ifelse(!is.na(journey$depTime), journey$depTime, journey$arrTime)
  ger <- get_map(location = c(5.14,47.13,15.36,55.25), zoom = 6, maptype = "toner-background")
  gg <- ggmap(ger) +
    geom_point(data = journey, aes(x = lon, y = lat), size = 3, colour = "blue") +
    geom_path(data = journey, aes(x = lon, y = lat), size = 1, colour = "blue") +
    geom_text_repel(data = journey, aes(x = lon, y = lat, label = paste(name)), colour = "red2", nudge_x = -2) +
    geom_text_repel(data = journey, aes(x = lon, y = lat, label = paste(time)), colour = "red2", nudge_x = 1)
    # annotate("text",
    #          x = journey$lon,
    #          y = journey$lat,
    #          label = journey$time,
    #          size = 3,
    #          hjust = -0.5,
    #          color = "red2") +
    # annotate("text",
    #          x = journey$lon,
    #          y = journey$lat,
    #          label = journey$name,
    #          size = 3,
    #          hjust = 1.2,
    #          colour = "red2")
  return(gg)
}
