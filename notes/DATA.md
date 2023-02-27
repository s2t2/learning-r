
## Language Overview, Part II

### Data Frames

https://jhelvy.github.io/r4aPrimer/L3-data-frames.html

See [teams.r](/scripts/teams.r)

```r
teams <- data.frame(
    city   = c("Boston", "New York", "New York", "New Haven"),
    name    = c("Red Sox", "Yankees", "Mets", "Ravens"),
    league  = c("major", "major", "major", "minor")
)
```

```r
teams$city #>  "Boston"    "New York"  "New York"  "New Haven"
teams$city[1] #> "Boston
```



Inspecting / previewing the rows:

```r
View(teams)

head(teams)

tail(teams)

glimpse(teams)

summary(teams)
```

Smarter Data Frames:

```r
# install.packages('dplyr')
library(dplyr)

teams <- dplyr::tibble(
  city   = c("Boston", "New York", "New York", "New Haven"),
  name    = c("Red Sox", "Yankees", "Mets", "Ravens"),
  league  = c("major", "major", "major", "minor")
)
length(teams)
```

```r
teams$city #>
teams$city[1] #> "Boston"
```




## CSV Files


Create new test CSV file called [gradebook.csv](https://raw.githubusercontent.com/prof-rossetti/intro-to-python/main/data/gradebook.csv)

```r
library(here)
library(readr)

# csv_filepath = here('data', 'gradebook.csv')
csv_filepath = here('gradebook.csv')  #> "/cloud/project/gradebook.csv"
gradebook_df <- read_csv(csv_filepath)

grades = gradebook_df$final_grade
min(grades)
max(grades)
```


## Dataviz


```r
plot(x = gradebook_df$student_id, y = gradebook_df$final_grade)

hist(x = gradebook_df$final_grade)

# https://www.geeksforgeeks.org/r-bar-charts/
barplot(gradebook_df$final_grade, main="Title", xlab="X Axis", ylab="Y Axis")
```

See [stocks.r](/scripts/stocks.r) file.


### GGplot

  + https://www.rdocumentation.org/packages/ggplot2/versions/3.3.6
  + https://ggplot2.tidyverse.org/reference/


## Wrangling

```r
df %>%
  filter(!is.na(height)) %>%
  group_by(state) %>%          # Here we're grouping by state
  mutate(mean_height = mean(height)) %>%
  select(state, mean_height)
```

## Grouping / Aggregation

https://jhelvy.github.io/r4aPrimer/L4-data-wrangling.html#31_The_group_by()_function


See [sales.r](/scripts/sales.r) file.
