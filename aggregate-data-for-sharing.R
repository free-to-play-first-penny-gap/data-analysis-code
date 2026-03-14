# install and load the dplyr package if not already installed
#install.packages("dplyr")
#install.packages("tidyverse")
library(dplyr)
library(tidyverse)

# set working directory
setwd("/Users/omz6965/Dropbox/Research/A_Selling Virtual Good Endowments/Data/Clean Data Selling Endowments in Virtual Worlds_2026")

# load datasets
data_1 <- read.csv("Experiment 1 - Low-Mid-High/experiment1_data_prepped.csv", header=TRUE, sep=",")
data_1$X <- NULL
data_1$X.1 <- NULL
data_1$unique_id <- as.factor(data_1$unique_id)

data_2 <- read.csv("Experiment 2 - Simple-Skimming/experiment2_data_prepped.csv", header=TRUE, sep=",")
data_2$X <- NULL
data_2$unique_id <- as.factor(data_2$unique_id)

data_3 <- read.csv("Experiment 3 - Personalized-Skimming/experiment3_data_prepped.csv", header=TRUE, sep=",")
data_3$X <- NULL
data_3$unique_id <- as.factor(data_3$unique_id)

### dataset for experiment 1
# define grouping columns
grouping_columns <- c("test_bucket", "device_tier", "country_tier_new")

# define columns to be excluded from mean and sd calculations
excluded_columns <- c("unique_id", "join_date", "join_ts",
                      "country", "country_tier", "device_os", 
                      "device_make", "device_model", "device_gpu", "device_cpu",
                      "device_tierAndroid.tier.1", "device_tierAndroid.tier.2",
                      "device_tierAndroid.tier.3", 
                      "device_tierAndroid.tier.4", "device_tierAndroid.tier.5", 
                      "country_tierCountry.tier.2", "country_tierCountry.tier.3", 
                      "country_tierCountry.tier.4", "country_tierCountry.tier.5", 
                      "country_tierCountry.tier.1")

# check column names to ensure variables_to_collapse is correctly identified
variables_to_collapse <- setdiff(names(data_1), c(grouping_columns, excluded_columns))
print(variables_to_collapse)

# collapse dataset by category retaining mean and standard deviation
collapsed_data_1 <- data_1 %>%
  group_by(across(all_of(grouping_columns))) %>%
  summarise(
    unique_id_count = n(),
    across(all_of(variables_to_collapse), 
           list(mean = ~ mean(.x, na.rm = TRUE), sd = ~ sd(.x, na.rm = TRUE)), 
           .names = "{.col}_{.fn}")
  ) %>%
  ungroup()

### dataset for experiment 2
# define grouping columns
grouping_columns <- c("test_bucket", "country_tier")

# define columns to be excluded from mean and sd calculations
excluded_columns <- c("unique_id", "country_tierCountry.tier.2", "country_tierCountry.tier.3", 
                      "country_tierCountry.tier.4", "country_tierCountry.tier.1")

# define the variables to be collapsed
variables_to_collapse <- setdiff(names(data_2), c(grouping_columns, excluded_columns))

# collapse dataset by Category retaining mean and standard deviation
collapsed_data_2 <- data_2 %>%
  group_by(across(all_of(grouping_columns))) %>%
  summarise(
    unique_id_count = n(),
    across(all_of(variables_to_collapse), list(mean = ~ mean(.x, na.rm = TRUE), sd = ~ sd(.x, na.rm = TRUE)), .names = "{.col}_{.fn}")
  ) %>%
  ungroup()

### dataset for experiment 3
# define grouping columns
grouping_columns <- c("test_bucket", "device_tier", "country_tier")

# define columns to be excluded from mean and sd calculations
excluded_columns <- c("unique_id", "device_os",
                      "device_tierAndroid.tier.1", "device_tierAndroid.tier.2",
                      "device_tierAndroid.tier.3", 
                      "device_tierAndroid.tier.4", "device_tierAndroid.tier.5", 
                      "country_tierCountry.tier.2", "country_tierCountry.tier.3", 
                      "country_tierCountry.tier.4", "country_tierCountry.tier.1")

# define the variables to be collapsed
variables_to_collapse <- setdiff(names(data_3), c(grouping_columns, excluded_columns))

# collapse dataset by Category retaining mean and standard deviation
collapsed_data_3 <- data_3 %>%
  group_by(across(all_of(grouping_columns))) %>%
  summarise(
    unique_id_count = n(),
    across(all_of(variables_to_collapse), list(mean = ~ mean(.x, na.rm = TRUE), sd = ~ sd(.x, na.rm = TRUE)), .names = "{.col}_{.fn}")
  ) %>%
  ungroup()

# export csvs
write.csv(collapsed_data_1,"Experiment 1 - Low-Mid-High/experiment1_data_aggregated.csv")
write.csv(collapsed_data_2,"Experiment 2 - Simple-Skimming/experiment2_data_aggregated.csv")
write.csv(collapsed_data_3,"Experiment 3 - Personalized-Skimming/experiment3_data_aggregated.csv")
