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
p92 + p06 # immagini una accanto all'altra
p92/p06 # immagini una sopra l'altra

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
# class 1: agricultural areas + water
# class 2: forest

# calcolo FREQUENZA dei pixel appartenenti alla classe foresta nelle due immagini
freq(l92c$map)
# value  count
# [1,]     1 307259 for
# [2,]     2  34033 agr
freq(l06c$map)
#  value  count
# [1,]     1 164906 agr
# [2,]     2 177820 for
#-------------------------------------------------------------------------------------------



# LZIONE 12 ---------------------------------------------------------------------------------
# ANALISI PATTERN SPAZIALI
library(raster)
library(ggplot2)
library(patchwork)
library(RStoolbox)
setwd("C:/Users/sofia/Desktop/lab")
l1992 <- brick("defor1_.png")
l2006 <- brick("defor2_.png")
ggRGB(l1992, 1, 2, 3, stretch = "lin")
ggRGB(l2006, 1, 2, 3, stretch = "lin")

# percentuali 1992
# percentuale area foreste nel 1992
pix92 <- 341292
proporz92_for <- 307259 / pix92
proporz92_for # = 0.9002819
perc92_for <- (307259 / pix92) * 100
perc92_for # = 90.02819

# esercizio: percentuale aree agricole nel 1992
proporz92_agr <- 34033 / pix92
proporz92_agr # = 0.09971813 
perc92_agr <- (34033 / pix92) * 100
perc92_agr # = 9.971813
# oppure
perc92_agr <- 100 - perc92_for

# percentuali 2006
# foresta
pix06 <- 342726
perc06_for <- 177820 / pix06 * 100
perc06_for # = 51.88401

# agricolo
perc06_agr <- 100 - perc06_for
perc06_agr # = 48.11599

# RECAP DATI:
# percentuale foresta 92 = 90.02819
# percentuale agricola 92 = 9.971813
# percentuale foresta 06 = 51.88401
# percentuale agricola 06 = 48.11599

# creiamo un DATAFRAME = una tabella coi dati ricavati
# colonne
Classe <- c("Foresta", "Agricoltura")
percent_1992 <- c(90.02819, 9.971813)
percent_2006 <- c(51.88401, 48.11599)
multitemp <- data.frame(Classe, percent_1992, percent_2006)
multitemp
View(multitemp)
# 1992 istogramma
ggplot(multitemp, aes(x=Classe, y=percent_1992, color=Classe)) +
geom_bar(stat="identity", fill="blue")

# 2006 istogramma
ggplot(multitemp, aes(x=Classe, y=percent_2006, color=Classe)) +
geom_bar(stat="identity", fill="blue")

# pdf
pdf("istogramma_1992.pdf")
ggplot(multitemp, aes(x=Classe, y=percent_1992, color=Classe)) +
geom_bar(stat="identity", fill="blue")

dev.off()

# pdf
pdf("istogramma_2006.pdf")
ggplot(multitemp, aes(x=Classe, y=percent_2006, color=Classe)) +
geom_bar(stat="identity", fill="blue")
dev.off()

# MISURA DELLA VARIABILITA' NELLO SPAZIO
install.packages("viridis")
#----------------------------------------------------------------------------------



# LEZIONE 13 ----------------------------------------------------------------------
# VARIABILITA'
# variazioni nella roccia e nel land cover
library(raster)
library(RStoolbox)
library(ggplot2)
library(viridis)
setwd("C:/Users/sofia/Desktop/lab")

# esercizio: importa immagine Similaun
sim <- brick("sentinel.png")

# esercizio: plotta immagine con funzione ggplot2
ggRGB(sim, 1, 2, 3, stretch="lin") 
# ggplot plotta immagine anche senza mettere "stretch":
ggRGB(sim, 1, 2, 3)
# bande diverse:
ggRGB(sim, 2, 1, 3)
# plottiamole insieme:
library(patchwork)
sim1 <- ggRGB(sim, 1, 2, 3)
sim2 <- ggRGB(sim, 2, 1, 3)
sim1 + sim2

# la variabilità si calcola usando una finestra mobile che si sposta lungo l'immagine

# calcoliamo la VARIABILITA' DEL NIR con finesta 3x3
nir <- sim[[1]]
plot(nir)
sd_nir <- focal(nir, matrix(1/9, 3, 3), fun=sd)
clsd <- colorRampPalette(c('blue', 'green', 'pink', 'magenta', 'orange', 'brown', 'red', 'yellow'))(100)
plot(sd_nir, col=clsd)
# ggplot del singolo raster (non RGB)
ggplot() + 
geom_raster(sd_nir, mapping=aes(x=x, y=y, fill=layer))
# proviamo il plot con viridis:
ggplot() + 
geom_raster(sd_nir, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("deviazione standard con viridis")
# cividis
ggplot() + 
geom_raster(sd_nir, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "cividis") +
ggtitle("deviazione standard con cividis")
# magma
ggplot() + 
geom_raster(sd_nir, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("deviazione standard con magma")

# VARIABILITA' con finestra 7x7
nir <- sim[[1]]
sd7_nir <- focal(nir, matrix(1/49, 7, 7), fun=sd)
ggplot() + 
geom_raster(sd7_nir, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("deviazione standard con magma 7x7")
#-------------------------------------------------------------------------------------------------
