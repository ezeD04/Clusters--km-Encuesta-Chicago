# Análisis de Encuesta con K-Means

Este proyecto aplica **clustering no supervisado (K-Means)** sobre una base de datos de encuestas políticas en Chicago.  
El objetivo es **identificar perfiles de votantes** y analizar su relación con la elección presidencial de 2024.  
---

## 📊 Flujo del análisis

1. **Preparación de datos**  
   - Se genera un dataframe ciego (`df_ciego`) eliminando la variable dependiente (intención de voto).  #la idea es que sea aprendizaje no supervisado
   - Se transforman todas las variables categóricas en numéricas mediante `as.numeric(as.factor(x))`.  

2. **Aplicación de K-Means**  
   - Se ejecuta `kmeans(df_num, centers = 3)` para segmentar en 3 clusters (uno para cada candidato + otro por el error).  
   - Se visualizan los clusters con `autoplot()`.  

3. **Centroides e interpretación**  
   - Se construye un dataframe con los centroides resultantes.  
   - Se reemplazan los valores numéricos por sus categorías originales para facilitar la interpretación (edad, género, etnia, educación, localidad).  

4. **Integración con los datos originales**  
   - Se combina el dataframe ciego con las etiquetas de cluster y la variable de voto real.  

5. **Análisis de proporciones de voto por cluster**  
   - Se construye una tabla de contingencia cruzando cluster vs. voto.  
   - Se calculan los porcentajes de apoyo a los candidatos principales (Trump y Harris).  

---

- Paquetes:  
  - `ggfortify` (para `autoplot`)  
  - `stats` (para `kmeans`)  

---

## 📂 Estructura del código

- Preparación de datos  
- Transformación a numérico  
- K-Means  
- Identificación de centroides  
- Construcción de dataframe con clusters  
- Cálculo de proporciones de voto por cluster  

---

## 📌 Ejemplo de salida
- **Clusters identificados:**  
  - Cluster 1: Votantes de 30–34 años, femenino, blanco, secundaria completa, zona Northwest.  
  - Cluster 2: Votantes de 60–64 años, femenino, blanco, secundaria completa, zona Northwest.  
  - Cluster 3: Votantes de 55–59 años, masculino, hispano/latino, secundaria completa, zona Northwest.  

- **Proporción de voto por cluster:**  
  - Se reportan los porcentajes de voto hacia *Donald Trump (Republicano)* y *Kamala Harris (Demócrata)* según cluster.

