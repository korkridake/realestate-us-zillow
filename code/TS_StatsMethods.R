library(stats)

# -------------------------------------
# Creating a Times Series
# -------------------------------------

# save a numeric vector containing 72 monthly observations
# from Jan 2009 to Dec 2014 as a time series object
myts <- ts(myvector, start=c(2009, 1), end=c(2014, 12), frequency=12) 

# subset the time series (June 2014 to December 2014)
myts2 <- window(myts, start=c(2014, 6), end=c(2014, 12)) 

# plot series
plot(myts)

# -------------------------------------
# Seasonal Decomposition
# -------------------------------------