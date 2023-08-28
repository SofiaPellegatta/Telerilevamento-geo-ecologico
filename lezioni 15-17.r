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
dsm_2013 <- raster("C:/Users/sofia/Desktop/lab/2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013
dtm_2013 <- ("C:/Users/sofia/Desktop/lab/2013Elevation_DigitalTerrainModel-0.5m.tif")
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
dsm_2004 <- raster("C:/Users/sofia/Desktop/lab/2004Elevation_DigitalElevationModel-2.5m.tif")
dsm_2004
dtm_2004 <- raster("C:/Users/sofia/Desktop/lab/2004Elevation_DigitalTerrainModel-2.5m.tif")
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
point_cloud <- readLAS("C:/Users/sofia/Desktop/lab/LIDAR-PointCloudCoverage-2013SolarTirol.laz")

#plot point cloud
plot(point_cloud)

# maggiore variazione in altezza delle piante = maggior biodiversità 
#------------------------------------------------------------------------------------------------------------



# LEZIONE 16 ------------------------------------------------------------------------------------------
# un cartogramma distorce le forme di una carta in base a una determinata variabile

# DA R A LaTeX:
# R:
funzione(argomento1, argomento2, ...)
# commento

# latex:
\funzione{}
% commento

# in R
library(package)
# in latex
\usepackage{graphicx}

% \function{}
% % per commentare

\documentclass[a4paper, 12pt]{article}
\usepackage[utf8]{inputenc}
\usepackage{graphicx} % Required for inserting images
\usepackage{color} % per cambiare colore
\usepackage{hyperref}
\usepackage{lineno}
\linenumbers
\usepackage{listings}
\usepackage{natbib}

% tr <- textcolor(red)
\newcommand{\tr}{\textcolor{red}}
\title{Telerilevamento geo-ecologico}
\author{Sofia Pellegatta}
%\date{August 2023}

\begin{document}

\maketitle
\tableofcontents
% abstract
% keywords
% introduzione, sempre con lo scopo esposto alla fine


\section{Introduction}
Remote Sensing of Environment \textcolor{red}{(RSE)} serves the Earth observation community with the publication of results on the theory, science, applications, and technology of studies contributing to advance the science of remote sensing. Thoroughly interdisciplinary, \tr{RSE} publishes on terrestrial, oceanic and atmospheric sensing. 
% \noindent se non vuoi che andando a capo metta la rientranza

The emphasis of the journal is on biophysical and quantitative approaches to remote sensing at local to global scales and covers a wide range of applications and techniques.\\

Original Research Articles should describe important significant new results or methods that will advance the science or application of remote sensing. 

\smallskip 
The main contribution should be the remote sensing component, rather than investigation of an environmental problem in which remote sensing does not play a major role. 

\bigskip
Papers dealing with single study sites are welcome, although the sites should be representative of broad conditions suitable for drawing conclusions of interest to the international audience of this journal. Studies based on close-range sensing (hand-held, IoT, UAV) are welcome if they show sufficient advances in RS methodology which can be generalized for large-area applications.


\section{Study area}
% come inserire un'immagine
Review Articles should provide a thorough review of the current state-of-the-art of an important subject in remote sensing, by providing insights and perspectives on the trends, with a synthesis of previous work beyond literature compilation or bibliometric studies (Figure \ref{fig: monte}).
\begin{figure}
\centering
\includegraphics[width=0.9\textwidth]{monte_catalfano.jpg}
\caption{Monte Catalfano}
\label{fig: monte}
\end{figure}


\section{Methods}
Scientists use a dynamic, open-ended process to investigate questions. Here are the five steps.
1. Define a Question to Investigate.
2. Make Predictions
3. Gather Data
4. Analyze the Data
5. Draw Conclusions


\subsection{Formulas}
Formula used in this manuscript:
% latex mathematics su google per la guida
\begin{equation}
F = \frac {\sqrt[3]{G \times \frac{m_{1} \times m_{2}}{d^{2}}}}{-\sum_{i=1}^{10}{p(x) \times \log{p(x)}}}
\label{eq: newton}
\end{equation}

% mettiamo una formula direttamente nel testo:
bla bla $F = G \times m_{1} \times \mu$.

\subsection{Codes}
Code used:
\lstinputlisting[language=R]{prova.r}
\section{Results}
Il risultato della percentuale di cadmio è 15\%.
questi risultati sono stati ottenuti dall'equazione \ref{eq: newton}.

\section{Discussion}



\end{document}

