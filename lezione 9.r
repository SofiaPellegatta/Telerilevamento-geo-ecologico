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

