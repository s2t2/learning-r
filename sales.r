library(here)
library(readr)
library(dplyr)
library(ggplot2)

# EXTRACTION

csv_filepath = "https://raw.githubusercontent.com/prof-rossetti/intro-to-python/main/data/monthly-sales/sales-201803.csv"
sales_df <- read_csv(csv_filepath)

# GROUPING / AGGREGATION

sales_df$sales_price <- sales_df$"sales price"

# help?

products_pivot <- sales_df %>%
  group_by(product) %>%   
  mutate(sales_total = sum(sales_price)) %>%
  select(product, sales_total)

View(products_pivot)

# DATAVIZ

# todo: make a horizontal bar chart
