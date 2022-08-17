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
print(typeof(teams$city)) #> character
print(length(teams$city)) #> 4
print(teams$city[1]) #> "Boston"

# cat (concatenate, can print multiple things, just display)
cat("HELLO", "WORLD", sep=" --- ")

# string concat (OPERATION):
paste("HELLO", "WORLD")
x <- paste("HELLO", "WORLD")
x


#print(head(teams))


as.data.frame(teams)
