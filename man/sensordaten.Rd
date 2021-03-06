% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{sensordaten}
\alias{sensordaten}
\title{Shipment container location and sensor data. (extract).}
\format{A \code{data.frame} with 27049 observations and 21 variables:
\describe{
  \item{index}{Observation number.}
  \item{SXXJ:number}{Number of GPS device.}
  \item{Container}{Container identifier (deleted).}
  \item{Date}{Date.}
  \item{Time_UTC}{Time.}
  \item{Latitude}{Latitude.}
  \item{Longitude}{Longitude.}
  \item{Accuracy}{Position accuracy.}
  \item{Active}{GPS device active?}
  \item{Reverse}{GPS device in silent mode?}
  \item{Sleep}{GPS device in sleep mode?}
  \item{Door}{Door open?}
  \item{Mount}{GPS device installed?}
  \item{Motion}{Motion sensor.}
  \item{GForce}{G force.}
  \item{Tilt}{Tilt in degrees.}
  \item{Temperature}{Temperature in degrees Celsius.}
  \item{Humidity}{Humidity in percent.}
  \item{Light}{Light inside the container in Lux.}
  \item{Origin}{Container origin (deleted).}
  \item{Destination}{Container destination (deleted).}
}}
\source{
\url{http://download-data.deutschebahn.com/static/datasets/sensordaten_schenker/161209_Schenker_Sensordaten.csv}
}
\usage{
sensordaten
}
\description{
Shipment container location and sensor data. (extract).
}
\references{
\url{http://data.deutschebahn.com/dataset/data-sensordaten-schenker-seefrachtcontainer}
}
\keyword{datasets}

