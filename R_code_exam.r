
# installo pacchetto per unire file raster

install.packages("rasterVis")

# Carico le librerie
library(raster)
library(rasterVis)
library(ggplot2)
library(patchwork)
library(viridis)
library(RStoolbox)
library(rgdal)

# LANDSAT 8
#Band 2 - Blue 	
#Band 3 - Green 	
#Band 4 - Red 	
#Band 5 - NIR

# LANDSAT 7
#Band 1 - Blue 	
#Band 2 - Green 	
#Band 3 - Red 	
#Band 4 - NIR

# LANDSAT 5/4
#Band 1 - Blue 	
#Band 2 - Green 	
#Band 3 - Red 	
#Band 4 - NIR


#___UNISCO LE 4 BANDE IN UN'UNICA IMMAGINE A 4 LAYER________________________________________________________

# IMMAGINE 2023 ROW 63
# carico le singole bande:
B2_blue <- raster("C:/Users/sofia/Desktop/prova/2023/LC08_L2SP_224063_20230815_20230819_02_T1_SR_B2.tif")
B3_green <- raster("C:/Users/sofia/Desktop/prova/2023/LC08_L2SP_224063_20230815_20230819_02_T1_SR_B3.tif")
B4_red <- raster("C:/Users/sofia/Desktop/prova/2023/LC08_L2SP_224063_20230815_20230819_02_T1_SR_B4.tif")
B5_nir <- raster("C:/Users/sofia/Desktop/prova/2023/LC08_L2SP_224063_20230815_20230819_02_T1_SR_B5.tif")

# combino le bande in un raster a 4 layer
l2023_63 <- stack(B2_blue, B3_green, B4_red, B5_nir)
l2023_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2023_63.tif"

writeRaster(l2023_63, filename = path, format = "GTiff")

# eventuali plottaggi preliminari per controllare se l'immagine va bene:
#plot(l2023_63)
plotRGB(l2023_63, r=3, g=2, b=1, stretch="lin") 


# IMMAGINE 2023 ROW 64 
B2_blue <- raster("C:/Users/sofia/Desktop/prova/2023/LC08_L2SP_224064_20230815_20230819_02_T1_SR_B2.tif")
B3_green <- raster("C:/Users/sofia/Desktop/prova/2023/LC08_L2SP_224064_20230815_20230819_02_T1_SR_B3.tif")
B4_red <- raster("C:/Users/sofia/Desktop/prova/2023/LC08_L2SP_224064_20230815_20230819_02_T1_SR_B4.tif")
B5_nir <- raster("C:/Users/sofia/Desktop/prova/2023/LC08_L2SP_224064_20230815_20230819_02_T1_SR_B5.tif")

# combino le bande in un raster a 4 layer
l2023_64 <- stack(B2_blue, B3_green, B4_red, B5_nir)
l2023_64

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2023_64.tif"
writeRaster(l2023_64, filename = path, format = "GTiff")
plotRGB(l2023_64, r=3, g=2, b=1, stretch="lin") 



##########
# IMMAGINE 2013 ROW 63 ------------------------
B2_blue <- raster("C:/Users/sofia/Desktop/prova/2013/LC08_L2SP_224063_20130803_20200912_02_T1_SR_B2.tif")
B3_green <- raster("C:/Users/sofia/Desktop/prova/2013/LC08_L2SP_224063_20130803_20200912_02_T1_SR_B3.tif")
B4_red <- raster("C:/Users/sofia/Desktop/prova/2013/LC08_L2SP_224063_20130803_20200912_02_T1_SR_B4.tif")
B5_nir <- raster("C:/Users/sofia/Desktop/prova/2013/LC08_L2SP_224063_20130803_20200912_02_T1_SR_B5.tif")

# combino le bande in un raster a 4 layer
l2013_63 <- stack(B2_blue, B3_green, B4_red, B5_nir)
l2013_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2013_63.tif"
writeRaster(l2013_63, filename = path, format = "GTiff")
plotRGB(l2013_63, r=3, g=2, b=1, stretch="lin")

# IMMAGINE 2013 ROW 64 ------------------------
B2_blue <- raster("C:/Users/sofia/Desktop/prova/2013/LC08_L2SP_224064_20130803_20200912_02_T1_SR_B2.tif")
B3_green <- raster("C:/Users/sofia/Desktop/prova/2013/LC08_L2SP_224064_20130803_20200912_02_T1_SR_B3.tif")
B4_red <- raster("C:/Users/sofia/Desktop/prova/2013/LC08_L2SP_224064_20130803_20200912_02_T1_SR_B4.tif")
B5_nir <- raster("C:/Users/sofia/Desktop/prova/2013/LC08_L2SP_224064_20130803_20200912_02_T1_SR_B5.tif")

# combino le bande in un raster a 4 layer
l2013_64 <- stack(B2_blue, B3_green, B4_red, B5_nir)
l2013_64

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2013_64.tif"
writeRaster(l2013_64, filename = path, format = "GTiff")
plotRGB(l2013_64, r=3, g=2, b=1, stretch="lin")



##########
# IMMAGINE 2001 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/2001/LE07_L2SP_224063_20010709_20200917_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/2001/LE07_L2SP_224063_20010709_20200917_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/2001/LE07_L2SP_224063_20010709_20200917_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/2001/LE07_L2SP_224063_20010709_20200917_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l2001_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l2001_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2001_63.tif"
writeRaster(l2001_63, filename = path, format = "GTiff")
plotRGB(l2001_63, r=3, g=2, b=1, stretch="lin") 

# IMMAGINE 2001 ROW 64
B1_blue <- raster("C:/Users/sofia/Desktop/prova/2001/LE07_L2SP_224064_20010709_20200917_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/2001/LE07_L2SP_224064_20010709_20200917_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/2001/LE07_L2SP_224064_20010709_20200917_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/2001/LE07_L2SP_224064_20010709_20200917_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l2001_64 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l2001_64

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2001_64.tif"
writeRaster(l2001_64, filename = path, format = "GTiff")
plotRGB(l2001_64, r=3, g=2, b=1, stretch="lin") 



##########
# IMMAGINE 1994 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/1994/LT05_L2SP_224063_19940730_20200913_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/1994/LT05_L2SP_224063_19940730_20200913_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/1994/LT05_L2SP_224063_19940730_20200913_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/1994/LT05_L2SP_224063_19940730_20200913_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l1994_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l1994_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l1994_63.tif"
writeRaster(l1994_63, filename = path, format = "GTiff")
plotRGB(l1994_63, r=3, g=2, b=1, stretch="lin")

# IMMAGINE 1994 ROW 64 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/1994/LT05_L2SP_224064_19940730_20200913_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/1994/LT05_L2SP_224064_19940730_20200913_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/1994/LT05_L2SP_224064_19940730_20200913_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/1994/LT05_L2SP_224064_19940730_20200913_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l1994_64 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l1994_64

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l1994_64.tif"
writeRaster(l1994_64, filename = path, format = "GTiff")
plotRGB(l1994_64, r=3, g=2, b=1, stretch="lin")
#____________________________________________________________________________



# import dei file uniti e ritagliati su QGIS:
setwd("C:/Users/sofia/Desktop/prova")
l2023 <- brick("l2023_cut.tif")
l2013 <- brick("l2013_cut.tif")
l2001 <- brick("l2001_cut.tif")
l1994 <- brick("l1994_cut.tif")

# salvo il plot RGB dei 4 anni
png("RGB_amazon_4y.png")
par(mfrow=c(2,2))
plotRGB(l1994, r=3, g=2, b=1, stretch="lin")
plotRGB(l2001, r=3, g=2, b=1, stretch="lin")
plotRGB(l2013, r=3, g=2, b=1, stretch="lin")
plotRGB(l2023, r=3, g=2, b=1, stretch="lin")
dev.off()

# salvo il plot NIR
png("NIR_amazon_4y.png")
par(mfrow=c(2,2))
plotRGB(l1994, r=4, g=3, b=2, stretch="lin")
plotRGB(l2001, r=4, g=3, b=2, stretch="lin")
plotRGB(l2013, r=4, g=3, b=2, stretch="lin")
plotRGB(l2023, r=4, g=3, b=2, stretch="lin")
dev.off()

# salvo il plot RGB fatto con ggplot
p94 <- ggRGB(l1994, 1, 2, 3, stretch = "lin")
p01 <- ggRGB(l2001, 1, 2, 3, stretch = "lin")
p13 <- ggRGB(l2013, 1, 2, 3, stretch = "lin")
p23 <- ggRGB(l2023, 1, 2, 3, stretch = "lin")
pRGB <- (p94 + p01) / (p13 + p23)
plot(pRGB)
ggsave(filename = "ggRRGB_amazon_4y.png", plot = pRGB)
dev.off()



# CALCOLO L'NDVI DEI 4 ANNI
# NDVI 1994
ndvi1994 = (l1994[[4]] - l1994[[3]]) / (l1994[[4]] + l1994[[3]])
ndvi1994

# NDVI 2001
ndvi2001 = (l2001[[4]] - l2001[[3]]) / (l2001[[4]] + l2001[[3]])
ndvi2001

# NDVI 2013
ndvi2013 = (l2013[[4]] - l2013[[3]]) / (l2013[[4]] + l2013[[3]])
ndvi2013

# NDVI 2023
ndvi2023 = (l2023[[4]] - l2023[[3]]) / (l2023[[4]] + l2023[[3]])
ndvi2023 


# salvo il plot dei 4 NDVI con la palette MAGMA della libreria VIRIDIS (colorblind frienldy)
png("NDVI_amazon_4y.png")
par(mfrow=c(2,2))
plot(ndvi1994, col = magma(100))
plot(ndvi2001, col = magma(100))
plot(ndvi2013, col = magma(100))
plot(ndvi2023, col = magma(100))
dev.off()


# CLASSIFICAZIONE E FREQUENZA
library(raster)
library(RStoolbox)
library(viridis)
install.packages(magick)
library(magick)

setwd("C:/Users/sofia/Desktop/prova")

l2023 <- brick("l2023_cut.tif")
l2013 <- brick("l2013_cut.tif")
l2001 <- brick("l2001_cut.tif")
l1994 <- brick("l1994_cut.tif")

#### 2023 #####
# salvo l'immagine raster come PNG nel NIR
png("l2023NIR.png")
plotRGB(l2023, r=4, g=3, b=2, stretch="lin")
dev.off()

# Leggo l'immagine
input <- image_read("l2023NIR.png")
# Rimuovo i bordi bianchi
output_image <- image_trim(input)
# Salvo l'immagine come PNG
image_write(output_image, "l2023NIR_clean.png")

# importo la nuova immagine PNG
l2023png <- brick("l2023NIR_clean.png")

# avvio la classificazione:
set.seed(17)
l2023_cl2 <- unsuperClass(l2023png, nClasses=2) # unsuperClass = classificazione non supervisionata
l2023_cl2
plot(l2023_cl2$map, col = viridis(100))
# classe 1 = foresta + acqua
# classe 2 = agricoltura

# frequenza 
freq(l2023_cl2$map)
# value  count
#[1,]     1 104032 foresta
#[2,]     2  74528 agricoltura

# analisi pattern spaziali
a <- 104032
b <- 74528

tot <- a + b  # = 178560 

tot <- 178560 
prop23_for <- 104032 / tot # = 0.5826165
prop23_agr <- 74528 / tot # = 0.4173835


#### 2013 ####
# salvo l'immagine raster come PNG nel NIR
png("l2013NIR.png")
plotRGB(l2013, r=4, g=3, b=2, stretch="lin")
dev.off()

# Leggi l'immagine
input <- image_read("l2013NIR.png")
# Rimuovi i bordi bianchi
output_image <- image_trim(input)
# Salva l'immagine come PNG
image_write(output_image, "l2013NIR_clean.png")

# importo la nuova immagine PNG
l2013png <- brick("l2013NIR_clean.png")

# avvio la classificazione:
set.seed(17)
l2013_cl2 <- unsuperClass(l2013png, nClasses=2) # unsuperClass = classificazione non supervisionata
l2013_cl2
plot(l2013_cl2$map, col = viridis(100))
# classe 1 = agricoltura
# classe 2 = foresta + acqua

# frequenza 
freq(l2013_cl2$map)
#value  count
#[1,]     1  63508 agricoltura
#[2,]     2 115052 foresta + acqua

# analisi pattern spaziali
tot <- 178560 
prop13_for <- 115052 / tot # = 0.6443324
prop13_for
prop13_agr <- 63508 / tot # = 0.3556676
prop13_agr


#### 2001 ####
# salvo l'immagine raster come PNG nel NIR
png("l2001NIR.png")
plotRGB(l2001, r=4, g=3, b=2, stretch="lin")
dev.off()

# Leggi l'immagine
input <- image_read("l2001NIR.png")
# Rimuovi i bordi bianchi
output_image <- image_trim(input)
# Salva l'immagine come PNG
image_write(output_image, "l2001NIR_clean.png")

# importo la nuova immagine PNG
l2001png <- brick("l2001NIR_clean.png")

# avvio la classificazione:
set.seed(17)
l2001_cl2 <- unsuperClass(l2001png, nClasses=2) # unsuperClass = classificazione non supervisionata
l2001_cl2
plot(l2001_cl2$map, col = viridis(100))
# classe 1 = agricoltura
# classe 2 = foresta + acqua

# frequenza 
freq(l2001_cl2$map)
#value  count
#[1,]     1  28928 agricoltura
#[2,]     2 149632 foresta + acqua

# analisi pattern spaziali
tot <- 178560 
prop01_for <- 149632 / tot # = 0.8379928
prop01_for
prop01_agr <- 28928 / tot # =  0.1620072
prop01_agr


#### 1994 ####
# salvo l'immagine raster come PNG nel NIR
png("l1994NIR.png")
plotRGB(l1994, r=4, g=3, b=2, stretch="lin")
dev.off()

# Leggi l'immagine
input <- image_read("l1994NIR.png")
# Rimuovi i bordi bianchi
output_image <- image_trim(input)
# Salva l'immagine come PNG
image_write(output_image, "l1994NIR_clean.png")

# importo la nuova immagine PNG
l1994png <- brick("l1994NIR_clean.png")

# avvio la classificazione:
set.seed(17)
l1994_cl2 <- unsuperClass(l1994png, nClasses=2) # unsuperClass = classificazione non supervisionata
l1994_cl2
plot(l1994_cl2$map, col = viridis(100))
# classe 1 = agricoltura
# classe 2 = foresta + acqua

# frequenza 
freq(l1994_cl2$map)
#value  count
#[1,]     1  15951 agricoltura
#[2,]     2 162609 foresta + acqua

# analisi pattern spaziali
tot <- 178560 
prop94_for <- 162609 / tot # = 0.9106687
prop94_for
prop94_agr <- 15951 / tot # =  0.08933132
prop94_agr

# plot classificazione 4 anni:
png("Class2_amazon_4y.png")
par(mfrow = c(2, 2))
set.seed(17)
plot(l2023_cl2$map, col = viridis(100))
plot(l2013_cl2$map, col = viridis(100))
plot(l2001_cl2$map, col = viridis(100))
plot(l1994_cl2$map, col = viridis(100))
dev.off()

# RECAP DATI:
# percentuale foresta 2023 = 58.26165
# percentuale agricola 2023 = 41.73835

# percentuale foresta 2013 = 64.43324
# percentuale agricola 2013 = 35.56676

# percentuale foresta 2001 = 83.79928
# percentuale agricola 2001 = 16.20072

# percentuale foresta 1994 = 91.06687
# percentuale agricola 1994 = 8.933132

# creiamo un DATAFRAME = una tabella coi dati ricavati
# colonne
Classe <- c("Foresta", "Agricoltura")
percent_2023 <- c(58.26165, 41.73835)
percent_2013 <- c(64.43324, 35.56676)
percent_2001 <- c(83.79928, 16.20072)
percent_1994 <- c(91.06687, 8.933132)
multitemp <- data.frame(Classe, percent_2023, percent_2013, percent_2001, percent_1994)
multitemp
View(multitemp)

# creo e savlo gli istrogrammi dei vari anni:
png("istogrammi_amazon_4y.png")
plot1 <- ggplot(multitemp, aes(x=Classe, y=percent_2023, color=Classe)) +
  geom_bar(stat="identity", fill="orange") +
  labs(title="2023")

plot2 <- ggplot(multitemp, aes(x=Classe, y=percent_2013, color=Classe)) +
  geom_bar(stat="identity", fill="yellow") +
  labs(title="2013")

plot3 <- ggplot(multitemp, aes(x=Classe, y=percent_2001, color=Classe)) +
  geom_bar(stat="identity", fill="green") +
  labs(title="2001")

plot4 <- ggplot(multitemp, aes(x=Classe, y=percent_1994, color=Classe)) +
  geom_bar(stat="identity", fill="blue") +
  labs(title="1994")

(plot1 + plot2) / (plot3 + plot4)
dev.off()

# VARIABILITA'
# variabilità = zone di differenziazione tra un punto e l'altro dello spazio
# variazioni nella roccia e nel land cover
library(raster)
library(RStoolbox)
library(viridis)
library(patchwork)

setwd("C:/Users/sofia/Desktop/prova")

l2023 <- brick("l2023NIR_clean.png")
l2013 <- brick("l2013NIR_clean.png")
l2001 <- brick("l2001NIR_clean.png")
l1994 <- brick("l1994NIR_clean.png")

nir23 <- l2023[[3]]
nir13 <- l2013[[3]]
nir01 <- l2001[[3]]
nir94 <- l1994[[3]]


sd_nir23 <- focal(nir23, matrix(1/9, 3, 3), fun=sd) # fun= dire che tipo di funzione calcolo, sd = deviazione standard
sd_nir13 <- focal(nir13, matrix(1/9, 3, 3), fun=sd)
sd_nir01 <- focal(nir01, matrix(1/9, 3, 3), fun=sd)
sd_nir94 <- focal(nir94, matrix(1/9, 3, 3), fun=sd)

# ggplot variabilità NIR 2023
png("VarNIR_amazon_4y.png")
plot1 <- ggplot() + 
geom_raster(sd_nir23, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("deviazione standard NIR 2023")

plot2 <- ggplot() + 
geom_raster(sd_nir13, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("deviazione standard NIR 2013")

plot3 <- ggplot() + 
geom_raster(sd_nir01, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("deviazione standard NIR 2001")

plot4 <- ggplot() + 
geom_raster(sd_nir94, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("deviazione standard NIR 1994")


(plot1 + plot2) / (plot3 + plot4)
dev.off()


# PRINCIPAL COMPONENT ANALYSIS
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
library(viridis)

setwd("C:/Users/sofia/Desktop/prova")

# importo immagine 

l2023 <- brick("l2023NIR_clean.png")
l2013 <- brick("l2013NIR_clean.png")
l2001 <- brick("l2001NIR_clean.png")
l1994 <- brick("l1994NIR_clean.png")

#### 2023 ####
# passiamo da 3 layer R G B delle bande, a una sola componente principale che compatta le info:
# ANALISI MULTIVARIATA
l2023_pca <- rasterPCA(l2023)
l2023_pca 

# summery del modello delle componenti della PCA
summary(l2023_pca$model)

#Importance of components:
#                           Comp.1     Comp.2      Comp.3
#Standard deviation     108.4995403 42.4795327 8.715672254
#Proportion of Variance   0.8622628  0.1321732 0.005563981
#Cumulative Proportion    0.8622628  0.9944360 1.000000000

# plot delle 3 componenti:
#png("3comp_2023.png") è brutto è meglio uno screen
pc1 <- l2023_pca$map$PC1
pc2 <- l2023_pca$map$PC2
pc3 <- l2023_pca$map$PC3 

g1 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis(option = "magma")

g2 <- ggplot() +
geom_raster(pc2, mapping = aes(x=x, y=y, fill=PC2)) +
scale_fill_viridis(option = "magma")

g3 <- ggplot() +
geom_raster(pc3, mapping = aes(x=x, y=y, fill=PC3)) +
scale_fill_viridis(option = "magma")

g1 + g2 + g3
dev.off()

# calcolo della variabilità su una delle componenti: PC1
sd_pc1 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
sd_pc1

# plot della deviazione standard della PC1
ggplot() + 
geom_raster(sd_pc1, mapping=aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis(option = "magma")
dev.off()

# plottiamo le immagini tutte insieme
png("comparisonpc1_2023.png")
im1 <- ggRGB(l2023, 1, 2, 3)  # immagine originale
im2 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) # prima componente pricipale
im3 <- ggplot() + 
geom_raster(sd_pc1, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") # ggplot della sd della prima componente

im1 + im2 + im3
dev.off()

#### 2013 ####
# passiamo da 3 layer R G B delle bande, a una sola componente principale che compatta le info:
# ANALISI MULTIVARIATA
l2013_pca <- rasterPCA(l2013)
l2013_pca 

# summery del modello delle componenti della PCA
summary(l2013_pca$model)

#Importance of components:
#                          Comp.1     Comp.2      Comp.3
#Standard deviation     91.3748183 42.3400195 10.99470998
#Proportion of Variance  0.8135461  0.1746752  0.01177868
#Cumulative Proportion   0.8135461  0.9882213  1.00000000

# plot delle 3 componenti:
pc1 <- l2013_pca$map$PC1
pc2 <- l2013_pca$map$PC2
pc3 <- l2013_pca$map$PC3 

g1 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis(option = "magma")

g2 <- ggplot() +
geom_raster(pc2, mapping = aes(x=x, y=y, fill=PC2)) +
scale_fill_viridis(option = "magma")

g3 <- ggplot() +
geom_raster(pc3, mapping = aes(x=x, y=y, fill=PC3)) +
scale_fill_viridis(option = "magma")

g1 + g2 + g3
dev.off()

# calcolo della variabilità su una delle componenti: PC1
sd_pc1 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
sd_pc1

# plot della deviazione standard della PC1
ggplot() + 
geom_raster(sd_pc1, mapping=aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis(option = "magma")
dev.off()

# plottiamo le immagini tutte insieme
png("comparisonpc1_2013.png")
im1 <- ggRGB(l2013, 1, 2, 3)  # immagine originale
im2 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) # prima componente pricipale
im3 <- ggplot() + 
geom_raster(sd_pc1, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") # ggplot della sd della prima componente

im1 + im2 + im3
dev.off()



#### 2001 ####
# passiamo da 3 layer R G B delle bande, a una sola componente principale che compatta le info:
# ANALISI MULTIVARIATA
l2001_pca <- rasterPCA(l2001)
l2001_pca 

# summery del modello delle componenti della PCA
summary(l2001_pca$model)

#Importance of components:
#                          Comp.1     Comp.2      Comp.3
#Standard deviation     81.8675549 39.1885987 12.55946637
#Proportion of Variance  0.7982932  0.1829188  0.01878803
#Cumulative Proportion   0.7982932  0.9812120  1.00000000

# plot delle 3 componenti:
pc1 <- l2001_pca$map$PC1
pc2 <- l2001_pca$map$PC2
pc3 <- l2001_pca$map$PC3 

g1 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis(option = "magma")

g2 <- ggplot() +
geom_raster(pc2, mapping = aes(x=x, y=y, fill=PC2)) +
scale_fill_viridis(option = "magma")

g3 <- ggplot() +
geom_raster(pc3, mapping = aes(x=x, y=y, fill=PC3)) +
scale_fill_viridis(option = "magma")

g1 + g2 + g3
dev.off()

# calcolo della variabilità su una delle componenti: PC1
sd_pc1 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
sd_pc1

# plot della deviazione standard della PC1
ggplot() + 
geom_raster(sd_pc1, mapping=aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis(option = "magma")
dev.off()

# plottiamo le immagini tutte insieme
png("comparisonpc1_2001.png")
im1 <- ggRGB(l2001, 1, 2, 3)  # immagine originale
im2 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) # prima componente pricipale
im3 <- ggplot() + 
geom_raster(sd_pc1, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") # ggplot della sd della prima componente

im1 + im2 + im3
dev.off()


#### 1994 ####
# passiamo da 3 layer R G B delle bande, a una sola componente principale che compatta le info:
# ANALISI MULTIVARIATA
l1994_pca <- rasterPCA(l1994)
l1994_pca 

# summery del modello delle componenti della PCA
summary(l1994_pca$model)

#Importance of components:
#                         Comp.1     Comp.2      Comp.3
#Standard deviation     66.8237720 38.8173719 15.20299325
#Proportion of Variance  0.7198412  0.2428997  0.03725915
#Cumulative Proportion   0.7198412  0.9627409  1.00000000
> 

# plot delle 3 componenti:
pc1 <- l1994_pca$map$PC1
pc2 <- l1994_pca$map$PC2
pc3 <- l1994_pca$map$PC3 

g1 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis(option = "magma")

g2 <- ggplot() +
geom_raster(pc2, mapping = aes(x=x, y=y, fill=PC2)) +
scale_fill_viridis(option = "magma")

g3 <- ggplot() +
geom_raster(pc3, mapping = aes(x=x, y=y, fill=PC3)) +
scale_fill_viridis(option = "magma")

g1 + g2 + g3
dev.off()

# calcolo della variabilità su una delle componenti: PC1
sd_pc1 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
sd_pc1

# plot della deviazione standard della PC1
ggplot() + 
geom_raster(sd_pc1, mapping=aes(x=x, y=y, fill=layer)) + 
scale_fill_viridis(option = "magma")
dev.off()

# plottiamo le immagini tutte insieme
png("comparisonpc1_1994.png")
im1 <- ggRGB(l1994, 1, 2, 3)  # immagine originale
im2 <- ggplot() +
geom_raster(pc1, mapping = aes(x=x, y=y, fill=PC1)) # prima componente pricipale
im3 <- ggplot() + 
geom_raster(sd_pc1, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") # ggplot della sd della prima componente

im1 + im2 + im3
dev.off()