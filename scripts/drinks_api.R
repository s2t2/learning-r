
# Simple API example 
# ... if data is in JSON format, can use httr
# ... https://www.rdocumentation.org/packages/httr/versions/1.4.5
# ... https://www.rdocumentation.org/packages/httr/versions/1.4.5/topics/GET

# Example API:
# ... https://www.thecocktaildb.com/api.php
# ... https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic
#> {"drinks": [{}, {}, ... {}]}

install.packages("httr")

library(httr)
library(tidyverse)

request_url <- "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
response <- httr::GET(url=drinks_url)
cat(typeof(response), "\n") #> list

data <- response %>% httr::content()
cat(typeof(data()), "\n") #> list
cat(names(data), "\n") #> named list has "drinks" key

drinks_list <- data["drinks"]
cat(typeof(drinks_list), "\n") #> list

drinks <- drinks_list[[1]]
cat(typeof(drinks), "\n") #> list
cat(length(drinks), "\n") #> 58

# OK we finally have the list of drink records...

# drinks[[1]]
# drinks[[1]][["idDrink"]]

for (drink in drinks){
    
    drink_id <- drink["idDrink"][[1]]
    drink_name <- drink["strDrink"][[1]]
    drink_image_url <- drink["strDrinkThumb"][[1]]
    
    cat(drink_id, drink_name, "\n")
}

# TODO: collect all drinks in a dataframe!

