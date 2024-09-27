#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: David Qi
# Date: 26 September 2024
# Contact: david.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####

# get package
package <- show_package("64a26694-01dc-4ec3-aa87-ad8509604f50")

# get all resources for this package
resources <- list_package_resources("64a26694-01dc-4ec3-aa87-ad8509604f50")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv") 


#### Save data ####
write_csv(data, "data/raw_data/fire_incidents_data_raw.csv") 

         
