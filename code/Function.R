citycast <- function(data = full.data, type, state, regionname){
  library(forecast)
  library(prophet)
  library(ggplot2)
  library(lubridate)
  a <- data[data$Rental.Metrics == type & data$State == state & data$RegionName == regionname, ] 
  a.2 <- a[c("year", "value")]
  a.2$ds <- a.2$year
  a.2$y <- a.2$value
  a.2$ds <- paste(a.2$ds, "-01")
  a.2$ds <- ymd(a.2$ds)
  result <- prophet(a.2[3:4])
  # Make dataframe with future dates for forecasting.
  future <- make_future_dataframe(result, periods = 12, freq = "month")
  # Forecasting
  fcst <- predict(result, future)
  plot1 = plot(result, fcst)
  plot1 = plot1 + labs(title = paste(regionname, state))
  plot(plot1)
  # R
  # Plot the components of a prophet forecast. Prints a ggplot2 with panels for trend, 
  # weekly and yearly seasonalities if present, and holidays if present
  plot2 = prophet_plot_components(result, fcst)
  # plot2 = plot2 + labs(title = paste(regionname, state))
  # plot(plot2)
  return(list(prophet = result, plot1 = plot1, plot2 = plot2))
}

myresult <- citycast(type = "ZRI All Homes", state = "CT", regionname = "Andover")
myresult[[2]]
