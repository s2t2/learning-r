


#library(here)
#library(readr)
#library(janitor)
#library(dplyr)
library(ggplot2)


# GG PLOT
# https://ggplot2.tidyverse.org/
# https://github.com/rstudio/cheatsheets/blob/main/data-visualization-2.1.pdf


df <- ggplot2::mpg

print(df)

df %>%
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  theme_classic()
