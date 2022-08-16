
# Learning R

Course Prep: https://jhelvy.github.io/r4aPrimer/L0-course-prep.html

## Installation

### In the Cloud

Sign up for cloud r studio account: https://rstudio.cloud/

How to clear the console / start over? `ctrl + L`

https://support.rstudio.com/hc/en-us/articles/200404846-Working-in-the-Console-in-the-RStudio-IDE


### Local Development

Install R:


```sh
brew install r
```

## Package Management

Installing:

```r
install.packages("packagename")
```

Importing:

```r
library("packagename")
```

Inspecting:

```r
library()
library("packagename")
```

Invoking:

```r
provided_func()

# or ...
packagename::provided_func()
```




## Language Overview

https://jhelvy.github.io/r4aPrimer/L1-getting-started.html

### Printing and logging

No explicit print / log statement needed?


### Variables

Assignment:

```r
x <- 2
```

### User Inputs

```r
user_name <- readline(prompt="Enter name: ")
user_name
```

### Environment Variables


Use ".Renviron" file like a ".env" file:

```sh
ALPHAVANTAGE_API_KEY="abc123"
MY_MESSAGE="super secret"
```

```r
secret_message <- Sys.getenv("SECRET_MESSAGE")
secret_message
```

Alternative, using ".env" file approach:

```r
install.packages("dotenv")

library(dotenv)

secret_message <- Sys.getenv("SECRET_MESSAGE")
secret_message
```

### Logical Operators

Same as Python. Except instead of `and` and `or`, use `&` and `|` like Ruby.

### Conditionals

IF statement sytax is like JavaScript:

```r
if (expression) {
  statement
}
```

```r
if (2+2 == 4) {
  message <- "YEP"
} else {
  message <- "NOPE"
}
message
```

### Datatypes


```r
typeof(TRUE) #> "logical"
typeof(FALSE) #> "logical"

typeof("hello") #> "character"


typeof(3.0)  #> "double"
typeof(3)  #> "double"
typeof(3L) #> finally "integer"
```

null / other values?

```r
typeof(Inf) #> "double"
typeof(NaN) #> "double"
typeof(NULL) #> "NULL"


```

Datatype conversions:

```r
as.numeric("3.14") * 100 #> 314
as.integer(3.14) #> 3

as.character(3.14)
```

Datatype comparisons:

```r
is.numeric(3.14)

!is.null(x)
```

> COOL!


#### Vectors (Arrays)

```r
x <- c(1, 2, 3)

length(x)
```

```r
mean(x)
median(x)
max(x)
min(x)
sum(x)
prod(x)
```

Vector Comparison:

```r
x <- c(1,2,3)
y <- c(1,2,3)
x == y #> TRUE TRUE TRUE

all(x == y) #> TRUE
```

String Vector Concatenation:

```r
stringVector <- c('hello', 'world')

length(stringVector) #> 2

# INDEXES START AT 1 !?
stringVector[1] #> "hello"
stringVector[2] #> "hello"

typeof(stringVector) #> "character"
is.vector(stringVector) #> TRUE

library(stringr)
y <- str_c(stringVector, collapse = ' ')
typeof(y) #> "character"
is.vector(stringVector) #> TRUE

is.vector("HELLO") #> TRUE
```

Vector operations perform matrix multiplication:

```r
x = c(1,2,3)
y = c(10, 10, 10)

X + y #> 11, 12, 13
x * y #> 10, 20, 30
```

Sorting vectors (not mutating):
```r
a = c(2, 4, 6, 3, 1, 5)

sort(a)

sort(a, decreasing = TRUE)
```


### Data Frames

https://jhelvy.github.io/r4aPrimer/L3-data-frames.html

See [teams.r](teams.r)

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

See [stocks.r](stocks.r) file.



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


See [sales.r](sales.r) file.
