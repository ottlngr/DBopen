timetable_station <- function(pattern, authkey, first = TRUE, lang = "de", format = "json") {

  # Check function arguments
  if (missing(pattern)) { message("No search pattern supplied.") }
  if (!is.character(pattern)) { message("Search pattern must be a character string.") }
  if (missing(authkey)) { message("No authentication supplied.") }
  if (!is.character(authkey)) { message("Authentication key must be a character string.") }
  if (lang != "de") { message("Argument for 'lang' not supported.")}
  if (format != "json") { message("Argument for 'format' not supported.")}


  api_input <- pattern
  api_input <- gsub(" ", "+", api_input)
  api_lang <- lang
  api_format <- format
  api_call <- paste("https://open-api.bahn.de/bin/rest.exe/location.name?authKey=", authKey, "&lang=", api_lang, "&input=", api_input, "&format=", api_format, sep = "")
  api_result <- jsonlite::fromJSON(api_call)
  api_result_stations <- api_result$LocationList$StopLocation

  if (first == TRUE) {
    return(api_result_stations$id[1])
  } else {
    return(api_result_stations)
  }

}

