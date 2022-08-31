
#library(here)
library(readr)
#library(janitor)
library(dplyr)
#library(ggplot2)
library(plotly)

# to use the pipes, need to import plyr, tidyverse or magrittr


#
# EXTRACTION
#

csv_filepath <- "https://raw.githubusercontent.com/emse-eda-gwu/2022-Fall/main/data/lotr_words.csv"
df <- readr::read_csv(csv_filepath)

print(df)

#
# AGGREGATIONS
#

words_by_race <- df %>%
  group_by(Race) %>%
  #summarise(words_female = sum(Female)) %>%
  #summarise(words_male = sum(Male)) %>%
  #summarise(words_total = words_male + words_female) %>%
  summarise(
    words_female = sum(Female),
    words_male = sum(Male),
    words_total = sum(Female) + sum(Male)
  ) %>%
  arrange(Race)

print(words_by_race)

#
# DATAVIZ
#

chart_title <- "LOTR Word Frequencies by Character Race"

fig <- plot_ly(
          y = words_by_race$Race,
          x = words_by_race$words_total,
          type = 'bar',
          orientation = 'h'
      ) %>% layout(
        title = chart_title,
        xaxis = list(title = "Total Words"),
        yaxis = list(
          title = "Race",
          categoryorder = "total ascending" # descending
        )
      )


fig
