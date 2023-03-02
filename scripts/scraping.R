# WEB SCRAPING IN R
# ... https://r4ds.hadley.nz/webscraping.html
# ... https://rvest.tidyverse.org/
# ... https://rvest.tidyverse.org/reference/index.html

install.packages("rvest")

library(rvest)







# 1) Intro to html (most people don't know the syntax) & how to parse html for data.
# ... Need an example of a simple, static page with a nice table of data to scrape out of it.
# ... https://raw.githubusercontent.com/prof-rossetti/intro-to-python/main/data/my_lists.html
# ... https://raw.githubusercontent.com/prof-rossetti/intro-to-python/main/data/my_tables.html

# 1A) HTML LISTS

lists_page <- read_html("https://raw.githubusercontent.com/prof-rossetti/intro-to-python/main/data/my_lists.html")

# GET ALL MATCHING ELEMENTS:
# flavors_list <- lists_page %>% html_elements("ol")
#> xml_nodeset

# GET FIRST MATCHING ELEMENT:
# flavors_list <- lists_page %>% html_element("ol")
#> html_node

# GET FIRST ELEMENT BY ID
flavors_list <- lists_page %>% html_node("#my-fav-flavors")
#> html_node

# CHILDREN / TRAVERSING
flavor_items <- flavors_list %>% html_children
#> xml_nodeset

flavors <- flavor_items %>% html_text # html_attr("data-id")

cat(flavors[1], "\n")
cat(flavors[2], "\n")
cat(flavors[3], "\n")




# 1B) HTML TABLES

tables_page <- read_html("https://raw.githubusercontent.com/prof-rossetti/intro-to-python/main/data/my_tables.html")

# GET FIRST MATCHING ELEMENT:
# products_table <- tables_page %>% html_element("table")
#> html_node

# GET FIRST ELEMENT BY ID
products_table <- tables_page %>% html_node("#products")
#> html_node

# TABLE MAGIC (NEED TO KNOW ABOUT DATAFRAMES)
# products_df <- products_table %>% html_table() #> TIBBLE / DATAFRAME
# products_df["Name"]


# GET ALL CHILD ELEMENTS
# product_rows <- products_table %>% html_children()

# GET SPECIFIC CHILD ELEMENTS
product_rows <- products_table %>% html_elements("tr")

#products <- c() # tried this, but can't store a vector in a vector, so using a list instead
products_list <- list()
counter <- 1 # using a counter to store items in the list
# in this example the first row has header names, so let's remove the first item from the list with [-1]
for (row in product_rows[-1]) {
    # get child "td" elements which contain the table data:
    cells <- row %>% html_elements("td")
    # parse the cells one at a time and format the data:
    product_id <- cells[1] %>% html_text() %>% readr::parse_integer()
    product_name <- cells[2] %>% html_text()
    product_price <- cells[3] %>% html_text() %>% readr::parse_double()

    # assemble our own named vector (i.e. dictionary):
    product <- c("id"=product_id, "name"=product_name, "price"=product_price)
    cat(product, "\n")
    # collect for later:
    #append(products, product)
    #cat(length(products), "\n")
    #append(products_list, product)
    products_list[counter] <- product # this works but we get a warning
    counter <- counter + 1
}

cat("\n", products)


# 1C)
# http://bulletin.gwu.edu/courses/emse/

emse_page <- read_html("http://bulletin.gwu.edu/courses/emse/")

course_divs <- emse_page %>% html_nodes(".courseblock")

for(div in course_divs){
    cat("----------------------", "\n")
    title_block <- div %>% html_node(".courseblocktitle")  %>% html_text()
    #> EMSE 6845. Lean and Agile Systems Engineering. 3 Credits.
    cat(title_block, "\n")

    desc_block <- div %>% html_node(".courseblockdesc") %>% html_text()
    #> Lean and agile methods as applied to the engineering design and development of systems; review of contemporary implementation frameworks, methodologies, and the tools used to support them. Implications for traditional systems engineering; fundamental changes to the requirements processes; implications for engineering management. Prerequisite:
    cat(desc_block, "\n")

}



# 2) Scraping data from multiple pages.
# ... Need an example where you have to loop through pages and extract the data on each one.
# ... Best if it's a simple static site where you can  just change the url to get a new page
# ... https://github.com/s2t2/gwu-courses-py
# ... https://my.gwu.edu/mod/pws/courses.cfm?campId={self.campus_id}&termId={self.term_id}&subjId={self.subject_id}
# ... https://my.gwu.edu/mod/pws/courses.cfm?campId=1&termId=202301&subjId=EMSE
# ... JK gw courses pagination requires a click (:-/)
# ...
# ... https://www.gutenberg.org/ebooks/author/65 # SHAKESPEARE
# ... https://www.gutenberg.org/ebooks/author/50533 # HEMMINGWAY
# ... JK not very interesting
#
# ... GW BULLETIN IS MAYBE BETTER:
# http://bulletin.gwu.edu/courses/emse/
# http://bulletin.gwu.edu/courses/csci/

subjects <- c("EMSE", "CSCI")

for(subject in subjects){
    cat("----------------------", "\n")
    cat(subject)

    page <- read_html(paste("http://bulletin.gwu.edu/courses/", tolower(subject), sep=""))
    course_divs <- page %>% html_nodes(".courseblock")

    for(div in course_divs){
        cat("---", "\n")
        title_block <- div %>% html_node(".courseblocktitle")  %>% html_text()
        #> EMSE 6845. Lean and Agile Systems Engineering. 3 Credits.
        cat(title_block, "\n")
        # TODO: split on period, get course_id, course_title, n_credits

        desc_block <- div %>% html_node(".courseblockdesc") %>% html_text()
        #> Lean and agile methods as applied to the engineering design and development of systems; review of contemporary implementation frameworks, methodologies, and the tools used to support them. Implications for traditional systems engineering; fundamental changes to the requirements processes; implications for engineering management. Prerequisite:
        cat(desc_block, "\n")

    }

}

# 3) Simple API example (if there's time).
# ...
# ... see stocks.R script if the data is in CSV format
#
# ... otherwise if in JSON format, can use httr
# ... https://www.rdocumentation.org/packages/httr/versions/1.4.5
# ... https://www.rdocumentation.org/packages/httr/versions/1.4.5/topics/GET


install.packages("httr")

# https://www.thecocktaildb.com/api.php
# https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic
#> {"drinks": [{}, {}, ... {}]}

drinks_response <- httr::GET(url="https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic")
cat(typeof(drinks_response), "\n")

drinks_data <- drinks_response %>% httr::content()
cat(typeof(drinks_data), "\n")
cat(names(drinks_data), "\n")
#> named list with "drinks" key

drinks_list <- drinks_data["drinks"]
cat(typeof(drinks_list), "\n")
cat(length(drinks_list), "\n") #> why 1?

drinks <- drinks_list[[1]]
cat(typeof(drinks), "\n")
cat(length(drinks), "\n") #> 58

for (drink in drinks[1:5]){
    #print(drink) #> list
    d <- drink[[1]]
    #> make a named vector (i.e. dictionary) so we can actually reference the keys
    #drink_id <- drink["idDrink"]
    #drink_name <- drink["strDrink"]
    #drink_image_url <- d["strDrinkThumb"]
    # ARG OK, the values are lists too? SO ANNOYING...
    drink_id <- drink["idDrink"][[1]]
    drink_name <- drink["strDrink"][[1]]
    drink_image_url <- d["strDrinkThumb"][[1]]

    cat(drink_id, drink_name, "\n")
}


# MORE API PRACTICE

# https://www.alphavantage.co/documentation/#unemployment
# 

api_key <- "demo" # TODO: use environment variables if you want to securely specify your own API Key credential
unemployment_url <- paste("https://www.alphavantage.co/query?function=UNEMPLOYMENT&apikey=", api_key, sep="")
unemployment_response <- httr::GET(url=unemployment_url)
parsed_response <- unemployment_response %>% httr::content()
cat(typeof(parsed_response)) #> list
cat(names(parsed_response)) #> "name"     "interval" "unit"     "data"    

typeof(parsed_response["name"]) #> list ARG
cat(parsed_response["name"][[1]])

#clean_data <- list()
#counter <- 1
unemployment_data <- parsed_response["data"][[1]]
for (datapoint in unemployment_data[1:3]){
    #cat(typeof(datapoint), "\n") #> list
    #print(names(datapoint)) #> "date"  "value"
    the_date <- datapoint["date"][[1]]
    the_rate <- datapoint["value"][[1]]
    cat(the_date, the_rate, "\n")
    #clean_datapoint <- c("date"=the_date, "rate"=the_rate)
    #clean_data[counter] <- clean_datapoint
    #counter <- counter + 1
}

clean_data[1]


