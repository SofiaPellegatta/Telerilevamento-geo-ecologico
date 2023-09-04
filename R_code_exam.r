
# percorso ("C:/Users/sofia/Desktop/prova/-----.tif")

install.packages("rasterVis")

# Carica le librerie
library(raster)
library(rasterVis)

#Band 2 - Blue 	
#Band 3 - Green 	
#Band 4 - Red 	
#Band 5 - NIR


#___UNISCO LE 4 BANDE IN UN'UNICA IMMAGINE A 4 LAYER________________________________________________________

# IMMAGINE 2023 ROW 63
library(raster)
library(rasterVis)

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
#l2023_63 <- brick("l2023_63.tif")
plot(l2023_63)
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


# IMMAGINE 2016 ROW 63 ------------------------
B2_blue <- raster("C:/Users/sofia/Desktop/prova/2016/LC08_L2SP_224063_20160726_20200906_02_T1_SR_B2.tif")
B3_green <- raster("C:/Users/sofia/Desktop/prova/2016/LC08_L2SP_224063_20160726_20200906_02_T1_SR_B3.tif")
B4_red <- raster("C:/Users/sofia/Desktop/prova/2016/LC08_L2SP_224063_20160726_20200906_02_T1_SR_B4.tif")
B5_nir <- raster("C:/Users/sofia/Desktop/prova/2016/LC08_L2SP_224063_20160726_20200906_02_T1_SR_B5.tif")

# combino le bande in un raster a 4 layer
l2016_63 <- stack(B2_blue, B3_green, B4_red, B5_nir)
l2016_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2016_63.tif"
writeRaster(l2016_63, filename = path, format = "GTiff")
plotRGB(l2016_63, r=3, g=2, b=1, stretch="lin")

# IMMAGINE 2016 ROW 64 ------------------------
B2_blue <- raster("C:/Users/sofia/Desktop/prova/2016/LC08_L2SP_224064_20160726_20200906_02_T1_SR_B2.tif")
B3_green <- raster("C:/Users/sofia/Desktop/prova/2016/LC08_L2SP_224064_20160726_20200906_02_T1_SR_B3.tif")
B4_red <- raster("C:/Users/sofia/Desktop/prova/2016/LC08_L2SP_224064_20160726_20200906_02_T1_SR_B4.tif")
B5_nir <- raster("C:/Users/sofia/Desktop/prova/2016/LC08_L2SP_224064_20160726_20200906_02_T1_SR_B5.tif")

# combino le bande in un raster a 4 layer
l2016_64 <- stack(B2_blue, B3_green, B4_red, B5_nir)
l2016_64

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2016_64.tif"
writeRaster(l2016_64, filename = path, format = "GTiff")
plotRGB(l2016_64, r=3, g=2, b=1, stretch="lin")



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





# plot RGB dei 4 anni lin
par(mfrow=c(2,2))
plotRGB(l1991_63, r=3, g=2, b=1, stretch="lin")
plotRGB(l2001_63, r=3, g=2, b=1, stretch="lin")
plotRGB(l2013_63, r=3, g=2, b=1, stretch="lin")
plotRGB(l2023_63, r=3, g=2, b=1, stretch="lin")


# plot RGB dei 4 anni hist
par(mfrow=c(2,2))
plotRGB(l1991_63, r=3, g=2, b=1, stretch="hist")
plotRGB(l2001_63, r=3, g=2, b=1, stretch="hist")
plotRGB(l2013_63, r=3, g=2, b=1, stretch="hist")
plotRGB(l2023_63, r=3, g=2, b=1, stretch="hist")

l2023_63 <- brick("C:/Users/sofia/Desktop/prova/l2023_63.tif")
l2016_63 <- brick("C:/Users/sofia/Desktop/prova/l2016_63.tif")
l2001_63 <- brick("C:/Users/sofia/Desktop/prova/l2001_63.tif")
l1994_63 <- brick("C:/Users/sofia/Desktop/prova/l1994_63.tif")

# plot NIR hist
par(mfrow=c(2,2))
plotRGB(l1994_63, r=4, g=3, b=2, stretch="hist")
plotRGB(l2001_63, r=4, g=3, b=2, stretch="hist")
plotRGB(l2016_63, r=4, g=3, b=2, stretch="hist")
plotRGB(l2023_63, r=4, g=3, b=2, stretch="hist")

# plot NIR lin
par(mfrow=c(2,2))
plotRGB(l1991_63, r=4, g=3, b=2, stretch="lin")
plotRGB(l2001_63, r=4, g=3, b=2, stretch="lin")
plotRGB(l2013_63, r=4, g=3, b=2, stretch="lin")
plotRGB(l2023_63, r=4, g=3, b=2, stretch="lin")


l2023 <- brick("C:/Users/sofia/Desktop/prova/l2023_cut.tif")
l2016 <- brick("C:/Users/sofia/Desktop/prova/l2016_cut.tif")
l2013 <- brick("C:/Users/sofia/Desktop/prova/l2013_cut.tif")
l2001 <- brick("C:/Users/sofia/Desktop/prova/l2001_cut.tif")
l1994 <- brick("C:/Users/sofia/Desktop/prova/l1994_cut.tif")

par(mfrow=c(3,2))
plotRGB(l1994, r=3, g=2, b=1, stretch="lin")
plotRGB(l2001, r=3, g=2, b=1, stretch="lin")
plotRGB(l2013, r=3, g=2, b=1, stretch="lin")
plotRGB(l2016, r=3, g=2, b=1, stretch="lin")
plotRGB(l2023, r=3, g=2, b=1, stretch="lin")

par(mfrow=c(2,2))
plotRGB(l1994, r=3, g=2, b=1, stretch="lin")
plotRGB(l2001, r=3, g=2, b=1, stretch="lin")
plotRGB(l2013, r=3, g=2, b=1, stretch="lin")
plotRGB(l2023, r=3, g=2, b=1, stretch="lin")