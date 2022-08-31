


#library(here)
#library(readr)
#library(janitor)
#library(dplyr)
library(ggplot2)


# GG PLOT
# https://ggplot2.tidyverse.org/
# https://github.com/rstudio/cheatsheets/blob/main/data-visualization-2.1.pdf
# trend line: https://www.statology.org/ggplot-trendline/

df <- ggplot2::mpg

print(df)

#df %>%
#  ggplot(aes(
#      x = displ, 
#      y = hwy,
#      color = class
#  )) +
#  geom_point() +
#  geom_smooth() +
#  theme_classic()
#



df %>%
  ggplot(
    mapping = aes(x = displ, y = hwy)
  ) +
  geom_point(
    mapping = aes(color = class)
  ) +
  geom_smooth(
    #se = FALSE
  ) +
  theme_classic()
