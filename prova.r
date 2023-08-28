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