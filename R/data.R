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
#'   \item{Bundesland}{The respective federal state.}
#'   \item{BM}{The respective station management.}
#'   \item{Bf..Nr.}{Unique station number.}
#'   \item{Station}{Name of the station.}
#'   \item{Bf.DS.100.Abk.}{Corresponding railway system.}
#'   \item{Kat..Vst}{Station category.}
#'   \item{Straße}{Street, as part of address.}
#'   \item{PLZ}{Postcode, as part of address.}
#'   \item{Ort}{City, as part of address.}
#'   \item{Aufgabenträger}{Constractor.}
#' }
#'
#' @references \url{http://data.deutschebahn.com/dataset/data-stationsdaten}
#' @source \url{http://download-data.deutschebahn.com/static/datasets/stationsdaten/DBSuS-Uebersicht_Bahnhoefe-Stand2016-07.csv}
"stationsdaten"

#' @name netzradar
#' @title The German long-distance traffic railway network with information on mobile communications coverage.
#'
#' @format A \code{data.frame} with 119327 observations and 23 variables:
#' \describe{
#'   \item{id}{Track section id.},
#'   \item{lon}{Longitude of the track section.}
#'   \item{lat}{Latitude of the track section}
#'   \item{all_stability}{Network stability for all providers.}
#'   \item{all_measurements}{Number of measurements for all providers.}
#'   \item{all,no4g_stability}{Network stability for all providers, without LTE.}
#'   \item{all,no4g_measurements}{Number of measurements for all providers, without LTE.}
#'   \item{t-mobile_stability}{Network stability for provider T-Mobile.}
#'   \item{t-mobile_measurements}{Number of measurements for provider T-Mobile.}
#'   \item{t-mobile,no4g_stability}{Network stability for provider T-Mobile, without LTE.}
#'   \item{t-mobile,no4g_measurements}{umber of measurements for provider T-Mobile, without LTE.}
#'   \item{vodafone_stability}{Network stability for provider Vodafone.}
#'   \item{vodafone_measurements}{Number of measurements for provider Vodafone.}
#'   \item{vodafone,no4g_stability}{Network stability for provider Vodafone, without LTE.}
#'   \item{vodafoneno4g_measurements}{umber of measurements for provider Vodafone, without LTE.}
#'   \item{e-plus_stability}{Network stability for provider E-Plus.}
#'   \item{e-plus_measurements}{Number of measurements for provider E-Plus.}
#'   \item{e-plus,no4g_stability}{Network stability for provider E-Plus, without LTE.}
#'   \item{e-plus,no4g_measurements}{umber of measurements for provider E-Plus, without LTE.}
#'   \item{o2_stability}{Network stability for provider o2.}
#'   \item{o2_measurements}{Number of measurements for provider o2.}
#'   \item{o2,no4g_stability}{Network stability for provider o2, without LTE.}
#'   \item{o2,no4g_measurements}{umber of measurements for provider o2, without LTE.}
#' }
#'
#' @references \url{http://data.deutschebahn.com/dataset/data-netzradar}
#' @source \url{http://download-data.deutschebahn.com/static/datasets/netzradar/connectivity_2016_11.geojson}
"netzradar"

#' @name luftschadstoffkataster
#' @title Air contaminant cadastre (extract).
#'
#' @format A \code{data.frame} with 445437 observations and 16 variables:
#' \describe{
#'   \item{id}{Section id.}
#'   \item{long}{Longitude of the section.}
#'   \item{lat}{Latitude of the section}
#'   \item{order}{Order of the sections.}
#'   \item{hole}{?}
#'   \item{piece}{?.}
#'   \item{group}{Group of the sections.}
#'   \item{LayerName}{?}
#'   \item{EntityType}{?}
#'   \item{EntityColo}{?}
#'   \item{BlockName}{?}
#'   \item{EntityIsVi}{?}
#'   \item{TextJustif}{?}
#'   \item{MapName}{?}
#'   \item{NOX_kg_a}{Nitric oxide emission, kg per year.}
#'   \item{PM10V_kg_a}{Particle emission, kg per year.}
#' }
#'
#' @references \url{http://data.deutschebahn.com/dataset/luftschadstoffkataster}
#' @source \url{http://download-data.deutschebahn.com/static/datasets/luftqualitaet/Luft_V_Fpl2014.zip}
"luftschadstoffkataster"

#' @name sensordaten
#' @title Shipment container location and sensor data. (extract).
#'
#' @format A \code{data.frame} with 27049 observations and 21 variables:
#' \describe{
#'   \item{index}{Observation number.}
#'   \item{SXXJ:number}{Number of GPS device.}
#'   \item{Container}{Container identifier (deleted).}
#'   \item{Date}{Date.}
#'   \item{Time_UTC}{Time.}
#'   \item{Latitude}{Latitude.}
#'   \item{Longitude}{Longitude.}
#'   \item{Accuracy}{Position accuracy.}
#'   \item{Active}{GPS device active?}
#'   \item{Reverse}{GPS device in silent mode?}
#'   \item{Sleep}{GPS device in sleep mode?}
#'   \item{Door}{Door open?}
#'   \item{Mount}{GPS device installed?}
#'   \item{Motion}{Motion sensor.}
#'   \item{GForce}{G force.}
#'   \item{Tilt}{Tilt in degrees.}
#'   \item{Temperature}{Temperature in degrees Celsius.}
#'   \item{Humidity}{Humidity in percent.}
#'   \item{Light}{Light inside the container in Lux.}
#'   \item{Origin}{Container origin (deleted).}
#'   \item{Destination}{Container destination (deleted).}
#' }
#'
#' @references \url{http://data.deutschebahn.com/dataset/data-sensordaten-schenker-seefrachtcontainer}
#' @source \url{http://download-data.deutschebahn.com/static/datasets/sensordaten_schenker/161209_Schenker_Sensordaten.csv}
"sensordaten"
