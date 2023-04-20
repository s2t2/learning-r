
install.packages("rvest")

library(tidyverse)
library(rvest)

request_url = "https://quotes.toscrape.com"

page = read_html(request_url)
quotes = page %>% html_nodes(".quote")

# for a given quote:
#quote_text = quotes[[1]] %>% html_nodes(".text") %>% html_text()
#author_name = quotes[[1]] %>% html_nodes(".author")  %>% html_text()
#author_path <- quotes[[1]] %>% html_element("a") %>% html_attr("href")
#author_url <- paste(request_url, author_path, sep="")
#cat(quote_text, "\n -", author_name, "\n", author_url)

# for all quotes:
for(quote in quotes){
    quote_text = quote %>% html_nodes(".text") %>% html_text()
    author_name = quote %>% html_nodes(".author")  %>% html_text()
    author_path <- quote %>% html_element("a") %>% html_attr("href")
    author_url <- paste(request_url, author_path, sep="")
    cat("\n--------------------\n")
    cat(quote_text, "\n -", author_name, "...", author_url)
}
