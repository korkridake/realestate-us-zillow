# Understanding Real Estate Market Through Zillow Economic Data: a Time-Series and Machine Learning Approach

## Abstract

Zillow is an online real estate database company storing data on 110 million homes across the United States not just those homes currently for sale. In particular, Zillow’s economic research team has been collecting and publishing the housing and economic data from a variety of public and proprietary sources filled with local municipalities, deeds, property facts, parcel information, and transactional histories. This article takes a data-driven approach to analyzing the US real estate market, attempting to use forecasting algorithms like Prophet and Long Short-Term Memory Network (LSTM) to anticipate home and rent values.

**Keywords**: Zillow, Zillow API, Real Estate, Machine Learning, AI, Deep Learning, Time Series, Forecasting, LSTM Neural Network

## Research Questions and Hypothesis

1. How do different types of housing in different regions vary in home value, rent value, and other important indices? 
2. What are the important factors and metrics in determining Zillow Home Value Index as well as Zillow Rent Value Index? How reliable is Zillow Estimate?

## Data

Zillow publishes a gigantic amount of variables useful in better understanding the housing market with timely, accurate, and unbiased manner. Zillow Home Value Index (ZHVI) is a smoothed, seasonally adjusted measure of the median estimated home value across a given region and housing type. It is a dollar-denominated alternative to repeat-sales indices. Zillow also publishes home value and other housing data for local markets, as well as a more detailed methodology and a comparison of ZHVI to the S&P CoreLogic Case-Shiller Home Price Indices. Zillow provides data on sold homes, including median sale price for various housing types, sale counts and a normalized view of sale volume, referred to as turnover. Foreclosures also are provided as ratio of housing stock and as a share of all sales in which the home was previously foreclosed upon. There are current and historical for-sale listings data, generally from 2012 to current, ranging from median list prices and inventory counts to share of listings with a price cut, median price cut size, age of inventory, and the days a listing spent on Zillow before the sale was final. Moreover, I also have Zillow Rent Index (ZRI), which is a smoothed, seasonally adjusted measure of the median estimated market rate rent across a given region and housing type. ZRI is a dollar-denominated alternative to repeat-rent indices. 

For housing type definitions, All Homes: Zillow defines all homes as single-family, condominium and co-operative homes with a county record. Unless specified, all series cover this segment of the housing stock. Condo/Co-op: Condominium and co-operative homes. Multifamily 5+ units: Units in buildings with 5 or more housing units, that are not a condominiums or co-ops. Duplex/Triplex: Housing units in buildings with 2 or 3 housing units.Tiers: By metro, I determine price tier cutoffs that divide the all homes housing stock into thirds using the full distribution of estimated home values. I then estimate real estate metrics within the property sets, Bottom, Middle, and Top, defined by these cutoffs. When reported at the national level, all Bottom Tier homes defined at the metro level are pooled together to form the national bottom tier. The same holds for Middle and Top Tier homes. 

In terms of regional availability, Zillow metrics are reported for common US geographies including Nation, State, Metro (2013 Census Defined CBSAs), County, City, ZIP code, and Neighborhood. I provide a crosswalk between colloquial Zillow region names and federally defined region names and linking variables such as County FIPS codes and CBSA codes. Cities and Neighborhoods do not match standard jurisdictional boundaries. Zillow city boundaries reflect mailing address conventions and so are often visually similar to collections of ZIP codes.

## Model Training

* [Prophet | Forecasting at scale.](https://facebook.github.io/prophet/) - a procedure for forecasting time series data based on an additive model where non-linear trends are fit with yearly, weekly, and daily seasonality, plus holiday effects. It works best with time series that have strong seasonal effects and several seasons of historical data. Prophet is robust to missing data and shifts in the trend, and typically handles outliers well.
* LSTM Recurrent Neural Networks - a recurrent neural network that is trained using backpropagation through time and overcomes the vanishing gradient problem in search of the state-of-the-art forecasting result.

## Model Evaluation

For this forecasting task, I rely upon Root Mean Squared Error (RMSE), which is a measure of how the residuals are spreaded out. 

## Additional Resources

* [Housing Data - Zillow Research](https://www.zillow.com/research/data/)
* [Home - Zillow Research](https://www.zillow.com/research/)
* [Prophet | Forecasting at scale.](https://facebook.github.io/prophet/)