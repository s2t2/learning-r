# install.packages("dplyr")

library(dplyr)

teams <- dplyr::tibble(
  city   = c("Boston", "New York", "New York", "New Haven"),
  name    = c("Red Sox", "Yankees", "Mets", "Ravens"),
  league  = c("major", "major", "major", "minor")
)

#View(teams)
head(teams)
#tail(teams)
#glimpse(teams)
#summary(teams)

# typeof(teams) #> list
# length(teams) #> 3 IS THIS A ROWS COUNT?

# typeof(teams["city"]) #> list
# length(teams["city"]) #> 1 WAT?

# use this syntax:
typeof(teams$city) #> character
length(teams$city) #> 4
teams$city[1] #> "Boston"
