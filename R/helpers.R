library(readr)
library(dplyr)
library(lubridate)

download_raw_data <- function(url, destfile) {
  if (!dir.exists(dirname(destfile))) {
    dir.create(dirname(destfile), recursive = TRUE)
  }
  download.file(url, destfile, mode = "wb")
}

clean_data <- function(input_file, output_file) {
  if (!dir.exists(dirname(output_file))) {
    dir.create(dirname(output_file), recursive = TRUE)
  }
  
  df <- read_delim(input_file, delim = ";", locale = locale(decimal_mark = ",")) %>%
    filter(!if_all(everything(), is.na)) %>%
    mutate(
      jour = as.integer(jour),
      mois = as.integer(mois),
      an = as.integer(an),
      hrmn = parse_time(as.character(hrmn), format = "%H:%M:%S"),
      lat = as.numeric(gsub(",", ".", lat)),
      long = as.numeric(gsub(",", ".", long))
    ) %>%
    rename(
      AccidentID = Accident_Id,
      Jour = jour,
      Mois = mois,
      An = an,
      HeureMinute = hrmn,
      Lumiere = lum,
      Departement = dep,
      Commune = com,
      ZoneAgglomeration = agg,
      Intersection = int,
      ConditionsAtmospheriques = atm,
      TypeCollision = col,
      Adresse = adr
    )
  
  write_csv(df, output_file)
}
