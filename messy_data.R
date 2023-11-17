library(tidyverse) 
library(janitor) 
library(dplyr)
library(skimr)
messy_data <- readRDS("C:/data management/messy_data.RDS")
messy_data |>  names()
janitor::clean_names(messy_data) |>  names()

messy_data |>  names() <- janitor::clean_names(messy_data) |>  names()
sp <- unique(messy_data$species_name)
messy_data$species_name <-

  case_when(
  messy_data$species_name == sp[1] ~ sp[4],
  messy_data$species_name == sp[2] ~ sp[4],
  messy_data$species_name == sp[5] ~ sp[3],
  .default = as.character(messy_data$species_name)
)
  unique(messy_data$species_name)
 
  sp <- unique(messy_data$age)
  sp
  messy_data$age <-
    
    case_when(
      messy_data$age == sp[1] ~ sp[5],
      messy_data$age == sp[4] ~ sp[5],
      messy_data$age == sp[2] ~ sp[3],
      messy_data$age == sp[6] ~ sp[3],
      .default = as.character(messy_data$age)
    )
  unique(messy_data$age)

library(parsedate)  
library(datefixR)
not_messy_data <- datefixR::fix_date_df(messy_data, "Date")
  
mutate(clean_age = case_when(age%in%c("J", "Juvenile", "Juvenile"))) # not #finished

 # wrangling: pivot_wider(names_from = "year", values_from = "pop"") 
# Transport to long formate: library (tidyverse) 
# conflicted::conflict_prefer("filter", "dplyr")
# Pivot longer....
# wide formate: penguin_long ´>
#mutate(sample=row_number)...

