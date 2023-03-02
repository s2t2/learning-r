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

# 2) Scraping data from multiple pages. 
# ... Need an example where you have to loop through pages and extract the data on each one. 
# ... Best if it's a simple static site where you can  just change the url to get a new page
# ... https://github.com/s2t2/gwu-courses-py
# ... https://my.gwu.edu/mod/pws/courses.cfm?campId={self.campus_id}&termId={self.term_id}&subjId={self.subject_id}
# ... https://my.gwu.edu/mod/pws/courses.cfm?campId=1&termId=202301&subjId=EMSE
# ... JK gw courses pagination requires a click (:-/)

# ...

# 3) Simple API example (if there's time).




