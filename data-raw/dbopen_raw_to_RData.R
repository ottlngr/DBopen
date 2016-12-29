library(jsonlite)
library(maptools)
library(ggplot2)
library(stringi)

# Stationsdaten
# see http://data.deutschebahn.com/dataset/data-stationsdaten/resource/c96fb971-1d03-4798-9a58-f8d269f8ec7a

url <- "http://download-data.deutschebahn.com/static/datasets/stationsdaten/DBSuS-Uebersicht_Bahnhoefe-Stand2016-07.csv"
stationsdaten <- read.table(url, sep = ";", header = TRUE, stringsAsFactors = FALSE)
stationsdaten <- stringi::stri_trans_general(stationsdaten, "latin-ascii")
save(stationsdaten, file = "./data/stationsdaten.RData")

# Haltestellendaten
# see http://data.deutschebahn.com/dataset/data-haltestellen

url <- "http://download-data.deutschebahn.com/static/datasets/haltestellen/D_Bahnhof_2016_01_alle.csv"
haltestellendaten <- read.table(url, sep = ";", header = TRUE, stringsAsFactors = FALSE)
haltestellendaten <- haltestellendaten[,1:6]
haltestellendaten <- stringi::stri_trans_general(haltestellendaten, "latin-ascii")
save(haltestellendaten, file = "./data/haltestellendaten.RData")

# Netzradar
# see http://data.deutschebahn.com/dataset/data-netzradar

url <- "http://download-data.deutschebahn.com/static/datasets/netzradar/connectivity_2016_11.geojson"
a <- jsonlite::fromJSON(url)
s <- seq_along(a$features$geometry$coordinates)
s <- lapply(s, c)
b <- mapply(FUN = function(x, y) cbind(x, y), x = s, y = a$features$geometry$coordinates)
b <- do.call(rbind, b)
colnames(b) <- c("id", "lon", "lat")
c <- cbind(id = as.numeric(row.names(a$features$properties)), a$features$properties)
netzradar <- merge(b, c, by = "id")
netzradar <- stringi::stri_trans_general(netzradar, "latin-ascii")
save(netzradar, file = "./data/netzradar.RData")

# Luftschadstoffkataster
# see http://data.deutschebahn.com/dataset/luftschadstoffkataster

url <- "http://download-data.deutschebahn.com/static/datasets/luftqualitaet/Luft_V_Fpl2014.zip"
tmp <- tempfile()
download.file(url, tmp)
tmpd <- tempdir()
tmp2 <- unzip(tmp, exdir = tmpd)
luftschadstoffkataster <- maptools::readShapeSpatial(tmp2[grepl(pattern = ".shp", x = tmp2)])
luftschadstoffkataster@data$id <- rownames(luftschadstoffkataster@data)
luftschadstoffkataster.points <- ggplot2::fortify(luftschadstoffkataster)
luftschadstoffkataster <- merge(luftschadstoffkataster.points, luftschadstoffkataster@data, by="id")
luftschadstoffkataster.points <- NULL
luftschadstoffkataster <- stringi::stri_trans_general(luftschadstoffkataster, "latin-ascii")
save(luftschadstoffkataster, file = "./data/luftschadstoffkataster.RData")

# Sensordaten Seefracht
# see http://data.deutschebahn.com/dataset/data-sensordaten-schenker-seefrachtcontainer

url <- "http://download-data.deutschebahn.com/static/datasets/sensordaten_schenker/161209_Schenker_Sensordaten.csv"
sensordaten <- read.table(url, sep = ",", header = TRUE, stringsAsFactors = FALSE)
sensordaten <- stringi::stri_trans_general(sensordaten, "latin-ascii")
save(sensordaten, file = "./data/sensordaten.RData")
