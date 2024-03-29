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

# => bastano due bande per spiegare il 99% del sistema originario (comp 2 + comp 2)
# noi però calcoleremo la variabilità su una sola componente, quindi ci accontenteremo della 1 col 67% (comp 1)

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
#-------------------------------------------------------------------------------------------------



# LEZIONE 18 -------------------------------------------------------------------------------------
# SPECIES DISTRIBUTION MODELLING SDM
install.packages("sdm")
library(sdm)
library(raster)
library(rgdal)


# oggi non usiamo setwd perchè usiamo un file di sistema preso dalla libreria sdm
file <- system.file("external/species.shp", package = "sdm")
file
species <- shapefile(file)
species
plot(species, pch = 19)
species$Occurrence # nel dataset è presente Occurrence, file con dentro 0 e 1 in base alla
# presenza o assenza delle specie nelle varie zone
# plottiamo le occorrenze = 1  in un modo e quelle = 0 in un altro:
occ <- species$Occurrence
plot(species[occ == 1,], col = "blue", pch = 19)
points(species[occ == 0,], col = "red", pch = 19) # points funzione per aggiungere i punti
# al grafico già plottato
# inseriamo i predittori = mappe che riguardano fattori climatici/ambientali che governano la
# distribuzione di una certa specie:
path <- system.file("external", package = "sdm")
path
# in questo caso i predittori sono 4 file (.asc): elevation, precipitation, temperature e vegetation
lst <- list.files(path = path, pattern = 'asc$', full.names = T)
# full.names conserva il percorso completo e scongiura problemi in caso di omonimia tra file nel pc
lst
# ora non serve importare i file con brick perchè sono già dentro il pacchetto,
# ma dobbiamo fare lo stack
stack(lst) # ora abbiamo lo stack di 4 file invece delle solite bande
cl <- colorRampPalette(c('blue', 'orange', 'red', 'white'))(100)
pred <- stack(lst) # pred = predittori (ci aiutano a prevedere dove sarà la specie)
plot(pred, col = cl)

# plottiamo insieme predittori e presenza delle specie:
elev <- pred$elevation
prec <- pred$precipitation
temp <- pred$temperature
vege <- pred$vegetation

plot(elev, col = cl)
points(species[occ == 1,], col = "green", pch = 19)

plot(prec, col = cl)
points(species[occ == 1,], col = "green", pch = 19)

plot(temp, col = cl)
points(species[occ == 1,], col = "green", pch = 19)

plot(vege, col = cl)
points(species[occ == 1,], col = "green", pch = 19)

# costruiamo un MODELLO lineare per spiegare questa distribuzione in base a quei 4 predittori in modo da prevedere dove 
# troveremo la specie
# dati
datasdm <- sdmData(train = species, predictors = pred)
datasdm
# funzione che stima i coefficienti da dare ai parametri per stabilizzare la funzione (linea) finale nel grafico:
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data = datasdm, methods = "glm")
m1

# previsione: sulla base del modello m1 R ci dirà dove è più probabile trovare la spiecie
p1 <- predict(m1, newdata = pred)
p1 # file raster finale

# output:
plot(p1, col = cl)
points(species[occ == 1,], pch = 19)

par(mfrow = c(2, 3))
plot(p1, col = cl)
plot(elev, col = cl)
plot(prec, col = cl)
plot(temp, col = cl)
plot(vege, col = cl)

# oppure
final <- stack(pred, p1)
plot(final, col = cl)
#------------------------------------------------------------------------------



# LEZIONE 20 -----------------------------------------------------------------
# COLORIST
install.packages("colorist")
library(colorist)
library(ggplot2)

# ESEMPIO: mappiamo distribuzione specie ciclo annuale, da esempio già presente nel pacchetto data
data("fiespa_occ") # uccelli
fiespa_occ # colorist lavora solo con raster stack, no altri tipi di file

# creiamo le METRICHE
met1 <- metrics_pull(fiespa_occ)

# PALETTE
pal <- palette_timecycle(fiespa_occ)

# MAPPA multipla
map_multiples(met1, pal, ncol = 3, labels = names(fiespa_occ)) # plotta le 12 mappe dei mesi e la distribuzione
map_single(met1, pal, layer = 6) # plotta il singolo mese

# cambiare colore mappe:
p1 <- palette_timecycle(12, start_hue = 60)
map_multiples(met1, p1, labels = names(fiespa_occ), ncol = 4)

# unione layer
met1d <- metrics_distill(fiespa_occ)
map_single(met1d, pal)
# parti grigie = parti a bassa specificità = specie presenti nei punti grigi per la maggior parte dei mesi

# LEGENDA
legend_timecycle(pal, origin_label = "1 jan")

# ESEMPIO: mappare comportamendo individuale di un individuo nel tempo
data("fisher_ud")
m2 <- metrics_pull(fisher_ud)
pal2 <- palette_timeline(fisher_ud)
head(pal2)

# creazione mappa multipla
map_multiples(m2, pal2, ncol = 3) # fattore lambda 
map_multiples(m2, pal2, ncol = 3, lambda_i = -12) # -12 coefficiente a cui lambda è > e quindi mappa si satura

m2_distill <- (metrics_distill(fisher_ud))
# creiamo la mappa singola
map_single(m2_distill, pal2, lambda_i = -10)

legend_timeline(pal2)

# github ludovico chieffallo


# COME SVILUPPARE LA PROPRIA FUNZIONE
# struttura base di una funzione:
# 1 - nome
# 2 - argomenti = valori usati all'interno della funzione 
# 3 - corpo = codice nella funzione





