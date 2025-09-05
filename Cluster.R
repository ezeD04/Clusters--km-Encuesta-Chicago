library(ggfortify)
library(ggplot2)
library(dplyr)
library(stats)
library(readxl)
#------------------------------------
df_ciego <-encuesta_chicago[,-6] #genero el df sin la variable que me interesa

#TRANSFORMAR A NUMERICO------------------------
df_num <- df_ciego
df_num[] <-lapply(df_num, function(x){ as.numeric(as.factor(x))})
#[implica cambio. no reemplazo], la funcion (de columna x) transforma en factor-> numerico

#APLICAR K-MEANS-------------------------------------
km <-kmeans(df_num,centers = 3) #kmean(datos,cantidad de centros)
autoplot(km,df_num) #ver los clusters

#ARMAR DF DE CENTROS------------------------
round(km$centers[,c(1,2,3,4,5)]) #ver los centroides
df_centroides <- as.data.frame(round(km$centers[,c(1,2,3,4,5)])) #armar un Df con los centros

#REEMPLAZO LOS CENTROS------------------------
df_centroides
levels(factor(df_ciego$Edad))
levels(factor(df_ciego$Género))
levels(factor(df_ciego$Etnia))
levels(factor(df_ciego$`Nivel educativo`))
levels(factor(df_ciego$Localidad))
df_centroides[1,] <- c("30-34","Femenino","Blanco","Secundaria completa","NORTHWEST")
df_centroides[2,] <- c("60-64","Femenino","Blanco","Secundaria completa","NORTHWEST")
df_centroides[3,] <- c("55-59","Masculino","Hispano/Latino","Secundaria completa","NORTHWEST")
df_centroides
#sumamos al df original con cbind(pega columnas) el dfciego, la columna claster y la columna voto
df_con_clusters <- cbind(df_ciego, cluster = km$cluster, voto_real = encuesta_chicago$`¿Por quién votó en las elecciones presidenciales de 2024?`)

#PROPORCION % VOTOS X CLUSTER---------------------
tabla <- table(df_con_clusters$cluster, df_con_clusters$voto_real)
100*(prop.table(tabla[,c("Donald Trump (Republicano)","Kamala Harris (Demócrata)")]))

