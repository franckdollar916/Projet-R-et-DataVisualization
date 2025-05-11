source("R/helpers.R")

url <- "https://www.data.gouv.fr/fr/datasets/r/5fc299c0-4598-4c29-b74c-6a67b0cc27e7"
raw_file <- "data/raw/dataset.csv"
cleaned_file <- "data/cleaned/cleaned_dataset.csv"

download_raw_data(url, raw_file)
clean_data(raw_file, cleaned_file)

accidents <- read_csv(cleaned_file, show_col_types = FALSE)
