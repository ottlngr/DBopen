#' @name haltestellendaten
#' @title List of all stations of the DB Station&Service AG.
#'
#' @format A \code{data.frame} with 6598 observations and 6 variables:
#' \describe{
#'   \item{EVA_NR}{Internal station ID.}
#'   \item{DS100}{Corresponding railway system.}
#'   \item{NAME}{Name of the station.}
#'   \item{VERKEHR}{Type of traffic: "FV" = also long-distance traffic, "RV" = regional traffic only, "nur DPN" = private regional traffic only.}
#'   \item{LAENGE}{The station's longitude (WGS84).}
#'   \item{BREITE}{The station's latitude (WGS84).}
#' }
#'
#' @references \url{http://data.deutschebahn.com/dataset/data-haltestellen}
#' @source \url{http://download-data.deutschebahn.com/static/datasets/haltestellen/D_Bahnhof_2016_01_alle.csv}
"haltestellendaten"

#' @name stationsdaten
#' @title List of all stations with addresses.
#'
#' @format A \code{data.frame} with 5372 observations and 10 variables:
#' \describe{
#'   \item{Bundesland}{The respective federal state.},
#'   \item{BM}{The respective station management.}
#'   \item{Bf..Nr.}{Unique station number.}
#'   \item{Station}{Name of the station.},
#'   \item{Bf.DS.100.Abk.}{Corresponding railway system.}
#'   \item{Kat..Vst}{Station category.},
#'   \item{Straße}{Street, as part of address.}
#'   \item{PLZ}{Postcode, as part of address.},
#'   \item{Ort}{City, as part of address.}
#'   \item{Aufgabenträger}{Constractor.}
#' }
#'
#' @references \url{http://data.deutschebahn.com/dataset/data-stationsdaten}
#' @source \url{http://download-data.deutschebahn.com/static/datasets/stationsdaten/DBSuS-Uebersicht_Bahnhoefe-Stand2016-07.csv}
"stationsdaten"
