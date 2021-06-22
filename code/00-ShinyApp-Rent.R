# ------------------------------------------------------
# Zillow City Times-Series Visualization : Shiny App 
# Date : Wednesday, March, 4, 2018
# Author: Kyle Akepanidtaworn
# ------------------------------------------------------
library(readr)

df.rent.1 <- read_csv("City/City_Zri_AllHomes.csv")
df.rent.2 <- read_csv("City/City_Zri_AllHomesPlusMultifamily.csv")
df.rent.3 <- read_csv("City/City_Zri_MultiFamilyResidenceRental.csv")
df.rent.4 <- read_csv("City/City_Zri_SingleFamilyResidenceRental.csv")
df.rent.5 <- read_csv("City/City_ZriPerSqft_AllHomes.csv")

# Delete SizeRank variable
df.rent.1$SizeRank <- NULL
df.rent.2$SizeRank <- NULL
df.rent.3$SizeRank <- NULL
df.rent.4$SizeRank <- NULL
df.rent.5$SizeRank <- NULL

# Distribution of States
table(df.rent.1$State)
table(df.rent.2$State)
table(df.rent.3$State)

df.rent.1 <- df.rent.1 %>% group_by(State) %>% filter(State == "CT" | State == "VT" | State == "RI" | State == "MA" | 
                  State == "NH" | State == "ME") %>% arrange(-desc(State),  -desc(RegionName))
df.rent.2 <- df.rent.2 %>% group_by(State) %>% filter(State == "CT" | State == "VT" | State == "RI" | State == "MA" | 
                  State == "NH" | State == "ME") %>% arrange(-desc(State),  -desc(RegionName))
df.rent.3 <- df.rent.3 %>% group_by(State) %>% filter(State == "CT" | State == "VT" | State == "RI" | State == "MA" | 
                  State == "NH" | State == "ME") %>% arrange(-desc(State),  -desc(RegionName))
df.rent.4 <- df.rent.4 %>% group_by(State) %>% filter(State == "CT" | State == "VT" | State == "RI" | State == "MA" | 
                  State == "NH" | State == "ME") %>% arrange(-desc(State),  -desc(RegionName))
df.rent.5 <- df.rent.5 %>% group_by(State) %>% filter(State == "CT" | State == "VT" | State == "RI" | State == "MA" | 
                  State == "NH" | State == "ME") %>% arrange(-desc(State),  -desc(RegionName))

# Create an indicator variable
df.rent.1$Rental.Metrics <- "ZRI All Homes"
df.rent.2$Rental.Metrics <- "ZRI All Homes Plus Multi Family"
df.rent.3$Rental.Metrics <- "ZRI Multi Family Residence Rental"
df.rent.4$Rental.Metrics <- "ZRI Single Family Residence Rental"
df.rent.5$Rental.Metrics <- "ZRI Per Sqare Feet of All Homes"

# Reorder the variables
df.rent.1 <- df.rent.1 %>% select(1:5, 94, 6:93)
df.rent.2 <- df.rent.2 %>% select(1:5, 94, 6:93)
df.rent.3 <- df.rent.3 %>% select(1:5, 94, 6:93)
df.rent.4 <- df.rent.4 %>% select(1:5, 94, 6:93)
df.rent.5 <- df.rent.5 %>% select(1:5, 94, 6:93)

# Reshaping data.frame from wide to long format
df.rent.1 <- df.rent.1 %>% gather(year, value, -(1:6))
df.rent.2 <- df.rent.2 %>% gather(year, value, -(1:6))
df.rent.3 <- df.rent.3 %>% gather(year, value, -(1:6))
df.rent.4 <- df.rent.4 %>% gather(year, value, -(1:6))
df.rent.5 <- df.rent.5 %>% gather(year, value, -(1:6))

# Append Dataset
full.data <- rbind(df.rent.1, df.rent.2, df.rent.2, df.rent.3, df.rent.4, df.rent.5)

write_excel_csv(full.data, "kkdata.csv")
