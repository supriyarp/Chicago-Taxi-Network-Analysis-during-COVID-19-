title: "Community_detection_Chicago_taxi"
author: "Supriya"
date: "11/21/2020"
output: html_document
---
  
install.packages('RJSONIO')
install.packages('gridExtra')
install.packages('RSocrata')
  ```{r, message=FALSE}
library(dplyr)
library(tidyr) 
library(RJSONIO)
library(jsonlite)
library(tidyverse)
library(data.table)
library(ggplot2)
library(gridExtra)
library(igraph)
library(ggplot2)
library(forcats)
library(tidyverse)
```

```{r}
#Read data
library(RSocrata)

socrataEmail <- Sys.getenv("SOCRATA_EMAIL", "sramar2@uic.edu")
socrataPassword <- Sys.getenv("SOCRATA_PASSWORD", "Supriya564")

t <- paste0("https://data.cityofchicago.org/resource/wrvz-psew.json?", "$where=trip_start_timestamp between '2020-05-01T00:00:00' and '2020-09-30T23:59:59'")
data <- read.socrata(t,  email = socrataEmail, password = socrataPassword, stringsAsFactors = FALSE)

data$pickup_centroid_location.coordinates <-as.character(data$pickup_centroid_location.coordinates)
data$dropoff_centroid_location.coordinates <-as.character(data$dropoff_centroid_location.coordinates)
str(data)
write.csv(data, "raw.csv", row.names = F)
```
