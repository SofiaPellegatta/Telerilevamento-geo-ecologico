# LEZIONE 9 -------------------------------
# land surface temperature LST
# time series analysis della Groenlandia, LST data

# richiamiamo pacchetti utili
library(raster)
setwd("C:/Users/sofia/Desktop/lab/Greenland")

# con la funzione raster() creo un singolo layer di un'immagine, mentre con brick() importo tutte le bande insieme
lst2000 <- raster("lst_2000.tif")
lst2000
plot(lst2000)

# esercizio: importa tutti i dati
lst2005 <- raster("lst_2005.tif")
lst2010 <- raster("lst_2010.tif")
lst2015 <- raster("lst_2015.tif")

cl <- colorRampPalette(c("blue", "light blue", "pink", "red"))(100)

# multiframe dei dati Greenland
par(mfrow = c(2, 2))
plot(lst2000, col = cl)
plot(lst2005, col = cl)
plot(lst2010, col = cl)
plot(lst2015, col = cl)

# come importare tutto il set di immagini insieme
lst_list <- list.files(pattern = "lst" )
lst_list
import <- lapply(lst_list, raster)

greenland <- stack(import)
greenland

plot(greenland, col = cl)
plot(greenland[[1]], col = cl) # plot di un singolo elemento dello stack

plotRGB(greenland, r=1, g=2, b=3, stretch = "lin") # plot RGB dei primi 3 elementi dello stack
# il pacchetto colorist fa tutto ciò molto bene
#------------------------------------------------------------------


# LEZIONE 10 ------------------------------------------------------
# analisi temporale dei livelli di azoto durante il lockdown
library(raster)
setwd("C:/Users/sofia/Desktop/lab/en")
# lista dei file
en_list <- list.files(pattern = "EN")
files <- lapply(en_list, raster)
en <- stack(files)

cl <- colorRampPalette(c("blue", "light blue", "pink", "red"))(100)
plot(en, col = cl)

# RGB coi dati di 3 mesi: gennaio, febbraio e marzo
plotRGB(en, r=1, g=7, b=13, stretch = "lin")


# classificazione di immagini:
# come passare da dati continui a delle classi

# classificazione dati solari
library(raster)
library(RStoolbox)
setwd("C:/Users/sofia/Desktop/lab")
# import dei dati
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(so, 1, 2, 3, stretch="lin")

soc <- unsuperClass(so, nClasses=3)
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soc$map, col=cl)

# classificazione del grand canyon 
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
# cambio lo stretch
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

# classificatione
gcclass2 <- unsuperClass(gc, nClasses=2) # unsuperClass = classificazione non supervisionata
gcclass2
plot(gcclass2$map) # per fare il plot della mappa prodotta dal modello
# set.seed(1) per mantenere la stessa classificazione

# Esercizio: classificare l'immagine in 4 classi
gcclass4 <- unsuperClass(gc, nClasses=4)
gcclass4
# immagine pesante, poi vedremo come ricampionarla senza perdere informazioni valide
clc <- colorRampPalette(c('yellow','red','blue','black'))(100)
plot(gcclass4$map, col=clc)

# confronto della classificazione con l'immagine originale
par(mfrow=c(2,1))
plot(gcclass4$map, col=clc)
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
#--------------------------------------------------------------------


# LEZIONE 11 --------------------------------------------------------
# land cover
library(raster)
library(RStoolbox) # per la classificazione
setwd("C:/Users/sofia/Desktop/lab")
l1992 <- brick("defor1_.png")
# NIR 1
# R 2
# G 3
plotRGB(l1992, 1, 2, 3, stretch = "lin")

# importa defor2 e plotta entrambe le immagini insieme
l2006 <- brick("defor2_.png")
par(mfrow=c(2,1))
plotRGB(l1992, 1, 2, 3, stretch = "lin")
plotRGB(l2006, 1, 2, 3, stretch = "lin")
----------------------------------------------------------------------------------------------------
# ggplot2 pacchetto per visualizzare i dati in modo più carino (ha anche un libro gratuito)
install.packages("ggplot2")
library(ggplot2)
ggRGB(l1992, 1, 2, 3, stretch = "lin")
ggRGB(l2006, 1, 2, 3, stretch = "lin")

# pacchetto per unire due plot:
install.packages("patchwork")
library(patchwork)
p92 <- ggRGB(l1992, 1, 2, 3, stretch = "lin")
p06 <- ggRGB(l2006, 1, 2, 3, stretch = "lin")
p1 + p2 # immagini una accanto all'altra
p1/p2 # immagini una sopra l'altra

# classificazione immagine 1992
l92c <- unsuperClass(l1992, nClasses = 2)
l92c
plot(l92c$map)
# class 1: forest  
# class 2: agricultural areas + water

# classificazione immagine 2006
l06c <- unsuperClass(l2006, nClasses = 2)
l06c
plot(l06c$map)
# class 1: forest
# class 2: agricultural areas + water

# calcolo FREQUENZA dei pixel appartenenti alla classe foresta nelle due immagini
freq(l92c$map)
riporta come commento i risultati