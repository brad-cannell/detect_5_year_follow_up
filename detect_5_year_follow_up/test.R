library(dplyr)
library(readr)
library(readxl)

intakes <-  read_xlsx("data/Initial Intakes.xlsx")
investigations <- read_xlsx("data/investigations.xlsx")
clients <- read_xlsx("data/Clients.xlsx")
allegations <- read_xlsx("data/Allegations.xlsx")

# Raw counts (cases)
raw_intake_cases <- length(intakes$`Case ID`)
raw_invest_cases <- length(investigations$`Case ID`)
raw_alleg_cases <- length(allegations$`Case ID`)

# Unique counts (cases)
dedup_intake_cases <- n_distinct(intakes$`Case ID`)
dedup_invest_cases <- n_distinct(investigations$`Case ID`)
dedup_alleg_cases <- n_distinct(allegations$`Case ID`)

# Raw counts (client)
raw_intake_clients <- length(intakes$`Client ID`)
raw_invest_clients <- length(investigations$`Client ID`)

# Unique counts (client)
dedup_intake_clients <- n_distinct(intakes$`Client ID`)
dedup_invest_clients <- n_distinct(investigations$`Client ID`)

# Unique Counts (Investigations)
dedup_alleg_investigations <- n_distinct(allegations$`Investigation ID`)
dedup_invest_investigations <- n_distinct(investigations$`Investigation ID`)

# Unique Counts (Allegations)

print(glue::glue("There are {raw_intake_cases} non-unique and {dedup_intake_cases} unique cases in Intake"))
print(glue::glue("There are {raw_invest_cases} non-unique and {dedup_invest_cases} unique cases in Investigations"))
print(glue::glue("There are {raw_alleg_cases} non-unique and {dedup_alleg_cases} unique cases in Allegations"))

print(glue::glue("There are {raw_intake_clients} non-unique and {dedup_intake_clients} unique clients in Intake"))
print(glue::glue("There are {raw_invest_clients} non-unique and {dedup_invest_clients} unique clients in Investigations"))

# Morri's cleaned Data
morri_aps_clients <- read_rds("data/aps_01_prepped_for_fl.rds")
morri_medstar_record <- read_rds("data/medstar_01_record-lvl.rds")
morri_medstar_subjects <- read_rds("data/medstar_02_subj-lvl.rds")

# Unique counts (Morri's cases)
raw_morri_aps_clients <- length(morri_aps_clients$client_id)
dedup_morri_aps_clients <- n_distinct(morri_aps_clients$client_id)