timetable_reference <- function(reference) {
  api_result <- jsonlite::fromJSON(reference)
  return(api_result)
}
