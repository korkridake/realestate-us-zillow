# ------------------------------------------------------
# Zillow Zip Code Time Series 
# Date : Wednesday, March, 28, 2018
# Author: Korkrid Akepanidtaworn, Wesleyan University
# ------------------------------------------------------
# Loading packages
library(tidyverse)
library(tidyr)
library(readr)
library(ggplot2)
library(ggthemes)
library(prophet)

# Import Data
Rent_DF <- read_csv("E:/Zillow Research/Rental Value Data/City_ZriPerSqft_AllHomes.csv")

Rent_DF$SizeRank <- NULL

# Check data dimensionality
cat("This data set comprises of", dim(Rent_DF)[1], 'observations and ',dim(Rent_DF)[2], 'variables.')

# Get a glimpse of my data
print("Get a Glipmse of the listing data :")
glimpse(Rent_DF)

# Frequency of States
table(Rent_DF$State)

Rent_DF_2 <- Rent_DF %>% 
  dplyr::group_by(State) %>%
  dplyr::filter(State == "CT" | 
                  State == "VT" | 
                  State == "RI" |
                  State == "MA" | 
                  State == "NH" | 
                  State == "ME") %>%
  dplyr::arrange(-desc(State),  -desc(RegionName))

# Get column names
names(Rent_DF_2)

# Reshaping data.frame from wide to long format
# https://stackoverflow.com/questions/2185252/reshaping-data-frame-from-wide-to-long-format
Rent_DF_3 <- Rent_DF_2 %>% gather(year, value, -(1:5))