# install.packages("stringr")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("readr")
# install.packages("here")
library(dplyr)
library(stringr)
library(ggplot2)
library(readr)
library(here)

# Beatles data:
beatles <- tibble(
    firstName   = c("John", "Paul", "Ringo", "George"),
    lastName    = c("Lennon", "McCartney", "Starr", "Harrison"),
    instrument  = c("guitar", "bass", "drums", "guitar"),
    yearOfBirth = c(1940, 1942, 1940, 1943),
    deceased    = c(TRUE, FALSE, FALSE, TRUE)
)

# Practice 1 ------------------------------

animals_farm <- tibble(
    name           = c("cow", "horse"),
    sound          = c("moo", "neigh"),
    aveWeightLbs   = c(2400, 1500),
    aveLifeSpanYrs = c(20, 25)
)

animals_pet <- tibble(
    name           = c("dog", "cat"),
    sound          = c("woof", "meow"),
    aveWeightLbs   = c(40, 8),
    aveLifeSpanYrs = c(10, 12)
)

# Write code to find how many rows are in the animals_farm data frame?
nrow(animals_farm)

# Write code to find how many columns are in the animals_pet data frame?
ncol(animals_pet)

# Create a new data frame, animals, by combining animals_farm and animals_pet.
animals <- bind_rows(animals_farm, animals_pet)

# Change the column names of animals to title case.
names(animals) <- str_to_title(names(animals))
animals

# Add a new column to animals called type that tells if an animal is a "farm" 
# or "pet" animal.
animals$type <- c("farm", "farm", "pet", "pet")

# Could also do this:
type <- data.frame(type = c("farm", "farm", "pet", "pet"))
bind_cols(animals, type)



# Practice 2 ------------------------------

beatles <- tibble(
    firstName   = c("John", "Paul", "Ringo", "George"),
    lastName    = c("Lennon", "McCartney", "Starr", "Harrison"),
    instrument  = c("guitar", "bass", "drums", "guitar"),
    yearOfBirth = c(1940, 1942, 1940, 1943),
    deceased    = c(TRUE, FALSE, FALSE, TRUE)
)

# 1. Create a new column, playsGuitar, which is TRUE if the band member
#    plays the guitar and FALSE otherwise.

beatles$instrument == "guitar"
str_detect(beatles$instrument, "guitar")

beatles$playsGuitar <- beatles$instrument == "guitar"

# 2. Filter the data frame to select only the rows for the band members
#    who have four-letter first names.

beatles[str_length(beatles$firstName) == 4,]

# 3. Create a new column, fullName, which contains the band member's
#    first and last name separated by a space (e.g. "John Lennon")

beatles$fullName <- paste(beatles$firstName, beatles$lastName, sep = " ")




# Practice 3 ------------------------------

# Read in the data
pathToData <- here('data', 'data.csv')
df <- read_csv(pathToData)

# How many rows and columns are in the data frame?
dim(df)
nrow(df)
ncol(df)

# What type of data is each column?
glimpse(df)

# Preview the different columns - what do you think this data is about?
# What might one row represent?

# How many unique airports are in the data frame?
length(unique(df$airport_id))
length(unique(df$airport))

# What is the earliest and latest observation in the data frame?
min(df$incident_date)
max(df$incident_date)

# What is the lowest and highest cost of any one repair in the data frame?
min(df$cost_repairs_infl_adj, na.rm = TRUE)
max(df$cost_repairs_infl_adj, na.rm = TRUE) / 10^6
