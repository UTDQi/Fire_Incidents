#### Preamble ####
# Purpose: Simulates the dollar loss vs. number of responding personnel data
# Author: David Qi
# Date: 26 September 2024
# Contact: david.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(sigmoid)

#### Simulate data ####
set.seed(304)

number_of_incidents <- 100
#let's assume [Dollar loss] = 10000 * 2^(-[number of Responding Personnel]) + error
#error ~ N(0,10000)
# [number of Responding Personnel] ~ geom(p = 0.2)

data <-
  tibble(
    number_of_responding_personnel = rgeom(number_of_incidents, prob = 0.2)
    ,
    incident_id = c(1:number_of_incidents),
    dollar_loss = relu(10000* 2^(-number_of_responding_personnel) + rnorm(number_of_incidents,0,100))
  )


#### Write_csv
write_csv(data, file = "data/raw_data/simulated.csv")



