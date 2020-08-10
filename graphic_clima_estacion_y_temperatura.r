
rm(list = ls())

# cargar paquetes ---------------------------------------------------------


library(dplyr)    
library(lubridate) 
library(ggplot2)   
library(fields)     
library(datos)
setwd()


# luego de cambiar el directorio  -----------------------------------------

# cargamos el paquete de datos en la libreria datos -----------------------
#convertimos clima en climaE para no tener mucha confusion

ClimaE <- datos::clima



#tomamos una mnuestra  de la poblacion (para obtener una mejor visualizacion de los datos(solo es para visualizar ,en este caso no vemos que tan representativo sea))


n<-732
muestra<- sample(1:nrow(ClimaE), size = n,replace = FALSE)
ClimEE<-ClimaE[muestra,]

# ggplot  -----------------------------------------------------------------


ggplot(ClimEE,aes(x=origen,y=temperatura))+ # mapeando 
  geom_boxplot(outlier.shape = NA)+ #  boxplot
  geom_jitter(aes(fill=temperatura), 
              position=position_jitter(width = .2),
              shape=21, #Definiendo o tipo de punto
              col='grey29', #Definiendo color de contorno
              alpha=.5)+ # Definindo los puntos
  labs(y='temperatura medida en grados Fahrenheit ', 
       x="Estación de clima", 
       caption = "@Martinezkenneth2 (sigueme en facebook)",
       fill='°F')+ #Definiendo titulo da legenda 
  scale_fill_gradientn(colours = tim.colors(20))+ # Definiendo escala de colores para los puntos
  theme_bw()+ #Definindo tema 
  theme(panel.grid.major.x = element_blank())+ #agregando la cuadricula al grafico
  ggtitle("Estaciones y Temperatura en el registro de aviación") #titulo de grafico
#############################
gsave(filename = 'figuras/boxplot_p.png',
      width = 7.02,
      height = 3.55)



## contato:                          
## instagram: @_brandonth                            
##################################################################


