#### Preamble ####
# Purpose: Sanity check of the data
# Author: David Qi
# Date: 26 September 2024
# Contact: david.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: simulated data ready in "data/raw_data/simulated.csv"
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/raw_data/simulated.csv")

# Test2: for negative numbers
flag1 = data$dollar_loss |> min() <= 0
flag2 = data$number_of_responding_personnel |> min() <= 0

if (flag1 | flag2) {
  if(flag1){
    stop("Test 1 failed: negative dollar loss")
  }
  if(flag2){
    stop("Test 1 failed: negative responding personnel")
  }
} else {
  message("Test 1 passed: All values are non-negative.")
}

# Test2: for NAs
flag1 = all(is.na(data$dollar_loss))
flag2 = all(is.na(data$number_of_responding_personnel))

if (flag1 | flag2) {
  if(flag1){
    stop("Test 2 failed: negative dollar loss")
  }
  if(flag2){
    stop("Test 2 failed: negative responding personnel")
  }
} else {
  message("Test 2 passed: All values are not NA.")
}

# Test3: number of personnel is not abnormally high
flag2 = data$number_of_responding_personnel |> max() > 100

if (flag2) {
  message("Warning:There might be a problem in data as number of responding personnel exceeds 100 for one incident")
} else {
  message("Test 3 passed: All number_of_responding_personnel is reasonable.")
}
