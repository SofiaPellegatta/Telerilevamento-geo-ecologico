# UNIRE LE 4 BANDE DELLE IMMAGINI
library(raster)

# carico le 4 bande
imageR <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_224063_20230815_20230819_02_T1_SR_B4.tif")
imageG <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_224063_20230815_20230819_02_T1_SR_B3.tif")
imageB <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_224063_20230815_20230819_02_T1_SR_B2.tif")
imageNIR <- raster("C:/Users/sofia/Desktop/prova/LC08_L2SP_224063_20230815_20230819_02_T1_SR_B5.tif")

# le unisco insieme
l2023_63 <- imageR + imageG + imageB + imageNIR

# salvo il file in formato .tif
writeRaster(l2023_63, filename = "C:/Users/sofia/Desktop/prova/parakana2023_63.tif", format = "GTiff")


l2023B4 <- raster("C:/Users/sofia/Desktop/prova/B42023_cut.tif")
plot(l2023B4)





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





# IMMAGINE 2008 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/2008/LE07_L2SP_224063_20080712_20200912_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/2008/LE07_L2SP_224063_20080712_20200912_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/2008/LE07_L2SP_224063_20080712_20200912_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/2008/LE07_L2SP_224063_20080712_20200912_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l2008_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l2008_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2008_63.tif"

writeRaster(l2008_63, filename = path, format = "GTiff")
plot(l2008_63)


# IMMAGINE 2003 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/2003/LE07_L2SP_224063_20030715_20200916_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/2003/LE07_L2SP_224063_20030715_20200916_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/2003/LE07_L2SP_224063_20030715_20200916_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/2003/LE07_L2SP_224063_20030715_20200916_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l2003_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l2003_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2003_63.tif"

writeRaster(l2003_63, filename = path, format = "GTiff")
plot(l2003_63)
plotRGB(l2003_63, r=3, g=2, b=1, stretch="lin") 


# IMMAGINE 2012 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/2012/LE07_L2SP_224063_20120707_20200908_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/2012/LE07_L2SP_224063_20120707_20200908_02_T1_SR_B1.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/2012/LE07_L2SP_224063_20120707_20200908_02_T1_SR_B1.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/2012/LE07_L2SP_224063_20120707_20200908_02_T1_SR_B1.tif")

# combino le bande in un raster a 4 layer
l2012_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l2012_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2012_63.tif"
writeRaster(l2012_63, filename = path, format = "GTiff")
plotRGB(l2012_63, r=3, g=2, b=1, stretch="lin")

# IMMAGINE 2011 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/2011/LE07_L2SP_224063_20110603_20200910_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/2011/LE07_L2SP_224063_20110603_20200910_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/2011/LE07_L2SP_224063_20110603_20200910_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/2011/LE07_L2SP_224063_20110603_20200910_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l2011_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l2011_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2011_63.tif"
writeRaster(l2011_63, filename = path, format = "GTiff")
plotRGB(l2011_63, r=3, g=2, b=1, stretch="lin")


# IMMAGINE 2010 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/2010/LE07_L2SP_224063_20100803_20200911_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/2010/LE07_L2SP_224063_20100803_20200911_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/2010/LE07_L2SP_224063_20100803_20200911_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/2010/LE07_L2SP_224063_20100803_20200911_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l2010_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l2010_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l2010_63.tif"
writeRaster(l2010_63, filename = path, format = "GTiff")
plotRGB(l2010_63, r=3, g=2, b=1, stretch="lin")


# IMMAGINE 1990 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/1990/LT05_L2SP_224063_19900719_20200916_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/1990/LT05_L2SP_224063_19900719_20200916_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/1990/LT05_L2SP_224063_19900719_20200916_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/1990/LT05_L2SP_224063_19900719_20200916_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l1990_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l1990_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l1990_63.tif"
writeRaster(l1990_63, filename = path, format = "GTiff")
plotRGB(l1990_63, r=3, g=2, b=1, stretch="lin")



# IMMAGINE 1991 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/1991/LT05_L2SP_224063_19910722_20200915_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/1991/LT05_L2SP_224063_19910722_20200915_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/1991/LT05_L2SP_224063_19910722_20200915_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/1991/LT05_L2SP_224063_19910722_20200915_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l1991_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l1991_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l1991_63.tif"
writeRaster(l1991_63, filename = path, format = "GTiff")
plotRGB(l1991_63, r=3, g=2, b=1, stretch="lin")

# IMMAGINE 1991 ROW 64 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/1991/LT05_L2SP_224064_19910722_20200915_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/1991/LT05_L2SP_224064_19910722_20200915_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/1991/LT05_L2SP_224064_19910722_20200915_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/1991/LT05_L2SP_224064_19910722_20200915_02_T1_SR_B4.tif")

# combino le bande in un raster a 4 layer
l1991_64 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l1991_64

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l1991_64.tif"
writeRaster(l1991_64, filename = path, format = "GTiff")
plotRGB(l1991_64, r=3, g=2, b=1, stretch="lin")


# IMMAGINE 1989 ROW 63 ------------------------
B1_blue <- raster("C:/Users/sofia/Desktop/prova/1989-88/LT05_L2SP_224063_19890902_20200916_02_T1_SR_B1.tif")
B2_green <- raster("C:/Users/sofia/Desktop/prova/1989-88/LT05_L2SP_224063_19890902_20200916_02_T1_SR_B2.tif")
B3_red <- raster("C:/Users/sofia/Desktop/prova/1989-88/LT05_L2SP_224063_19890902_20200916_02_T1_SR_B3.tif")
B4_nir <- raster("C:/Users/sofia/Desktop/prova/1989-88/LT05_L2SP_224063_19890902_20200916_02_T1_SR_B4.tif")
# combino le bande in un raster a 4 layer
l1989_63 <- stack(B1_blue, B2_green, B3_red, B4_nir)
l1989_63

# salvo il file ottenuto
path <- "C:/Users/sofia/Desktop/prova/l1989_63.tif"
writeRaster(l1989_63, filename = path, format = "GTiff")
plotRGB(l1989_63, r=3, g=2, b=1, stretch="lin")
