
# https://stackoverflow.com/questions/30711019/better-string-interpolation-in-r
# https://www.alphavantage.co/documentation/#dailyadj
# https://plotly.com/r/line-charts/

library(glue)
library(readr)
#library(dplyr)
library(plotly)

# how to get environment variable / user input?
api_key <- "demo" # ask for premium key

# how to ask for user input?
symbol <- "NFLX"

# READ CSV FILE

csv_filepath <- glue::glue("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol={symbol}&apikey={api_key}&datatype=csv")

prices_df <- read_csv(csv_filepath)

View(prices_df)

# DATAVIZ

chart_title <- glue::glue("Stock Prices ({symbol})")

#fig <- plot_ly(prices_df, x = ~timestamp, y = ~adjusted_close, type = 'scatter', mode = 'lines')

# how to do this without the pipe?

fig <- plot_ly(prices_df, x = ~timestamp, y = ~adjusted_close, type = 'scatter', mode = 'lines') %>% layout(title = chart_title)

fig
