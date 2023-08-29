# LEZIONE 14-----------------------------------------------------------------------
# l'eterogeneità può essere relazionata alla biodiversità: variazioni spettrali corrispondono a variazioni 
# biologiche e geomofologiche
# quando si lavora con più variabili ci si può ricondurre a una sola interpolando i dati con una retta di 
# interpolazione

# principal component analysis
# uniamo i codici sulla VARIABILITA' e sull'ANALISI MULTIVARIATA

library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
library(viridis)
setwd("C:/Users/sofia/Desktop/lab")
# importa immagine Similaun
sim <- brick("sentinel.png")
# NIR banda 1
# red barra 2
# green barra 3
ggRGB(sim, 1, 2, 3)  
# oppure
ggRGB(sim, 2, 1, 3)  

# passiamo da 3 layer R G B delle bande, a una sola componente principale che compatta le info
# ANALISI MULTIVARIATA
sim_pca <- rasterPCA(sim)
sim_pca

# come sappiamo quanta variabilità è spiegata dalla prima componente della PCA?
summary(sim_pca$model)

#Importance of components:
#                           Comp.1     Comp.2      Comp.3 Comp.4
#Standard deviation     77.3362848 53.5145531 5.765599616      0
#Proportion of Variance  0.6736804  0.3225753 0.003744348      0
#Cumulative Proportion   0.6736804  0.9962557 1.000000000      1

# => bastano due bande per spiegare il 99% del sistema originario
# noi però calcoleremo la variabilità su una sola componente, quindi ci accontenteremo della 1 col 67%

# plot 3 bande (componenti)
plot(sim_pca$map) 

# plot delle 3 componenti con ggplot
# ggplot() +
# geom_raster(sim_pca$map$PC1) # plot prima componente della pca che nella mappa si chiama PC1
# oppure geom_raster(sim_pca$map$[[1]])

pc1 <- sim_pca$map$PC1
pc2 <- sim_pca$map$PC2
pc3 <- sim_pca$map$PC3 

# plottiamo le 3 componenti insieme
g1 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1))

g2 <- ggplot() +
geom_raster(pc2, mapping = aes(x=x, y=y, fill=PC2))

g3 <- ggplot() +
geom_raster(pc3, mapping = aes(x=x, y=y, fill=PC3))

g1 + g2 + g3

# facciamo i calcoli sulla componente che spiega la maggior parte della variabilità del sistema
# DEVIAZIONE STANDARD di PC1
sd3 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
sd3

# plot con ggplot della prima componente principale
ggplot() + 
geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) + # layer è il nome dello strato nell'immagine
scale_fill_viridis(option = "magma") # viridis ha dei pack di colori che evidenziano meglio le variazioni

# plottiamo le immagini tutte insieme
im1 <- ggRGB(sim, 2, 1, 3)  # immagine originale
im2 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) # prima componente pricipale
im3 <- ggplot() + 
geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") # ggplot della sd della prima componente

im1 + im2 + im3

# calcolo ETEROGENEITA' (sd) con finestra 5x5
sd5 <- focal(pc1, matrix(1/25, 5, 5), fun=sd)
sd5
ggplot() + 
geom_raster(sd5, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma")


# plottiamo insieme la variabilità in 3x3 e 5x5
sd3 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
im3 <- ggplot() + 
geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis(option = "magma")

sd5 <- focal(pc1, matrix(1/25, 5, 5), fun=sd)
im5 <- ggplot() + 
geom_raster(sd5, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma")

im3 + im5
# con una finestra più grande ho più pixel e quindi aumenta la variabilità

# mettiamo insieme anche 7x7
sd7 <- focal(pc1, matrix(1/49, 7, 7), fun=sd)
im7 <- ggplot() + 
geom_raster(sd7, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma")

im3 + im5 + im7
#---------------------------------------------------------------------------------------------------



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
dsm_2013 <- raster("C:/Users/sofia/Desktop/lab/dati/2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013
dtm_2013 <- raster("C:/Users/sofia/Desktop/lab/dati/2013Elevation_DigitalTerrainModel-0.5m.tif")
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
dsm_2004 <- raster("C:/Users/sofia/Desktop/lab/dati/2004Elevation_DigitalElevationModel-2.5m.tif")
dsm_2004
dtm_2004 <- raster("C:/Users/sofia/Desktop/lab/dati/2004Elevation_DigitalTerrainModel-2.5m.tif")
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
point_cloud <- readLAS("C:/Users/sofia/Desktop/lab/dati/point_cloud.laz")

#plot point cloud
plot(point_cloud)

# maggiore variazione in altezza delle piante = maggior biodiversità 
#------------------------------------------------------------------------------------------------------------



# LEZIONE 17 ------------------------------------------------------------------------------------------------