# LEZIONE 1 -----------------------------------------------------------------------------------------
# uso immagini satellitari per misurare parametri geologici, geografici, ecologici ecc...
# scarico R e lo apro (meglio R rispetto a R studio)
# blocchi fondamentali per programmare: funzioni e argomenti: funzione = quello che si fa, argomento = quale pacchetto/libreria installare
# installo pacchetto raster tramite funzione install.packages(), il cui argomento, in questo caso, è raster, che metto all'interno delle parentesi della funzione

install.packages("raster")  # "" per richiamare oggetti esterni a R

# per richiamare il pacchetto raster dentro R uso la funzione library() del pacchetto base. c'è anche funzione require()

library(raster)
# ----------------------------------------------------------------------------------------------------------



# LEZIONE 2 --------------------------------------------------------------------------------
# R si può usare come una calcolatrice

# vediamo come fare un'assegnazione a un oggetto tramite "<-", esempio:
d <- 3 + 2
a <- 7 + 3
d + a

# vediamo il plottaggio 
# per farlo introduciamo il concetto di vettore (o array)= una serie di oggetti messi tutti insieme (es. coordinate), su R si indica con c()
# ad esempio associamo un vettore all'oggetto mam = mammiferi,  quanti mammiferi passano nei vari punti di controllo in un periodo di tempo:
mam <- c(2, 4, 7, 10, 15, 20)

# mettiamo in relazione il numero di mammiferi con zone di suolo ripristinate, ossia con la quantità per es. di piombo in esse:
suo <- c(100, 80, 50, 30, 10, 2)

# voglio mettere in relazione le due variabili che ho associato ai due vettori. considero il suolo la variabile indipendente (x) e i mammiferi quella dipendente (y)
# plottiamo tutti i valori contenuti in suo rispetto ai valori contenuti in mam con la funzione plot(x, y, ...)
plot(suo, mam)

# vediamo alcune cose che possiamo fare per modificare il plot risultante:
# 1) point character cambia la forma dei punti del grafico in base a legenda di R (c'è su google digitando "point character r")
# NB riutilizzeremo questa funzione per fare le firme spettrali
plot(suo, mam, pch=19)

# 2) vediamo come si fa a cambiare il colore dei punti del grafico: digitiamo su google: "colors in r"
# NB su r i colori sono salvati in blocchi tra virgolette, quindi le usiamo non perchè usciamo da r ma perchè sono salvati così.
# mappa visibile a tutti anche daltonici
# giallo colore più visibile per occhio umano
plot(suo, mam, pch=19, col="blue")

# 3) per aumentare o diminuire la dimensione dei punti del grafico usiamo il carattere cex= character exaggeration, che ci permette di ingrandirlo n volte rispetto a ora
plot(suo, mam, pch=19, col="blue", cex=3)

# NB se ho problemi con r, per es con la parte grafica, e voglio essere sicura di chiudere tutte le finestre grafiche, uso la funzione dev.off()
dev.off()
# -----------------------------------------------------------------------------------------------------------------



# LEZIONE 3 ---------------------------------------------------------------------------------------------------------
# richiamiamo la libreria raster, precedentemente installata con install.packages("raster"):
library(raster)

# creo cartella "lab"
# scarico i dati su cui voglio lavorare, mettendoli in un percorso corto nel PC: cartella "lab"
# setto ogni volta la cartella di lavoro, visto che su R non si possono salvare le immagini raster:
setwd("C:/Users/sofia/Desktop/lab")   # NB windows mette le sbarrette invertite

# importiamo i dati raster su R con la funzione brick() e diamo un nome alla funzione: "l2011"
l2011 <- brick("p224r63_2011_masked.grd")

# ora che ho importato i dati, digitando il nome assegnato prima, usciranno tutti i dati relativi all'immagine:
l2011

# vediamo come plottare un'immagine su R tramite la funzione plot():
plot(l2011)

# cambiamo la legenda dei colori con la funzione colorRampPalette() (NB attenzione alle maiuscole perchè r è case sensitive)
# prendiamo i nomi assegnati ai colori su su r: http://r-graph-gallery.com/42-colors-names.html e diamo un nome alla nostra nuova palette per es. "cl":
cl <- colorRampPalette(c("red","orange","yellow"))(100) # 100 è il numero di sfumature desiderato

# "col" è l'argomento da inserire nella funzione plot per plottare l'immagine nei colori appena scelti
plot(l2011, col=cl) # ottengo la visualizzazione di ogni banda con questa nuova palette di colori
#-------------------------------------------------------------------------------------------------------------------



# LEZIONE 4 --------------------------------------------------------------------------------------------------
# sistemi di riferimento: geoide, ellissoide, ...
#-------------------------------------------------------------------------------------------------------------



# LEZIONE 5 ---------------------------------------------------------------------------------------------
# recap:
library(raster)
setwd("C:/Users/sofia/Desktop/lab")
l2011 <- brick("p224r63_2011_masked.grd")
cl <- colorRampPalette(c("black","grey","ligth grey"))(100) # 100 è il numero di sfumature desiderato
plot(l2011, col=cl)

# scriviamo il nome associato alle nostre bande
# bande Landsat:
# b1= blu
# b2= verde
# b3= rosso
# b4= NIR (infrarosso vicino)

# vogliamo plottare una sola banda:
# plotto la banda del blu B1_sre:
plot(l2011$B1_sre) # plotta per nome
# lo fa coi colori standard se non specifico una palette diversa
plot(l2011[[1]]) # per plottare il primo elemento ossia la prima banda

# mettiamo la palette blu per la banda blu
clb <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(l2011$B1_sre, col=clb)

# esportiamo l'immagine appena ricavata in formato PDF nella catrtella lab con la funzione pdf():
pdf("banda1.pdf") # se non specifico un altro percorso il file si salva nella cartella lab settata con setwd all'inizio
plot(l2011$B1_sre, col=clb)
dev.off() # per chiudere la finestra dove ho plottato la banda, una volta che ho salvato il mio PDF

# stessa cosa per salvare in png:
png("banda1.png") 
plot(l2011$B1_sre, col=clb)
dev.off()
# queste funzioni esportano solo il plottaggio fatto, non un'immagine specifica creata appositamente

# come plottare più immagini insieme, 
# ad es più bande: blu e verde
# intanto creo la mia palette verde per la banda verde
clg <- colorRampPalette(c("darkgreen","green","lightgreen"))(100)
plot(l2011$B2_sre, col=clg)
# apriamo un multiframe
par(mfrow=c(1,2)) # mf = multiframe, row = metto le img su una riga
# inseriamo le bande che vogliamo plottare
clb <- colorRampPalette(c("darkblue","blue","light blue"))(100)
plot(l2011$B1_sre, col=clb)
clg <- colorRampPalette(c("darkgreen","green","lightgreen"))(100)
plot(l2011$B2_sre, col=clg)

# se voglio esportare in pdf il multiframe:
pdf("banda 1 e 2.pdf")
par(mfrow=c(1,2))
clb <- colorRampPalette(c("darkblue","blue","light blue"))(100)
plot(l2011$B1_sre, col=clb)
clg <- colorRampPalette(c("darkgreen","green","lightgreen"))(100)
plot(l2011$B2_sre, col=clg)

# se voglio plottare invertendo il multiframe = invece che in riga le immagini stanno in colonna
par(mfrow=c(2,1))
clb <- colorRampPalette(c("darkblue","blue","light blue"))(100)
plot(l2011[[1]], col=clb)
clg <- colorRampPalette(c("darkgreen","green","lightgreen"))(100) 
plot(l2011[[2]], col=clg)

# faccio il plot delle prime 4 bande (blu, verde, rosso, NIR)
par(mfrow=c(2,2))
# blu
clb <- colorRampPalette(c("darkblue","blue","light blue"))(100)
plot(l2011[[1]], col=clb)
# verde
clg <- colorRampPalette(c("darkgreen","green","lightgreen"))(100) 
plot(l2011[[2]], col=clg)
# rosso
clr <- colorRampPalette(c("coral3","coral1","coral"))(100) 
plot(l2011[[3]], col=clr)
# NIR (viola)
clnir <- colorRampPalette(c("darkorchid4","darkorchid2","plum3"))(100) 
plot(l2011[[4]], col=clnir)
#-----------------------------------------------------------------------------------------------------



# LEZIONE 6 ------------------------------------------------------------------------------------------
# richiamo codice utile
library(raster)
setwd("C:/Users/sofia/Desktop/lab")
l2011 <- brick("p224r63_2011_masked.grd")

# ESERCIZIO: plottare solo infrarosso vicino:
plot(l2011$B4_sre)
# oppure plot(l2011[[4]])
# cambio palette:
clnir <- colorRampPalette(c("darkorchid4","darkorchid2","plum3"))(100)
plot(l2011$B4_sre, col= clnir)

# vogliamo plottare le 3 bande RGB per riprodurre i colori reali
plotRGB(l2011, r=3, g=2, b=1, stretch="lin") # stretch aumenta il contrasto dei colori

# per plottare banda NIR devo togliere una delle altre
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")

# spostiamo il NIR nella componente Green dell'RGB
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")

# per vedere meglio zone in suolo nudo passiamo NIR nel blu
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")

# proviamo lo stretch a istogrammi
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# ESERCIZIO: fare un multiframe con sopra il visibile in RGB e stretch lineare, sotto immagine in falso colore con stretch a istogrammi
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# upload immagine Landsat del 1988
l1988 <- brick("p224r63_1988_masked.grd")
l1988 # per visualizzarne i dati

# multiframe con le foto del 1988 e 2011
par(mfrow=c(2,1))
plotRGB(l1988, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")

# NDVI misura se una pianta è sana o no
#-----------------------------------------------------------------------------------------------------------------------



# LEZIONE 7 -----------------------------------------------------------------------------------------------------------
# NDVI indice di vegetazione basato sulla differenza tra due bande
# DVI = riflettanza NIR - riflettanza RED

# lavoriamo con questi indici spettrali
library(raster) #richiamo libreria che mi serve
setwd("C:/Users/sofia/Desktop/lab")

# ESERCIZIO: importa le foto del Rio Peixoto
rpl1992 <- brick("defor1_.png")
rpl1992

# può servire installare gdal
# install.packages("rgdal")
# library(rgdal)

# facciamo un primo plot dell'immagine
plotRGB(rpl1992, r=1, g=2, b=3, stretch="lin")
# banda 1 = NIR 
# banda 2 = RED 
# banda 3 = GREEN (segue ordine spettro elettromagnetico)

# ESERCIZIO: importare l'altro file di Rio Peixoto del 2006
rpl2006 <- brick("defor2_.png")
rpl2006

# la plottiamo
plotRGB(rpl2006, r=1, g=2, b=3, stretch="lin")

# multiframe con le due immagini
par(mfrow=c(2,1))
plotRGB(rpl1992, r=1, g=2, b=3, stretch="lin")
plotRGB(rpl2006, r=1, g=2, b=3, stretch="lin")

# DVI = Difference vegetation index
dvi1992 = rpl1992[[1]] - rpl1992[[2]]
dvi1992

# plottiamo il DVI 1992
cl <-colorRampPalette(c('darkblue', 'yellow', 'red', 'black'))(100)
plot(dvi1992, col = cl)

# DVI 2006
dvi2006 = rpl2006[[1]] - rpl2006[[2]]
dvi2006
plot(dvi2006, col = cl)

# DVI usando i nomi delle bande invece che l'elemento
dvi1992 = rpl1992$defor1_.1 - rpl1992$defor1_.2
dvi1992

# variazione DVI nel tempo:
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue', 'white', 'red'))(100)
plot(dvi_dif, col = cld)
# rosso = alta differenza di DVI, ossia negli anni c'è stata molta deforestazione
#----------------------------------------------------------------------------------------------------------------------



# LEZIONE 8 -----------------------------------------------------------------------------------------------------------
# NDVI indice che normalizza/standardizza il DVI sulla somma delle due bande
# utile per confrontare anche immagini di dimensioni diverse (n bit diverso):
# risoluzione radiometrica = quanti bit ci sono all'interno di un'immagine
# 2^8 = 256, 2^6 = 65536 bit

# 8 bit:
# DVI max = 255 - 0 = 255
# DVI min = 0 - 255 = -255
# range DVI 8 bit: -255 a 255
# NDVI 8 bit:
# max = (255 - 0)/(255 + 0) = 1
# min = (0 - 255)/(0 + 255) = -1
# range NDVI 8 bit: -1 a 1

# 16 bit:
# range DVI 16 bit: -65535 a 65535
# NDVI 16 bit:
# max = (65535 - 0) / (65535 + 0) = 1
# min = (0 - 65535) / (0 + 65535) = -1
# range NDVI 8 bit: -1 a 1

# carichiamo libreria che serve per calcolo NDVI:
install.packages("rgdal")
library(rgdal)
setwd("C:/Users/sofia/Desktop/lab")
rpl1992 <- brick("defor1_.png") # funzione brick carica un intero blocco di bande
rpl2006 <- brick("defor2_.png")

# NDVI 1992
ndvi1992 = (rpl1992[[1]] - rpl1992[[2]]) / (rpl1992[[1]] + rpl1992[[2]])
ndvi1992

# plot NDVI 1992
cl <-colorRampPalette(c('darkblue', 'yellow', 'red', 'black'))(100)
plot(ndvi1992, col = cl)

# multiframe con plotRGB immagine sopra e NDVI 1992 sotto
par(mfrow=c(2,1))
plotRGB(rpl1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col = cl)

# NDVI 2006
ndvi2006 = (rpl2006[[1]] - rpl2006[[2]]) / (rpl2006[[1]] + rpl2006[[2]])
ndvi2006

# multiframe con NDVI 1992 sopra e NDVI 2006 sotto
par(mfrow=c(2,1))
plot(ndvi1992, col = cl)
plot(ndvi2006, col = cl)
# valori vicino allo 0 sono quasi sempre suolo nudo

# installo libreria utile per gli indici di vegetazione
install.packages("RStoolbox") 
install.packages("devtools")
library(devtools)


# indici spettrali automatici con la funzione spectralIndices
si1992 <- spectralIndices(rpl1992, green=3, red=2, nir=1)
plot(si1992, col = cl)
# 2006
si2006 <- spectralIndices(rpl2006, green=3, red=2, nir=1)
plot(si2006, col = cl)


install.packages("rasterdive")
library(rasterdiv)

# copNDVI è NDVI medio europeo dal 1999 al 2017: più è alto migliore è la condizione degli ecosistemi
# vediamo com'è:
plot(copNDVI)
#-----------------------------------------------------------------------------------------------------------------



