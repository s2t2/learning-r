# https://github.com/s2t2/learning-r/pull/1/files#diff-bb9f27cbd3a82ad5d7e28a81a7f3b2e548e3eb43b4a4e8edf5a9ff33357b06a0R37-R52
# https://www.r-bloggers.com/2010/02/r-sorting-a-data-frame-by-the-contents-of-a-column/
# https://stackoverflow.com/a/70185712/670433

library(here)
library(readr)
library(janitor)
#library(dplyr)
#library(ggplot2)
library(plotly)

#
# EXTRACTION
#

csv_filepath = "https://raw.githubusercontent.com/prof-rossetti/intro-to-python/main/data/monthly-sales/sales-201803.csv"
sales_df <- read_csv(csv_filepath)

#
# CLEANING :-D
#

# sales_df$sales_price <- sales_df$"sales price"
# sales_df$sales_price <- sales_df$`sales price`

sales_df <- sales_df %>%
  janitor::clean_names()

#
# GROUPING / AGGREGATION
#

# ... BY PRODUCT

sales_by_product <- sales_df %>%
  group_by(product) %>%
  summarise(sales_total = sum(sales_price))

sales_by_product <- sales_by_product[order(sales_by_product$sales_total, decreasing = TRUE),]

# ... BY DAY

sales_by_date <- sales_df %>%
  group_by(date) %>%
  summarise(sales_total = sum(sales_price))

sales_by_date <- sales_by_date[order(sales_by_date$date),]

#
# DATAVIZ
#

# ... BY PRODUCT

chart_title = "Top Selling Products (May 2018)"

fig <- plot_ly(
          x = sales_by_product$sales_total,
          y = sales_by_product$product,
          type = 'bar',
          orientation = 'h'
      ) %>% layout(
        title = chart_title,
        xaxis = list(title = "Total Sales (USD)"),
        yaxis = list(
          title = "Product",
          categoryorder = "total ascending" # descending
        )
      )


fig

# ... BY DAY

chart_title = "Sales by Day (May 2018)"

fig <- plot_ly(
  x = sales_by_date$date,
  y = sales_by_date$sales_total,
  type = 'bar',
) %>% layout(
  title = chart_title,
  xaxis = list(title = "Date"),
  yaxis = list(title = "Total Sales (USD)")
)


fig
