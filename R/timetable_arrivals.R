timetable_arrivals <- function(station, direction, date, time, authkey, reference = FALSE, lang = "de", format = "json") {

  # Check function arguments
  if (missing(station)) { message("No station supplied.") }
  if (is.numeric(station)) { station <- as.character(station) }
  if (missing(date)) { message("No date supplied. Assuming tomorrow.") }
  if (!is.character(date)) { message("Date must be supplied as a character string: YYYY-MM-DD") }
  if (missing(time)) { message("No time supplied. Assuming 12 a.m..") }
  if (!is.character(time)) { message("Time must be supplied as a character string: HH:MM") }
  if (missing(authkey)) { message("No authentication supplied.") }
  if (!is.character(authkey)) { message("Authentication key must be a character string.") }
  if (lang != "de") { message("Argument for 'lang' not supported.") }
  if (format != "json") { message("Argument for 'format' not supported.") }
  if (!missing(direction)) { if (is.numeric(direction)) { direction <- as.character(direction) }}


  api_id <- station
  api_direction <- ifelse(missing(direction), FALSE, direction)
  api_date <- date
  api_time <- time
  api_ĺang <- lang
  api_format <- format
  api_call <- paste("https://open-api.bahn.de/bin/rest.exe/arrivalBoard?authKey=", authKey, "&lang=", api_lang, "&id=", api_id, "&date=", api_date, "&time=", api_time, "&format=", api_format, sep = "")
  if (api_direction != FALSE) {
    api_call <- paste(api_call, "&direction=", api_direction, sep = "")
  }
  api_result <- jsonlite::fromJSON(api_call)

  if (reference == FALSE) {
    return(api_result$ArrivalBoard$Arrival[,1:8])
  } else {
    return(cbind(api_result$ArrivalBoard$Arrival[,1:8], ref = as.character(api_result$ArrivalBoard$Arrival$JourneyDetailRef$ref)))
  }

}
