library(tidycensus)

dmv_ct <- get_acs(geography = "county",
                  year = 2019,
                  variables = c(median_household_income = "B19013_001"),
                  state = c("VA", "DC", "MD"),
                  survey = "acs5",
                  output = "tidy",
                  geometry = FALSE)

dmv_ct$year <- "2019"
dmv_ct$region_type <- "county"

dmv_tr <- get_acs(geography = "tract",
                  year = 2019,
                  variables = c(median_household_income = "B19013_001"),
                  state = c("VA", "DC", "MD"),
                  survey = "acs5",
                  output = "tidy",
                  geometry = FALSE)

dmv_tr$year <- "2019"
dmv_tr$region_type <- "tract"

dmv_bg <- get_acs(geography = "block group",
                  year = 2019,
                  variables = c(median_household_income = "B19013_001"),
                  state = c("VA", "DC", "MD"),
                  survey = "acs5",
                  output = "tidy",
                  geometry = FALSE)

dmv_bg$year <- "2019"
dmv_bg$region_type <- "block group"



dmv_cttrbg <- rbind(dmv_ct, dmv_tr, dmv_bg)

data.table::fwrite(dmv_cttrbg,
                   "Pay and Benefits/Household Income/data/original/dmv_cttr_bg_2019_median_household_income.csv",
                   append = FALSE)
