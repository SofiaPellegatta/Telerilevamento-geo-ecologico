
# percorso ("C:/Users/sofia/Desktop/prova/-----.tif")



#install.packages("rasterVis")

# Carica le librerie
library(raster)
library(rasterVis)

#Band 2 - Blue 	
#Band 3 - Green 	
#Band 4 - Red 	
#Band 5 - NIR

###------- PLOT RGB IMMAGINE------- 2023 ###
# Carica i raster delle tre bande
r23_raster <- raster("C:/Users/sofia/Desktop/prova/LC09_L2SP_225069_20230526_20230601_02_T1_SR_B5.tif")
g23_raster <- raster("C:/Users/sofia/Desktop/prova/LC09_L2SP_225069_20230526_20230601_02_T1_SR_B4.tif")
b23_raster <- raster("C:/Users/sofia/Desktop/prova/LC09_L2SP_225069_20230526_20230601_02_T1_SR_B3.tif")


# Crea un oggetto raster stack
rgb23_stack <- stack(r23_raster, g23_raster, b23_raster)

# Plotta l'immagine RGB
#plotRGB(rgb_stack, scale = 1, stretch = "lin")



###------- PLOT RGB IMMAGINE------- 2018 ###
# Carica i raster delle tre bande
r18_raster <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_225069_20180621_20200831_02_T1_SR_B5.tif")
g18_raster <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_225069_20180621_20200831_02_T1_SR_B4.tif")
b18_raster <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_225069_20180621_20200831_02_T1_SR_B3.tif")


# Crea un oggetto raster stack
rgb18_stack <- stack(r18_raster, g18_raster, b18_raster)

# Plotta l'immagine RGB
#plotRGB(rgb18_stack, scale = 1, stretch = "lin")




###------- PLOT RGB IMMAGINE------- 2013 ###
# Carica i raster delle tre bande
r13_raster <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_225069_20130522_20200913_02_T1_SR_B5.tif")
g13_raster <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_225069_20130522_20200913_02_T1_SR_B4.tif")
b13_raster <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_225069_20130522_20200913_02_T1_SR_B3.tif")


# Crea un oggetto raster stack
rgb13_stack <- stack(r13_raster, g13_raster, b13_raster)


###------- PLOT RGB IMMAGINE------- 2003 ###
# Carica i raster delle tre bande
r03_raster <- raster("C:/Users/sofia/Desktop/prova/LE07_L2SP_225069_20030519_20200916_02_T1_SR_B4.tif")
g03_raster <- raster("C:/Users/sofia/Desktop/prova/LE07_L2SP_225069_20030519_20200916_02_T1_SR_B3.tif")
b03_raster <- raster("C:/Users/sofia/Desktop/prova/LE07_L2SP_225069_20030519_20200916_02_T1_SR_B2.tif")


# Crea un oggetto raster stack
rgb03_stack <- stack(r03_raster, g03_raster, b03_raster)



###------- PLOT RGB IMMAGINE------- 1998 ###
# Carica i raster delle tre bande
r98_raster <- raster("C:/Users/sofia/Desktop/prova/LT05_L2SP_225069_19980630_20201030_02_T1_SR_B4.tif")
g98_raster <- raster("C:/Users/sofia/Desktop/prova/LT05_L2SP_225069_19980630_20201030_02_T1_SR_B3.tif")
b98_raster <- raster("C:/Users/sofia/Desktop/prova/LT05_L2SP_225069_19980630_20201030_02_T1_SR_B2.tif")


# Crea un oggetto raster stack
rgb98_stack <- stack(r98_raster, g98_raster, b98_raster)



par(mfrow=c(3,1))
plotRGB(rgb23_stack, scale = 1, stretch = "lin")
plotRGB(rgb03_stack, scale = 1, stretch = "lin")
plotRGB(rgb98_stack, scale = 1, stretch = "lin")
