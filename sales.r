library(here)
library(readr)
library(dplyr)
library(ggplot2)

# EXTRACTION

csv_filepath = "https://raw.githubusercontent.com/prof-rossetti/intro-to-python/main/data/monthly-sales/sales-201803.csv"
sales_df <- read_csv(csv_filepath)

# GROUPING / AGGREGATION

sales_df$sales_price <- sales_df$"sales price"

# The above is base R syntax for selecting a column from a data frame: df$col_name 
# If the column name has a space in it (which is shouldn't...bad naming practice), use 
# backticks to access it, like this: 

sales_df$sales_price <- sales_df$`sales price`

# I usually fix issues like this with a single call to a handy function in the 
# janitor package - this will clean up all of the variable names in the data frame:

sales_df <- sales_df %>% 
  janitor::clean_names()

# help?

products_pivot <- sales_df %>%
  group_by(product) %>%   
  mutate(sales_total = sum(sales_price)) %>%
  select(product, sales_total)

# One of the main benefits of the piping approach is to perform operations by group like 
# you've done here. For example, if you just wanted to know the sum of the entire 
# sales_price column, you could simply do this using base R syntax:

sum(sales_df$sales_price)

# But if you want to sum the sales_price by group, it's not so straightforward with 
# base R. This is why the "tidyverse" was created, which is a collection of several 
# packages including dplyr for data wrangling and ggplot2 for plotting (among others).

# One big difference is the functions mutate() and summarise(). In your above pipeline, 
# the mutate() call just addes a new column to the data frame called sales_total. 
# If instead you used summarise(), you'd get a small summary data frame with just 
# two columns back: product (the grouping variable) and sales_total:

sales_df %>%
  group_by(product) %>%   
  summarise(sales_total = sum(sales_price))

View(products_pivot)

# DATAVIZ

# todo: make a horizontal bar chart
