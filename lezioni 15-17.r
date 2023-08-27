# LEZIONE 15 ----------------------------------------------------------------------------------------------
# TELERILEVAMENTO LASER LiDAR
# codice R per analizzare i dati di telerilevamento laser
# creiamo un CHM = canopy height model
library(raster)
library(ggplot2)
library(viridis)
library(RStoolbox)
install.packages(lidR)
library(lidR) # per visualizzare la nuvola di punti
setwd("C:/Users/sofia/Desktop/lab")

# carichiamo i dati del 2013
dsm_2013 <- raster("C:/Users/sofia/Desktop/lab/2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013
dtm_2013 <- ("C:/Users/sofia/Desktop/lab/2013Elevation_DigitalTerrainModel-0.5m.tif")
dtm_2013
plot(dtm_2013)

# ricaviamo dai dati dsm e dtm la chm 2013:
chm_2013 <- dsm_2013 - dtm_2013
chm_2013

# plot chm 2013 con ggplot2
ggplot() +
geom_raster(chm_2013, mapping = aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("CHM 2013 San Genesio")

# carichiamo i dati del 2004
dsm_2004 <- raster("C:/Users/sofia/Desktop/lab/2004Elevation_DigitalElevationModel-2.5m.tif")
dsm_2004
dtm_2004 <- raster("C:/Users/sofia/Desktop/lab/2004Elevation_DigitalTerrainModel-2.5m.tif")
dtm_2004

# ricaviamo dai dati dsm e dtm la chm 2004:
chm_2004 <- dsm_2004 - dtm_2004
chm_2004

# plot chm 2004 con ggplot2
ggplot() +
geom_raster(chm_2004, mapping = aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("CHM 2004 San Genesio")

# confrontiamo le due CHM
# difference in CHM
dif-chm <- chm_2013 - chm_2004 # ERRORE!!! i due raster hanno risoluzione diversa

# dobbiamo fare un resample del dato
# resemple dimensione dati 2013 in dimensione dati 2004
chm_2013r <- resample(chm_2013, chm_2004)
# CALCOLO DIFFERENZA CORRETTA
dif_chm <- chm_2013r - chm_2004

ggplot() +
geom_raster(dif_chm, mapping = aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("CHM difference San Genesio")

# rappresentiamo i dati con la point cloud
# leggiamo la point cloud
point_cloud <- readLAS("C:/Users/sofia/Desktop/lab/LIDAR-PointCloudCoverage-2013SolarTirol.laz")

#plot point cloud
plot(point_cloud)

# maggiore variazione in altezza delle piante = maggior biodiversità 
#------------------------------------------------------------------------------------------------------------