
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

fig <- plot_ly(
          y = words_by_race$Race,
          x = words_by_race$words_total,
          type = 'bar',
          orientation = 'h'
      ) %>% layout(
        title = "LOTR Word Frequencies by Character Race",
        xaxis = list(title = "Total Words"),
        yaxis = list(
          title = "Race",
          categoryorder = "total ascending" # descending
        )
      )

fig


# stacked bar
# https://plotly.com/r/bar-charts/

#Animals <- c("giraffes", "orangutans", "monkeys")
#SF_Zoo <- c(20, 14, 23)
#LA_Zoo <- c(12, 18, 29)
#data <- data.frame(Animals, SF_Zoo, LA_Zoo)
#
#fig <- plot_ly(data, x = ~Animals, y = ~SF_Zoo, type = 'bar', name = 'SF Zoo')
#fig <- fig %>% add_trace(y = ~LA_Zoo, name = 'LA Zoo')
#fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack')
#fig


fig <- plot_ly(
          y = words_by_race$Race,
          type = 'bar',
          orientation = 'h',

          x = words_by_race$words_female,
          name = 'Female',

      ) %>% add_trace(
          x = words_by_race$words_male,
          name = 'Male'
      ) %>% layout(
        title = "LOTR Word Frequencies by Character Gender and Race",
        xaxis = list(title = "Word Count"),
        yaxis = list(
          title = "Race",
          categoryorder = "total ascending" # descending
        ),
        barmode = 'stack'
      )

fig
