
# https://stackoverflow.com/questions/30711019/better-string-interpolation-in-r
# https://www.alphavantage.co/documentation/#dailyadj
# https://plotly.com/r/line-charts/
# https://plotly.com/r/reference/layout/xaxis/

# install.packages("here")
# install.packages("readr")
# install.packages("plotly")

library(glue)
library(here)
library(readr)
#library(dplyr)
library(plotly)


api_key <- Sys.getenv("ALPHAVANTAGE_API_KEY")
#if (api_key == "") {
#  api_key <- "demo"
#  # todo: quit the program
#  #stop("OOPS, please supply a valid api key")
#  stop()
#  quit()
#}





symbol <- "NFLX"
#symbol <- readline(prompt="Select a stock symbol (e.g 'NFLX'): ")
#if (symbol == "") {
#  symbol <- "NFLX"
#}

# READ CSV FILE

csv_filepath <- glue::glue("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol={symbol}&apikey={api_key}&datatype=csv")
prices_df <- readr::read_csv(csv_filepath)
#View(prices_df)
#spec(prices_df)
#head(prices_df)

# DATAVIZ

chart_title <- glue::glue("Stock Prices ({symbol})")

#fig <- plot_ly(prices_df, x = ~timestamp, y = ~adjusted_close, type = 'scatter', mode = 'lines')

fig <- plot_ly(prices_df,
                  x = ~timestamp,
                  y = ~adjusted_close,
                  type = 'scatter',
                  mode = 'lines'
        ) %>% layout(
                  title = chart_title,
                  xaxis = list(title = "Date"),
                  yaxis = list(title = "Closing Price (USD)")
        )

fig









#
# EXPORT IMAGE (JK DO THIS MANUALLY)
#
#
#img_filepath = glue::glue("prices_{symbol}.png")
#img_filepath = here(img_filepath)
#
# library(webshot)
#> Error in library(webshot) : there is no package called ‘webshot’
# export(fig, file = img_filepath)
#> Error: Package `webshot` required for `export`.
#> Please install and try again.
#> In addition: Warning message:
#>   'export' is deprecated.
#> Use 'orca' instead.
#> See help("Deprecated")


# Error: The orca command-line utility is required for this functionality.
#if (!require("processx")) install.packages("processx")
# orca(fig, img_filepath)

# install.packages("kaleido")
#> Warning in install.packages :
#> package ‘kaleido’ is not available for this version of R
# library(kaleido)
# kaleido(fig, img_filepath)
