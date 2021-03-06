% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/timetable_arrivals.R
\name{timetable_arrivals}
\alias{timetable_arrivals}
\title{Fetch an arrival board for a specific train station}
\usage{
timetable_arrivals(station, direction, date, time, authkey, reference = FALSE,
  lang = "de", format = "json")
}
\arguments{
\item{station}{character string. Station specific ID from \code{timetable_station()}.}

\item{direction}{character string. Optional. Constrain the arrival board by providing a direction through a station ID from \code{timetable_station()}.}

\item{date}{character string. Set the date of the arrival board. Format: YYYY-MM-DD.}

\item{time}{character string. Set the time of the arrival board. Format: HH:MM.}

\item{authkey}{character string. Authentication key to access the Timetable-API. See Note.}

\item{reference}{logical. If TRUE, additional train specific reference URLs are returned with the arrival board. Default is FALSE.}

\item{lang}{character string. Set the API language. Default is 'de'.}

\item{format}{character string. Set the API format. Default is 'json'.}
}
\value{
A arrival board as a \code{data.frame}.
}
\description{
Provide a station, date and time to receive an arrival board from the DB Timetable-API. Besides usual information, train specific information is provided, too.
}
\note{
To use this function and to access the DB Timetable-API, you need to have an authentication key. Authentication keys can be requested from \code{DBOpenData@deutschebahn.com}.
}
\examples{
\dontrun{
berlin <- timetable_station(pattern  = "Berlin Hbf", authkey = authKey)
timetable_arrivals(station = berlin, date = "2016-12-31", time = "12:00",
                   authkey = authKey)

# receive reference URLs
timetable_arrivals(station = berlin, date = "2016-12-31", time = "12:00",
                   reference = TRUE, authkey = authKey)

# use a direction
hamburg <- timetable_station(pattern  = "Hamburg Hbf", authkey = authKey)
timetable_arrivals(station = berlin, direction = hamburg,
                   date = "2016-12-31", time = "12:00",
                   authkey = authKey)
}


}
\author{
Philipp Ottolinger
}
\references{
\url{http://data.deutschebahn.com/dataset/api-fahrplan}
}
\seealso{
\code{\link{timetable_station}}, \code{\link{timetable_departures}}, \code{\link{timetable_reference}}
}

