#### Preamble ####
# Purpose: To analysis the Detroit data for comparison
# Author: David Qi
# Date: 27 September 2024
# Contact: david.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: Detroit data ready in "data/analysis_data/detroit.csv"
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)

#### analysis ####
det <- read_csv("data/analysis_data/detroit.csv")

det_time = det %>% select(dispatched_at) %>% drop_na()

# Extract year and count incidents
incident_counts <- det_time %>%
  mutate(year = strtrim(dispatched_at, 4)) %>%
  group_by(year) 

yearly_counts <- incident_counts %>%
  group_by(year) %>%
  summarise(Incident_Count = n())

# Plot the number of incidents each year
ggplot(yearly_counts, aes(x = year, y = Incident_Count)) +
  geom_bar(stat = "identity", fill = "blue", color = "black", alpha = 0.7) +
  labs(
    title = "Number of Incidents Each Year",
    x = "Year",
    y = "Number of Incidents"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate x-axis labels if needed

ggsave("Detroit_plot.png")