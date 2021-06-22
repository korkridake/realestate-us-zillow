library(devtools)
# install_github('sinhrks/ggfortify')
library(ggfortify)

data("AirPassengers")
AirPassengers

# ggfortify let ggplot2 know how to interpret ts objects. After loading ggfortify, 
# you can use ggplot2::autoplot function for ts objects.
autoplot(AirPassengers)
autoplot(AirPassengers, ts.colour = 'red', ts.linetype = 'dashed')

# Multivariate time series will be drawn with facets.
library(vars)
data(Canada)
autoplot(Canada, facets = TRUE)
autoplot(Canada, facets = FALSE)

# Autoplot can handle other time-series-likes.
library(xts)
autoplot(as.xts(AirPassengers), ts.colour = 'green')

# Specifying Geometrics
autoplot(AirPassengers, ts.geom = 'bar', fill = 'blue')
autoplot(AirPassengers, ts.geom = 'point', shape = 3)

# Plotting with forecast package
library(forecast)
d.arima <- auto.arima(AirPassengers)
d.forecast <- forecast(d.arima, level = c(95), h = 50)
autoplot(d.forecast)
autoplot(d.forecast, ts.colour = 'firebrick1', predict.colour = 'red',
         predict.linetype = 'dashed', conf.int = FALSE) +
  theme_minimal()

# Plotting with vars package
library(vars)
d.vselect <- VARselect(Canada, lag.max = 5, type = 'const')$selection[1]
d.var <- VAR(Canada, p = d.vselect, type = 'const')

autoplot(predict(d.var, n.ahead = 50), ts.colour = 'dodgerblue4',
         predict.colour = 'blue', predict.linetype = 'dashed')

# Plotting with changepoint package
library(changepoint)
autoplot(cpt.meanvar(AirPassengers))
autoplot(cpt.meanvar(AirPassengers), cpt.colour = 'blue', cpt.linetype = 'solid')

# Plotting with strucchange package
library(strucchange)
autoplot(breakpoints(Nile ~ 1), ts.colour = 'blue', ts.linetype = 'dashed',
         cpt.colour = 'dodgerblue3', cpt.linetype = 'solid')
