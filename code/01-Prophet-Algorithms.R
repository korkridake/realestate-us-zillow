# -------------------------------------------------------
# Sample Code of Prophet Algorithms
# -------------------------------------------------------
# In R, we use the normal model fitting API.
# We provide a prophet function that performs fitting and returns a model object. 
# You can then call predict and plot on this model object.
# R
library(prophet)
library(dplyr)
library(lubridate)

# Monthly Data
# You can use Prophet to fit monthly data. However, the underlying model is continuous-time, which means that you can get strange results if you fit the model to monthly data and then ask for daily forecasts. Here we forecast US retail sales volume for the next 10 years:

# R
df <- read.csv('../examples/example_retail_sales.csv')
m <- prophet(df)
future <- make_future_dataframe(m, periods = 3652)
fcst <- predict(m, future)
plot(m, fcst)

# R
future <- make_future_dataframe(m, periods = 120, freq = 'month')
fcst <- predict(m, future)
plot(m, fcst)

# -------------------------------------------------------
# Rent_DF_3 : Andover, CT
# -------------------------------------------------------
sample_df <- Rent_DF_3 %>% 
  filter(RegionName == "Andover" & State == "CT") %>%
  select(year, value) %>%
  dplyr::rename(ds = year, y = value)
sample_df$State <- NULL
sample_df$ds <- paste(sample_df$ds, "-01")
sample_df$ds <- ymd(sample_df$ds)
m <- prophet(sample_df[1:2])
# Make dataframe with future dates for forecasting.
future <- make_future_dataframe(m, periods = 12, freq = "month")
# Forecasting
fcst <- predict(m, future)
plot(m, fcst)
# R
# Plot the components of a prophet forecast. Prints a ggplot2 with panels for trend, 
# weekly and yearly seasonalities if present, and holidays if present
prophet_plot_components(m, fcst)

# -------------------------------------------------------
# Rent_DF_3 : All Regions
# -------------------------------------------------------
Rent_DF_3$NewRegionName <- paste(Rent_DF_3$RegionName,",", Rent_DF_3$State)
# Rent_DF_3$NewRegionName <- gsub(" ", "", Rent_DF_3$NewRegionName, fixed = TRUE)

# Select year and value 
Rent_DF_3 <- select(Rent_DF_3, year, value, NewRegionName)
Rent_DF_3$State <- NULL

# Data Preparation for Prophet Algorithms
Rent_DF_3 <- Rent_DF_3 %>% dplyr::rename(ds = year, y = value)
Rent_DF_3$ds <- paste(Rent_DF_3$ds, "-01")
Rent_DF_3$ds <- ymd(Rent_DF_3$ds)

# Split data into a list by New Region Names
mylist <- split(Rent_DF_3, factor(Rent_DF_3$NewRegionName))

# Create a nested forecasting function
prophet.newregion <- function(obj){
  
}

newlist <- lapply(mylist, state_impute)
newdataframe <- do.call(rbind, newlist)