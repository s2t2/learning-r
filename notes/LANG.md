
# Learning R

Course Prep: https://jhelvy.github.io/r4aPrimer/L0-course-prep.html

## Language Overview, Part I

https://jhelvy.github.io/r4aPrimer/L1-getting-started.html

### Printing and logging

Can use `cat` function with a newline character to print:

```r
cat("HELLO", "\n")
cat("WORLD")
#> HELLO
#> WORLD
```

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

### Functions

```r

# defining:
enlarge <- function(n){
  
  cat("ENLARGING...\n")
  
  return(n * 100)
}

# invoking:
enlarge(5)


# testing:
stopifnot(enlarge(5) == 500)
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

Creating vectors using the `c` function:

```r
x <- c(1, 2, 3)

```

Counting number of items in the vector:

```r
length(x)
```

Other summary / aggregation functions that accept a vector:

```r
mean(x)
median(x)

max(x)
min(x)

sum(x)
prod(x)
```

Vector accessors (index starts at 1 !?):

```r
a = c(2, 4, 6, 3, 1, 5)

a[0]
#> numeric(0)

a[1]
#> 2

a[2]
#> 4
```

Negative indexes mean "all items except this one":

```r
a[-2]

#> 2 6 3 1 5

a[-3]
#> 2 4 3 1 5
>
```

Slicing works like other languages (except indices start at 1):

```r
a[1:4]
#> 2 4 6 3
```


Vector Comparison:

```r
x <- c(1,2,3)
y <- c(1,2,3)
x == y #> TRUE TRUE TRUE

all(x == y) #> TRUE
```

Vector inclusion:

```r
3 %in% x
#> TRUE
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

Operations with vectors and scalars:

```r
x <- c(1, 2, 3)

x + 4
#> 5 6 7

x * 10
#> 10 20 30
```

Operations with vectors and vectors:

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

Concatenating vectors:

```r
x = c(1,2,3)
a = c(2, 4, 6, 3, 1, 5)

c(x,a)
#>  1 2 3 2 4 6 3 1 5
```

Appending to a vector, using functional style:

```r
x = c(1,2,3)

append(x, 4)
#> 1 2 3 4
```

#### Named Vectors (Dictionary Like)

```r
x <- c("a"=10, "b"=12, "c"=13)

x[0]
#> named numeric(0)
#> WAT? indexes start at 1?

x[1]
#>  a
#> 10

x["a"]
#>  a
#> 10

y <- x["a"] + 10

y
#>  a
#> 20
```

